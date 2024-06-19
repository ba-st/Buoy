Class {
	#name : 'StringEscapingRule',
	#superclass : 'Object',
	#classVars : [
		'Available'
	],
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'escaping' }
StringEscapingRule class >> escape: character on: targetStream [

  ^ Available
      detect: [ :rule | rule handlesEscapeOf: character ]
      ifFound: [ :rule | rule escape: character on: targetStream ]
      ifNone: [ targetStream nextPut: character ]
]

{ #category : 'class initialization' }
StringEscapingRule class >> initialize [

  <ignoreForCoverage>
  self initializeAvailableRules
]

{ #category : 'class initialization' }
StringEscapingRule class >> initializeAvailableRules [

  <ignoreForCoverage>
  Available ifNil: [ Available := SortedCollection sortBlock: [ :a :b | a priority > b priority ] ]
]

{ #category : 'testing' }
StringEscapingRule class >> isAbstract [

  ^ self = StringEscapingRule
]

{ #category : 'rule management' }
StringEscapingRule class >> registerRule: anEscapingRule [

  <ignoreForCoverage>
  self initializeAvailableRules.
  Available add: anEscapingRule
]

{ #category : 'escaping' }
StringEscapingRule class >> unescape: aCharacter from: sourceStream on: targetStream [

  ^ Available
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
