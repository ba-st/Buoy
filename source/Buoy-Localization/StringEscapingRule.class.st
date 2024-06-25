Class {
	#name : 'StringEscapingRule',
	#superclass : 'Object',
	#classVars : [
		'Available'
	],
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'private' }
StringEscapingRule class >> availableRules [

  <ignoreForCoverage>
  Available ifNil: [ Available := SortedCollection sortBlock: [ :a :b | a priority > b priority ] ].
  ^ Available
]

{ #category : 'escaping' }
StringEscapingRule class >> escape: character on: targetStream [

  ^ self availableRules
      detect: [ :rule | rule handlesEscapeOf: character ]
      ifFound: [ :rule | rule escape: character on: targetStream ]
      ifNone: [ targetStream nextPut: character ]
]

{ #category : 'testing' }
StringEscapingRule class >> isAbstract [

  ^ self = StringEscapingRule
]

{ #category : 'rule management' }
StringEscapingRule class >> registerRule: anEscapingRule [

  <ignoreForCoverage>
   self availableRules add: anEscapingRule
]

{ #category : 'escaping' }
StringEscapingRule class >> unescape: aCharacter from: sourceStream on: targetStream [

  ^ self availableRules
      detect: [ :rule | rule handlesUnescapeOf: aCharacter ]
      ifFound: [ :rule | rule unescape: aCharacter from: sourceStream on: targetStream ]
      ifNone: [
          AssertionFailed signal: ( 'There''s no escaping rule for "<1s>" (\u{<2s>})'
                expandMacrosWith: aCharacter asString
                with: ( aCharacter codePoint asHexStringPaddedTo: 4 ) )
        ]
]

{ #category : 'escaping' }
StringEscapingRule >> escape: character on: stream [

  self subclassResponsibility
]

{ #category : 'testing' }
StringEscapingRule >> handlesEscapeOf: character [

  ^ self subclassResponsibility
]

{ #category : 'testing' }
StringEscapingRule >> handlesUnescapeOf: controlCharacter [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
StringEscapingRule >> priority [

  ^ self subclassResponsibility
]

{ #category : 'escaping' }
StringEscapingRule >> unescape: aCharacter from: sourceStream on: targetStream [

  self subclassResponsibility
]
