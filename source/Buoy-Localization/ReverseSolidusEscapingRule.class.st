"
I'm an escaping rule implementing escaping for the Reverse Solidus character (the backslash) \\.

"
Class {
	#name : 'ReverseSolidusEscapingRule',
	#superclass : 'StringEscapingRule',
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'class initialization' }
ReverseSolidusEscapingRule class >> initialize [

  <ignoreForCoverage>
  StringEscapingRule registerRule: self new
]

{ #category : 'escaping' }
ReverseSolidusEscapingRule >> escape: character on: stream [

  stream nextPutAll: '\\'
]

{ #category : 'testing' }
ReverseSolidusEscapingRule >> handlesEscapeOf: character [

  ^ character == $\
]

{ #category : 'testing' }
ReverseSolidusEscapingRule >> handlesUnescapeOf: controlCharacter [

  ^ controlCharacter == $\
]

{ #category : 'accessing' }
ReverseSolidusEscapingRule >> priority [

  ^ 100
]

{ #category : 'escaping' }
ReverseSolidusEscapingRule >> unescape: character from: sourceStream on: targetStream [

  targetStream nextPut: $\
]
