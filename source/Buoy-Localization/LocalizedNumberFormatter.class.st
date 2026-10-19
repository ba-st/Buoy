"
I format numbers following the conventions of a locale: its decimal and group separators, its signs and its number pattern.

By default I display every fraction digit of a number up to a maximum, 100 unless changed with `defaultMaximumFractionDigits:`, rounding half away from zero, and a sign only for negative numbers. My configuration messages change how numbers are laid out:

- sign display: `displaySignOnNegatives`, `displaySignExceptForZero`, `alwaysDisplaySign`
- fraction digits: `minimumFractionDigits:`, `maximumFractionDigits:`, `maximumFractionDigits:roundingWith:`, `decimalPlaces:`, `decimalPlaces:roundingWith:`, `dontDisplayTrailingZerosForIntegers`

I only format exact numbers: integers, fractions and scaled decimals. Floats are rejected, since their binary value is not the decimal they were written as.
"
Class {
	#name : 'LocalizedNumberFormatter',
	#superclass : 'Formatter',
	#instVars : [
		'pattern',
		'decimalSeparator',
		'groupSeparator',
		'minimumGroupingDigits',
		'minimumFractionDigitsOptional',
		'maximumFractionDigitsOptional',
		'roundingMode',
		'signDisplay',
		'displaysTrailingZerosForIntegers'
	],
	#classInstVars : [
		'defaultMaximumFractionDigits'
	],
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'accessing' }
LocalizedNumberFormatter class >> defaultMaximumFractionDigits [

  ^ defaultMaximumFractionDigits ifNil: [ 100 ]
]

{ #category : 'configuring' }
LocalizedNumberFormatter class >> defaultMaximumFractionDigits: anInteger [

  AssertionChecker
    enforce: [ anInteger isInteger and: [ anInteger >= 0 ] ]
    because: 'The number of fraction digits must be a non-negative integer'.
  defaultMaximumFractionDigits := anInteger
]

{ #category : 'instance creation' }
LocalizedNumberFormatter class >> for: aLanguageTag [

  ^ self for: aLanguageTag configuredBy: [ :options |  ]
]

{ #category : 'instance creation' }
LocalizedNumberFormatter class >> for: aLanguageTag configuredBy: aBlock [

  ^ self for: aLanguageTag in: LocaleConventions current configuredBy: aBlock
]

{ #category : 'instance creation' }
LocalizedNumberFormatter class >> for: aLanguageTag in: aLocaleConventions configuredBy: aBlock [

  | formatter |
  formatter := self new initializeFor: aLanguageTag in: aLocaleConventions.
  aBlock value: formatter.
  ^ formatter
]

{ #category : 'configuring' }
LocalizedNumberFormatter >> alwaysDisplaySign [

  signDisplay := #always
]

{ #category : 'private' }
LocalizedNumberFormatter >> assertIsValidNumberOfFractionDigits: anInteger [

  AssertionChecker
    enforce: [ anInteger isInteger and: [ anInteger >= 0 ] ]
    because: 'The number of fraction digits must be a non-negative integer'
]

{ #category : 'private' }
LocalizedNumberFormatter >> assertMinimum: minimum isNotAboveMaximum: maximum [

  AssertionChecker
    enforce: [ minimum <= maximum ]
    because: 'The minimum fraction digits cannot be greater than the maximum'
]

{ #category : 'configuring' }
LocalizedNumberFormatter >> decimalPlaces: anInteger [

  self assertIsValidNumberOfFractionDigits: anInteger.
  minimumFractionDigitsOptional := Optional containing: anInteger.
  maximumFractionDigitsOptional := Optional containing: anInteger
]

{ #category : 'configuring' }
LocalizedNumberFormatter >> decimalPlaces: anInteger roundingWith: aRoundingMode [

  self decimalPlaces: anInteger.
  roundingMode := aRoundingMode
]

{ #category : 'configuring' }
LocalizedNumberFormatter >> displaySignExceptForZero [

  signDisplay := #exceptZero
]

{ #category : 'configuring' }
LocalizedNumberFormatter >> displaySignOnNegatives [

  signDisplay := #negatives
]

{ #category : 'private' }
LocalizedNumberFormatter >> displaysSignFor: aNonNegativeNumber [

  ^ signDisplay = #always or: [ signDisplay = #exceptZero and: [ aNonNegativeNumber isZero not ] ]
]

{ #category : 'configuring' }
LocalizedNumberFormatter >> dontDisplayTrailingZerosForIntegers [

  displaysTrailingZerosForIntegers := false
]

{ #category : 'formatting' }
LocalizedNumberFormatter >> format: aNumber on: aStream [

  | maximum rounded integerPart |
  AssertionChecker
    enforce: [ aNumber isFloat not ]
    because: 'Floats are not supported: convert them to a ScaledDecimal or a Fraction first'.
  maximum := self maximumFractionDigits.
  rounded := roundingMode round: aNumber toFractionDigits: maximum.
  integerPart := rounded abs truncated.

  aStream nextPutAll: ( self prefixFor: rounded ).
  ( pattern group: integerPart printString minimumGroupingDigits: minimumGroupingDigits )
    do: [ :group | aStream nextPutAll: group ]
    separatedBy: [ aStream nextPutAll: groupSeparator ].
  ( self fractionDigitsOf: rounded abs - integerPart upTo: maximum ) ifNotEmpty: [ :fractionDigits |
      aStream
        nextPutAll: decimalSeparator;
        nextPutAll: fractionDigits
    ].
  aStream nextPutAll: ( self suffixFor: rounded )
]

{ #category : 'private' }
LocalizedNumberFormatter >> fractionDigitsOf: aFractionPart upTo: maximum [
  "aFractionPart is between 0 and 1, with at most maximum decimal digits"

  | digits end minimum |
  ( aFractionPart isZero and: [ displaysTrailingZerosForIntegers not ] ) ifTrue: [ ^ '' ].
  maximum = 0 ifTrue: [ ^ '' ].
  digits := ( aFractionPart * ( 10 raisedTo: maximum ) ) truncated printString.
  digits := ( String new: maximum - digits size withAll: $0 ) , digits.
  minimum := self minimumFractionDigits.
  end := maximum.
  [ end > minimum and: [ ( digits at: end ) = $0 ] ] whileTrue: [ end := end - 1 ].
  ^ digits copyFrom: 1 to: end
]

{ #category : 'initialization' }
LocalizedNumberFormatter >> initializeFor: aLanguageTag in: aLocaleConventions [

  | property symbols |
  property := [ :name | aLocaleConventions numberPropertyNamed: name for: aLanguageTag ].
  symbols := Dictionary new.
  #( #minusSign #plusSign #percentSign #perMilleSign ) do: [ :name |
      symbols at: name put: ( property value: name ) ].
  pattern := NumberPattern fromString: ( property value: #numberFormat ) using: symbols.
  decimalSeparator := property value: #decimalSeparator.
  groupSeparator := property value: #groupSeparator.
  minimumGroupingDigits := property value: #minimumGroupingDigits.
  minimumFractionDigitsOptional := Optional unused.
  maximumFractionDigitsOptional := Optional unused.
  roundingMode := RoundingMode halfExpand.
  signDisplay := #negatives.
  displaysTrailingZerosForIntegers := true
]

{ #category : 'accessing' }
LocalizedNumberFormatter >> maximumFractionDigits [
  "Configured explicitly, or the default maximum, raised to the minimum when it is above it"

  ^ maximumFractionDigitsOptional withContentDo: [ :maximum | maximum ] ifUnused: [
        self class defaultMaximumFractionDigits max: ( minimumFractionDigitsOptional
              withContentDo: [ :minimum | minimum ]
              ifUnused: [ pattern minimumFractionDigits ] )
      ]
]

{ #category : 'configuring' }
LocalizedNumberFormatter >> maximumFractionDigits: anInteger [

  self assertIsValidNumberOfFractionDigits: anInteger.
  minimumFractionDigitsOptional withContentDo: [ :minimum |
      self assertMinimum: minimum isNotAboveMaximum: anInteger ].
  maximumFractionDigitsOptional := Optional containing: anInteger
]

{ #category : 'configuring' }
LocalizedNumberFormatter >> maximumFractionDigits: anInteger roundingWith: aRoundingMode [

  self maximumFractionDigits: anInteger.
  roundingMode := aRoundingMode
]

{ #category : 'accessing' }
LocalizedNumberFormatter >> minimumFractionDigits [
  "Configured explicitly, or the pattern's, lowered to the maximum when it is above it"

  ^ minimumFractionDigitsOptional
      withContentDo: [ :minimum | minimum ]
      ifUnused: [ pattern minimumFractionDigits min: self maximumFractionDigits ]
]

{ #category : 'configuring' }
LocalizedNumberFormatter >> minimumFractionDigits: anInteger [

  self assertIsValidNumberOfFractionDigits: anInteger.
  maximumFractionDigitsOptional withContentDo: [ :maximum |
      self assertMinimum: anInteger isNotAboveMaximum: maximum ].
  minimumFractionDigitsOptional := Optional containing: anInteger
]

{ #category : 'private' }
LocalizedNumberFormatter >> prefixFor: aRoundedNumber [

  aRoundedNumber negative ifTrue: [ ^ pattern negativePrefix ].
  ^ ( self displaysSignFor: aRoundedNumber )
      ifTrue: [ pattern signedPositivePrefix ]
      ifFalse: [ pattern positivePrefix ]
]

{ #category : 'private' }
LocalizedNumberFormatter >> suffixFor: aRoundedNumber [

  aRoundedNumber negative ifTrue: [ ^ pattern negativeSuffix ].
  ^ ( self displaysSignFor: aRoundedNumber )
      ifTrue: [ pattern signedPositiveSuffix ]
      ifFalse: [ pattern positiveSuffix ]
]
