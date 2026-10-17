"
I'm a number pattern, as defined by the Unicode CLDR, like `#,##0.###` or `#,##0%`.

I know the prefixes and suffixes used for positive and negative numbers, the size of the digit groups and the minimum number of fraction digits.

My prefixes and suffixes are collections of literal strings and symbols naming the locale's symbols to use in their place: `#minusSign`, `#plusSign`, `#percentSign` and `#perMilleSign`.

Scientific notation (`E`), currencies (`¤`), significant digits (`@`), rounding increments and padding (`*`) are not supported.

Reference: https://unicode.org/reports/tr35/tr35-numbers.html#Number_Format_Patterns
"
Class {
	#name : 'NumberPattern',
	#superclass : 'Object',
	#instVars : [
		'positivePrefix',
		'positiveSuffix',
		'negativePrefix',
		'negativeSuffix',
		'primaryGroupingSize',
		'secondaryGroupingSize',
		'minimumFractionDigits'
	],
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'instance creation' }
NumberPattern class >> fromString: aString [

  ^ self new initializeFromString: aString
]

{ #category : 'private' }
NumberPattern >> assertIsSupportedInAffix: aCharacter [

  self
    enforce: [ aCharacter ~= ( Character codePoint: 16rA4 ) ]
    because: 'Currencies are not supported in number patterns';
    enforce: [ ( 'E*' includes: aCharacter ) not ]
    because: 'Scientific notation and padding are not supported in number patterns'
]

{ #category : 'private' }
NumberPattern >> enforce: aBlock because: anExplanation [

  AssertionChecker enforce: aBlock because: anExplanation raising: InstanceCreationFailed
]

{ #category : 'grouping' }
NumberPattern >> group: integerDigits minimumGroupingDigits: minimumGroupingDigits [
  "Answers the integer digits split in groups, from the most significant to the least one.
	The digits are grouped only when they are at least the primary grouping size plus the minimum grouping digits."

  | groups end |
  ( self isGrouped and: [ integerDigits size >= ( primaryGroupingSize + minimumGroupingDigits ) ] )
    ifFalse: [ ^ Array with: integerDigits ].

  groups := OrderedCollection new.
  end := integerDigits size.
  groups addFirst: ( integerDigits copyFrom: end - primaryGroupingSize + 1 to: end ).
  end := end - primaryGroupingSize.
  [ end > secondaryGroupingSize ] whileTrue: [
      groups addFirst: ( integerDigits copyFrom: end - secondaryGroupingSize + 1 to: end ).
      end := end - secondaryGroupingSize
    ].
  groups addFirst: ( integerDigits copyFrom: 1 to: end ).
  ^ groups asArray
]

{ #category : 'initialization' }
NumberPattern >> initializeFromString: aString [

  aString readStreamDo: [ :stream |
      positivePrefix := self parseAffixFrom: stream.
      self parseNumberFrom: stream.
      positiveSuffix := self parseAffixFrom: stream.
      stream atEnd
        ifTrue: [
            negativePrefix := #( #minusSign ) , positivePrefix.
            negativeSuffix := positiveSuffix
          ]
        ifFalse: [
            stream next.
            negativePrefix := self parseAffixFrom: stream.
            self readNumberFrom: stream.
            negativeSuffix := self parseAffixFrom: stream.
            self
              enforce: [ stream atEnd ]
              because: 'A number pattern can have at most two subpatterns'
          ]
    ]
]

{ #category : 'testing' }
NumberPattern >> isGrouped [

  ^ primaryGroupingSize > 0
]

{ #category : 'private' }
NumberPattern >> isNumberCharacter: aCharacter [

  ^ '#0123456789@,.' includes: aCharacter
]

{ #category : 'accessing' }
NumberPattern >> minimumFractionDigits [

  ^ minimumFractionDigits
]

{ #category : 'accessing' }
NumberPattern >> negativePrefix [

  ^ negativePrefix
]

{ #category : 'accessing' }
NumberPattern >> negativeSuffix [

  ^ negativeSuffix
]

{ #category : 'private' }
NumberPattern >> parseAffixFrom: stream [

  | affix literal symbolNames |
  affix := OrderedCollection new.
  literal := WriteStream on: String new.
  symbolNames := self symbolNamesByCharacter.
  [ stream atEnd or: [ stream peek = $; or: [ self isNumberCharacter: stream peek ] ] ] whileFalse: [
      | character |
      character := stream next.
      character = $'
        ifTrue: [ self parseQuotedLiteralFrom: stream on: literal ]
        ifFalse: [
            self assertIsSupportedInAffix: character.
            symbolNames
              at: character
              ifPresent: [ :symbolName |
                  literal contents isEmpty ifFalse: [ affix add: literal contents ].
                  literal := WriteStream on: String new.
                  affix add: symbolName
                ]
              ifAbsent: [ literal nextPut: character ]
          ]
    ].
  literal contents isEmpty ifFalse: [ affix add: literal contents ].
  ^ affix asArray
]

{ #category : 'private' }
NumberPattern >> parseFractionPart: fractionPart [

  self
    enforce: [ ( fractionPart includes: $, ) not ]
    because: 'The fraction part of a number pattern cannot be grouped'.
  minimumFractionDigits := fractionPart occurrencesOf: $0
]

{ #category : 'private' }
NumberPattern >> parseIntegerPart: integerPart [

  | groups |
  self
    enforce: [ integerPart notEmpty ] because: 'A number pattern needs an integer part';
    enforce: [ integerPart last ~= $, ]
    because: 'The integer part of a number pattern cannot end with a grouping separator'.
  groups := integerPart substrings: ','.
  primaryGroupingSize := ( integerPart includes: $, )
                           ifTrue: [ groups last size ]
                           ifFalse: [ 0 ].
  secondaryGroupingSize := groups size > 2
                             ifTrue: [ ( groups at: groups size - 1 ) size ]
                             ifFalse: [ primaryGroupingSize ]
]

{ #category : 'private' }
NumberPattern >> parseNumberFrom: stream [

  | number decimalSeparatorIndex |
  number := self readNumberFrom: stream.
  self
    enforce: [ number allSatisfy: [ :character | '#0,.' includes: character ] ]
    because: 'Significant digits and rounding increments are not supported in number patterns'.
  self
    enforce: [ ( number occurrencesOf: $. ) <= 1 ]
    because: 'A number pattern can have only one decimal separator'.
  decimalSeparatorIndex := number indexOf: $..
  decimalSeparatorIndex = 0
    ifTrue: [
        self
          parseIntegerPart: number;
          parseFractionPart: ''
      ]
    ifFalse: [
        self
          parseIntegerPart: ( number copyFrom: 1 to: decimalSeparatorIndex - 1 );
          parseFractionPart: ( number copyFrom: decimalSeparatorIndex + 1 to: number size )
      ]
]

{ #category : 'private' }
NumberPattern >> parseQuotedLiteralFrom: stream on: literal [
  "Called after an opening quote. Two consecutive quotes stand for a quote;
	otherwise everything up to the closing quote is literal, with doubled quotes inside standing for one."

  stream peek = $' ifTrue: [ ^ literal nextPut: stream next ].
  [
    self enforce: [ stream atEnd not ] because: 'Missing closing quote in number pattern'.
    stream peek = $' and: [
        stream next.
        stream peek ~= $'
      ]
  ] whileFalse: [ literal nextPut: stream next ]
]

{ #category : 'accessing' }
NumberPattern >> positivePrefix [

  ^ positivePrefix
]

{ #category : 'accessing' }
NumberPattern >> positiveSuffix [

  ^ positiveSuffix
]

{ #category : 'accessing' }
NumberPattern >> primaryGroupingSize [

  ^ primaryGroupingSize
]

{ #category : 'private' }
NumberPattern >> readNumberFrom: stream [

  ^ String new: 10 streamContents: [ :number |
        [ stream atEnd not and: [ self isNumberCharacter: stream peek ] ] whileTrue: [
            number nextPut: stream next ]
      ]
]

{ #category : 'accessing' }
NumberPattern >> secondaryGroupingSize [

  ^ secondaryGroupingSize
]

{ #category : 'accessing' }
NumberPattern >> signedPositivePrefix [
  "The prefix for positive numbers when the sign must be shown"

  ^ self usesMinusSignForNegatives
      ifTrue: [ self withPlusSignInsteadOfMinusSign: negativePrefix ]
      ifFalse: [ #( #plusSign ) , positivePrefix ]
]

{ #category : 'accessing' }
NumberPattern >> signedPositiveSuffix [
  "The suffix for positive numbers when the sign must be shown"

  ^ self usesMinusSignForNegatives
      ifTrue: [ self withPlusSignInsteadOfMinusSign: negativeSuffix ]
      ifFalse: [ positiveSuffix ]
]

{ #category : 'private' }
NumberPattern >> symbolNamesByCharacter [

  ^ Dictionary new
      at: $- put: #minusSign;
      at: $+ put: #plusSign;
      at: $% put: #percentSign;
      at: ( Character codePoint: 16r2030 ) put: #perMilleSign;
      yourself
]

{ #category : 'private' }
NumberPattern >> usesMinusSignForNegatives [

  ^ negativePrefix , negativeSuffix anySatisfy: [ :element | element == #minusSign ]
]

{ #category : 'private' }
NumberPattern >> withPlusSignInsteadOfMinusSign: anAffix [

  ^ anAffix collect: [ :element |
        element == #minusSign
          ifTrue: [ #plusSign ]
          ifFalse: [ element ]
      ]
]
