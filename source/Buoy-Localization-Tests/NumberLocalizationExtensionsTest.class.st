"
A NumberLocalizationExtensionsTest is a test class for testing the localization extensions of Number
"
Class {
	#name : 'NumberLocalizationExtensionsTest',
	#superclass : 'TestCase',
	#category : 'Buoy-Localization-Tests',
	#package : 'Buoy-Localization-Tests'
}

{ #category : 'tests' }
NumberLocalizationExtensionsTest >> testFloatsAreRejected [

  self
    should: [ 1.5 localized ]
    raise: AssertionFailed
    withMessageText: 'Floats are not supported: convert them to a ScaledDecimal or a Fraction first';
    should: [ 1.5 localizedWith: [ :options | options decimalPlaces: 2 ] ]
    raise: AssertionFailed
    withMessageText: 'Floats are not supported: convert them to a ScaledDecimal or a Fraction first'
]

{ #category : 'tests' }
NumberLocalizationExtensionsTest >> testLocalized [

  CurrentLocale use: 'en' during: [
      self
        assert: 1234.5s1 localized equals: '1,234.5';
        assert: -1234 localized equals: '-1,234';
        assert: ( 1 / 4 ) localized equals: '0.25'
    ].

  CurrentLocale use: 'es' during: [ self assert: 1234.5s1 localized equals: '1234,5' ].
  CurrentLocale use: 'es-AR' during: [ self assert: 1234.5s1 localized equals: '1.234,5' ]
]

{ #category : 'tests' }
NumberLocalizationExtensionsTest >> testLocalizedWith [

  CurrentLocale use: 'en' during: [
      self
        assert: ( 1.5s1 localizedWith: [ :options | options decimalPlaces: 2 ] ) equals: '1.50';
        assert: ( 5 localizedWith: [ :options | options alwaysDisplaySign ] ) equals: '+5'
    ].

  CurrentLocale use: 'es-AR' during: [
      self
        assert: ( 1234.5s1 localizedWith: [ :options | options decimalPlaces: 2 ] )
        equals: '1.234,50' ]
]

{ #category : 'tests' }
NumberLocalizationExtensionsTest >> testPerMilleLocalized [

  CurrentLocale use: 'en' during: [
      self
        assert: 6 perMille localized equals: '6‰';
        assert: ( 6 perMille localizedWith: [ :options | options decimalPlaces: 1 ] )
        equals: '6.0‰'
    ]
]

{ #category : 'tests' }
NumberLocalizationExtensionsTest >> testPercentageLocalized [
  "Built from fractions: in GemStone/S 64, 12.5s1 percent divides 12.5s1 by 100 keeping its scale of 1, so it is 10%"

  CurrentLocale use: 'en' during: [
      self
        assert: ( 25 / 2 ) percent localized equals: '12.5%';
        assert: Percentage oneHundred localized equals: '100%';
        assert:
          ( ( Percentage of: 1 / 3 ) localizedWith: [ :options | options maximumFractionDigits: 2 ] )
        equals: '0.33%';
        assert:
          ( ( Percentage ratio: 1 / 3 ) localizedWith: [ :options |
                  options maximumFractionDigits: 2 ] )
        equals: '33.33%';
        should: [ 5.0 percent localized ]
        raise: AssertionFailed
        withMessageText:
          'Floats are not supported: convert them to a ScaledDecimal or a Fraction first'
    ].

  CurrentLocale use: 'es-AR' during: [ self assert: ( 25 / 2 ) percent localized equals: '12,5%' ]
]
