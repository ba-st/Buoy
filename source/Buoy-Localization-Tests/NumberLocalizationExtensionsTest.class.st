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
