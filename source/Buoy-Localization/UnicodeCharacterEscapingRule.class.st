"
I'm an escaping rule implementing escaping for Unicode characters.

The following escaping sequences are handled by my instances:

- `\u{HHHH}`	Represents the character with the given hexadecimal Unicode code point
"
Class {
	#name : 'UnicodeCharacterEscapingRule',
	#superclass : 'StringEscapingRule',
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'class initialization' }
UnicodeCharacterEscapingRule class >> initialize [

  <ignoreForCoverage>
  StringEscapingRule registerRule: self new
]

{ #category : 'escaping' }
UnicodeCharacterEscapingRule >> escape: character on: stream [

  stream nextPutAll: '\u{'.
  stream nextPutAll: (character codePoint asHexStringPaddedTo: 1).
  stream nextPut: $}
]

{ #category : 'private' }
UnicodeCharacterEscapingRule >> extractExpressionFrom: stream [

  | closingBracketWasFound expression openingBracket |

  AssertionChecker refuse: [ stream atEnd ] because: 'Missing opening "{" in escaping sequence'.

  openingBracket := stream next.
  AssertionChecker
    enforce: [ openingBracket == ${ ]
    because: 'Missing opening "{" in escaping sequence'.

  closingBracketWasFound := false.
  expression := stream upToAnyOf: '}' do: [ :char | closingBracketWasFound := true ].

  AssertionChecker
    enforce: [ closingBracketWasFound ]
    because: 'Missing closing "}" in escaping sequence'.

  ^ expression
]

{ #category : 'testing' }
UnicodeCharacterEscapingRule >> handlesEscapeOf: character [

  | codePoint |
  "Ignore the printable characters on the Basic Latin and Latin-1 Supplement sections of Unicode"
  codePoint := character codePoint.

  ^ ( ( codePoint between: 20 and: 126 ) or: [ codePoint between: 161 and: 255 ] ) not
]

{ #category : 'testing' }
UnicodeCharacterEscapingRule >> handlesUnescapeOf: controlCharacter [

  ^ controlCharacter == $u
]

{ #category : 'private' }
UnicodeCharacterEscapingRule >> maximumUTFCode [

  ^ 16r10FFFF
]

{ #category : 'private' }
UnicodeCharacterEscapingRule >> parseCodePointFrom: stream [

  | codePoint expression |
  expression := self extractExpressionFrom: stream.
  codePoint := Integer
                 readFromHex: expression
                 ifFail: [
                   AssertionFailed signal:
                     ( 'Unexpected hexadecimal sequence "<1s>"' expandMacrosWith: expression ) ].
  AssertionChecker
    enforce: [ codePoint between: 0 and: self maximumUTFCode ]
    because: [ 'Code point "<1s>" is out of range' expandMacrosWith: expression ].
  ^ codePoint
]

{ #category : 'accessing' }
UnicodeCharacterEscapingRule >> priority [

  ^ 10
]

{ #category : 'escaping' }
UnicodeCharacterEscapingRule >> unescape: aCharacter from: sourceStream on: targetStream [

  | codePoint |
  codePoint := self parseCodePointFrom: sourceStream.
  targetStream nextPut: ( Character codePoint: codePoint )
]
