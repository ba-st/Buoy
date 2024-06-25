"
I'm an escaping rule implementing escaping for control characters.

The following escaping sequences are handled by my instances:
- `\a`		BEL			Bell
- `\b`		BS			Backspace
- `\e`		ESC			Escape
- `\f`		FF			Form Feed
- `\l`		LF			Line Feed
- `\n`		OS EOL		LF on Unix / CRLF on Windows	
- `\r`		CR			Carriage Return
- `\t`		TAB			Horizontal Tabulation
- `\v`		VT			Vertical Tabulation
"
Class {
	#name : 'ControlCharactersEscapingRule',
	#superclass : 'StringEscapingRule',
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'class initialization' }
ControlCharactersEscapingRule class >> initialize [

  <ignoreForCoverage>
  StringEscapingRule registerRule: self new
]

{ #category : 'escaping' }
ControlCharactersEscapingRule >> escape: character on: stream [

  character codePoint == 7 ifTrue: [ ^ stream nextPutAll: '\a' ].
  character == Character backspace ifTrue: [ ^ stream nextPutAll: '\b' ].
  character == Character escape ifTrue: [ ^ stream nextPutAll: '\e' ].
  character codePoint == 12 ifTrue: [ ^ stream nextPutAll: '\f' ].
  character == Character lf ifTrue: [ ^ stream nextPutAll: '\l' ].
  character == Character cr ifTrue: [ ^ stream nextPutAll: '\r' ].
  character == Character tab ifTrue: [ ^ stream nextPutAll: '\t' ].
  character codePoint == 11 ifTrue: [ ^ stream nextPutAll: '\v' ].
  self raiseError
]

{ #category : 'testing' }
ControlCharactersEscapingRule >> handlesEscapeOf: character [

  ^ ( character codePoint between: 7 and: 13 ) or: [ character codePoint == 27 ]
]

{ #category : 'testing' }
ControlCharactersEscapingRule >> handlesUnescapeOf: controlCharacter [

  ^ 'abeflnrtv' includes: controlCharacter
]

{ #category : 'accessing' }
ControlCharactersEscapingRule >> priority [

  ^ 50
]

{ #category : 'private' }
ControlCharactersEscapingRule >> raiseError [

  <ignoreForCoverage>
  self error: 'The control character escaping rule is mishandling some case'
]

{ #category : 'escaping' }
ControlCharactersEscapingRule >> unescape: aCharacter from: sourceStream on: targetStream [

  aCharacter == $a then: [ ^ targetStream nextPut: ( Character codePoint: 7 ) ].
  aCharacter == $b then: [ ^ targetStream nextPut: Character backspace ].
  aCharacter == $e then: [ ^ targetStream nextPut: Character escape ].
  aCharacter == $f then: [ ^ targetStream nextPut: ( Character codePoint: 12 ) ].
  aCharacter == $l then: [ ^ targetStream lf ].
  aCharacter == $n then: [ ^ targetStream nextPutAll: LanguagePlatform current os lineEnding ].
  aCharacter == $r then: [ ^ targetStream cr ].
  aCharacter == $t then: [ ^ targetStream tab ].
  aCharacter == $v then: [ ^ targetStream nextPut: ( Character codePoint: 11 ) ].
  self raiseError
]
