"
A LocalizedNumberFormatterTest is a test class for testing the behavior of LocalizedNumberFormatter
"
Class {
	#name : 'LocalizedNumberFormatterTest',
	#superclass : 'TestCase',
	#category : 'Buoy-Localization-Tests',
	#package : 'Buoy-Localization-Tests'
}

{ #category : 'private' }
LocalizedNumberFormatterTest >> assert: aNumber formattedIn: aLanguageTag configuredBy: aBlock equals: aString [

  self
    assert:
    ( ( LocalizedNumberFormatter for: aLanguageTag asLanguageTag configuredBy: aBlock ) format:
        aNumber )
    equals: aString
]

{ #category : 'private' }
LocalizedNumberFormatterTest >> assert: aNumber formattedIn: aLanguageTag equals: aString [

  self
    assert: aNumber
    formattedIn: aLanguageTag
    configuredBy: [ :options |  ]
    equals: aString
]

{ #category : 'private' }
LocalizedNumberFormatterTest >> assert: aNumber formattedWith: aBlock equals: aString [

  self
    assert: aNumber
    formattedIn: 'en'
    configuredBy: aBlock
    equals: aString
]

{ #category : 'private' }
LocalizedNumberFormatterTest >> conventionsWithNumberFormat: aPattern [
  "A locale for these tests only, named zz, using aPattern for numbers"

  ^ LocaleConventions new
      loadJSONNumberConventionsFromString:
        '{"*": {"decimalSeparator": ".", "groupSeparator": ",", "minimumGroupingDigits": 1, "plusSign": "+", "minusSign": "-", "percentSign": "%", "perMilleSign": "\u2030", "numberFormat": "'
        , aPattern , '", "percentFormat": "#,##0%"}}';
      yourself
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testAlwaysDisplaySign [

  | alwaysDisplaySign |
  alwaysDisplaySign := [ :options | options alwaysDisplaySign ].

  self
    assert: 5 formattedWith: alwaysDisplaySign equals: '+5';
    assert: 0 formattedWith: alwaysDisplaySign equals: '+0';
    assert: -5 formattedWith: alwaysDisplaySign equals: '-5';
    assert: -1 / 1000 formattedWith: [ :options |
        options
          alwaysDisplaySign;
          decimalPlaces: 2
      ]
    equals: '+0.00'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testDecimalPlaces [

  self
    assert: 1 formattedWith: [ :options | options decimalPlaces: 3 ] equals: '1.000';
    assert: 123456 / 100000 formattedWith: [ :options | options decimalPlaces: 3 ] equals: '1.235';
    assert: 2.5s1 formattedWith: [ :options | options decimalPlaces: 0 ] equals: '3';
    assert: -2.5s1 formattedWith: [ :options | options decimalPlaces: 0 ] equals: '-3';
    assert: 1.239s3
    formattedWith: [ :options | options decimalPlaces: 2 roundingWith: RoundingMode truncate ]
    equals: '1.23'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testDecimalPlacesWithEveryRoundingMode [

  | roundTo2 |
  roundTo2 := [ :aRoundingMode :aNumber |
                ( LocalizedNumberFormatter
                    for: 'en' asLanguageTag
                    configuredBy: [ :options | options decimalPlaces: 2 roundingWith: aRoundingMode ] )
                  format: aNumber
              ].

  self
    assert: ( roundTo2 value: RoundingMode ceil value: -1.122s3 ) equals: '-1.12';
    assert: ( roundTo2 value: RoundingMode floor value: -1.122s3 ) equals: '-1.13';
    assert: ( roundTo2 value: RoundingMode expand value: 1.122s3 ) equals: '1.13';
    assert: ( roundTo2 value: RoundingMode truncate value: 1.126s3 ) equals: '1.12';
    assert: ( roundTo2 value: RoundingMode halfExpand value: -1.125s3 ) equals: '-1.13';
    assert: ( roundTo2 value: RoundingMode halfTruncate value: 1.135s3 ) equals: '1.13';
    assert: ( roundTo2 value: RoundingMode halfCeil value: -1.135s3 ) equals: '-1.13';
    assert: ( roundTo2 value: RoundingMode halfFloor value: 1.125s3 ) equals: '1.12';
    assert: ( roundTo2 value: RoundingMode halfEven value: 1.125s3 ) equals: '1.12';
    assert: ( roundTo2 value: RoundingMode halfEven value: 1.135s3 ) equals: '1.14'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testDefaultMaximumFractionDigits [

  | default |
  default := LocalizedNumberFormatter defaultMaximumFractionDigits.
  self assert: default equals: 100.
  [
    LocalizedNumberFormatter defaultMaximumFractionDigits: 5.
    self
      assert: 1 / 3 formattedIn: 'en' equals: '0.33333';
      assert: 1 / 4 formattedIn: 'en' equals: '0.25';
      assert: 1 / 3
      formattedWith: [ :options | options maximumFractionDigits: 8 ]
      equals: '0.33333333';
      assert: 1 / 3
      formattedWith: [ :options | options minimumFractionDigits: 7 ]
      equals: '0.3333333';
      assert: 1 / 4
      formattedWith: [ :options | options minimumFractionDigits: 7 ]
      equals: '0.2500000'
  ] ensure: [ LocalizedNumberFormatter defaultMaximumFractionDigits: default ]
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testDisplaySignExceptForZero [

  | displaySignExceptForZero |
  displaySignExceptForZero := [ :options | options displaySignExceptForZero ].

  self
    assert: 5 formattedWith: displaySignExceptForZero equals: '+5';
    assert: 0 formattedWith: displaySignExceptForZero equals: '0';
    assert: -5 formattedWith: displaySignExceptForZero equals: '-5';
    assert: -1 / 1000 formattedWith: [ :options |
        options
          displaySignExceptForZero;
          decimalPlaces: 2
      ]
    equals: '0.00'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testDisplaySignOnNegatives [

  self
    assert: 5 formattedIn: 'en' equals: '5';
    assert: 0 formattedIn: 'en' equals: '0';
    assert: -5 formattedIn: 'en' equals: '-5';
    assert: -1 / 1000 formattedWith: [ :options | options decimalPlaces: 2 ] equals: '0.00';
    assert: 5 formattedWith: [ :options |
        options
          alwaysDisplaySign;
          displaySignOnNegatives
      ]
    equals: '5'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testDontDisplayTrailingZerosForIntegers [

  | twoDecimalsUnlessInteger |
  twoDecimalsUnlessInteger := [ :options |
                                options
                                  decimalPlaces: 2;
                                  dontDisplayTrailingZerosForIntegers
                              ].

  self
    assert: 2 formattedWith: twoDecimalsUnlessInteger equals: '2';
    assert: 2.0s1 formattedWith: twoDecimalsUnlessInteger equals: '2';
    assert: 1.999s3 formattedWith: twoDecimalsUnlessInteger equals: '2';
    assert: 1.5s1 formattedWith: twoDecimalsUnlessInteger equals: '1.50';
    assert: -1.5s1 formattedWith: twoDecimalsUnlessInteger equals: '-1.50'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testFloatsAreRejected [

  self
    should: [ ( LocalizedNumberFormatter for: 'en' asLanguageTag ) format: 1.5 ]
    raise: AssertionFailed
    withMessageText: 'Floats are not supported: convert them to a ScaledDecimal or a Fraction first'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testFractions [

  self
    assert: 1 / 4 formattedIn: 'en' equals: '0.25';
    assert: -5 / 4 formattedIn: 'en' equals: '-1.25';
    assert: 1 / 3 formattedIn: 'en' equals: '0.' , ( String new: 100 withAll: $3 );
    assert: -2 / 3 formattedIn: 'en' equals: '-0.' , ( String new: 99 withAll: $6 ) , '7';
    assert: 1 / ( 10 raisedTo: 200 ) formattedIn: 'en' equals: '0';
    assert: 1 / ( 10 raisedTo: 100 )
    formattedIn: 'en'
    equals: '0.' , ( String new: 99 withAll: $0 ) , '1'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testGroupingInSpanish [

  self
    assert: 1234 formattedIn: 'es' equals: '1234';
    assert: 12345 formattedIn: 'es' equals: '12.345';
    assert: -1234.5s1 formattedIn: 'es' equals: '-1234,5';
    assert: 1234567.25s2 formattedIn: 'es' equals: '1.234.567,25';
    assert: 1234 formattedIn: 'es-AR' equals: '1.234';
    assert: 1234.5s1 formattedIn: 'es-AR' equals: '1.234,5';
    assert: 1234.5s1 formattedIn: 'es-MX' equals: '1,234.5'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testIndianGrouping [

  self
    assert: 1000 formattedIn: 'en-IN' equals: '1,000';
    assert: 100000 formattedIn: 'en-IN' equals: '1,00,000';
    assert: -12345678.9s1 formattedIn: 'en-IN' equals: '-1,23,45,678.9'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testIntegers [

  self
    assert: 0 formattedIn: 'en' equals: '0';
    assert: 7 formattedIn: 'en' equals: '7';
    assert: 123 formattedIn: 'en' equals: '123';
    assert: 1234 formattedIn: 'en' equals: '1,234';
    assert: -1234567 formattedIn: 'en' equals: '-1,234,567';
    assert: ( 10 raisedTo: 30 )
    formattedIn: 'en'
    equals: '1,000,000,000,000,000,000,000,000,000,000'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testInvalidConfigurations [

  self
    should: [
        LocalizedNumberFormatter for: 'en' asLanguageTag configuredBy: [ :options |
              options
                minimumFractionDigits: 3;
                maximumFractionDigits: 2
            ]
      ]
    raise: AssertionFailed withMessageText:
    'The minimum fraction digits cannot be greater than the maximum';
    should: [
        LocalizedNumberFormatter for: 'en' asLanguageTag configuredBy: [ :options |
            options
              maximumFractionDigits: 2;
              minimumFractionDigits: 3
          ]
      ]
    raise: AssertionFailed withMessageText:
    'The minimum fraction digits cannot be greater than the maximum';
    should: [
        LocalizedNumberFormatter
          for: 'en' asLanguageTag
          configuredBy: [ :options | options maximumFractionDigits: -1 ]
      ]
    raise: AssertionFailed withMessageText:
    'The number of fraction digits must be a non-negative integer';
    should: [
        LocalizedNumberFormatter
          for: 'en' asLanguageTag
          configuredBy: [ :options | options decimalPlaces: 3 / 2 ]
      ]
    raise: AssertionFailed withMessageText:
    'The number of fraction digits must be a non-negative integer';
    should: [ LocalizedNumberFormatter defaultMaximumFractionDigits: -1 ]
    raise: AssertionFailed
    withMessageText: 'The number of fraction digits must be a non-negative integer'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testMaximumFractionDigits [

  self
    assert: 1.125s3 formattedWith: [ :options | options maximumFractionDigits: 2 ] equals: '1.13';
    assert: 1 / 3 formattedWith: [ :options | options maximumFractionDigits: 2 ] equals: '0.33';
    assert: 2 formattedWith: [ :options | options maximumFractionDigits: 2 ] equals: '2';
    assert: 1.5s1 formattedWith: [ :options | options maximumFractionDigits: 2 ] equals: '1.5';
    assert: 1.125s3
    formattedWith: [ :options |
        options maximumFractionDigits: 2 roundingWith: RoundingMode halfEven ]
    equals: '1.12'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testMinimumFractionDigits [

  self
    assert: 1 formattedWith: [ :options | options minimumFractionDigits: 2 ] equals: '1.00';
    assert: 1.5s1 formattedWith: [ :options | options minimumFractionDigits: 2 ] equals: '1.50';
    assert: 1.234s3 formattedWith: [ :options | options minimumFractionDigits: 2 ] equals: '1.234';
    assert: 1.5s1 formattedWith: [ :options |
        options
          minimumFractionDigits: 2;
          maximumFractionDigits: 4
      ]
    equals: '1.50'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testMinimumFractionDigitsFromThePattern [

  | conventions formatter |
  conventions := self conventionsWithNumberFormat: '#,##0.00'.

  formatter := LocalizedNumberFormatter
                 for: 'zz' asLanguageTag
                 in: conventions
                 configuredBy: [ :options |  ].
  self
    assert: ( formatter format: 1 ) equals: '1.00';
    assert: ( formatter format: 1.234s3 ) equals: '1.234'.

  formatter := LocalizedNumberFormatter
                 for: 'zz' asLanguageTag
                 in: conventions
                 configuredBy: [ :options | options maximumFractionDigits: 1 ].
  self assert: ( formatter format: 1 ) equals: '1.0'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testNegativeSubpattern [

  | conventions format |
  conventions := self conventionsWithNumberFormat: '#,##0.###;(#,##0.###)'.
  format := [ :aNumber :aBlock |
              ( LocalizedNumberFormatter
                  for: 'zz' asLanguageTag
                  in: conventions
                  configuredBy: aBlock ) format: aNumber
            ].

  self
    assert: ( format value: -1234.5s1 value: [ :options |  ] ) equals: '(1,234.5)';
    assert: ( format value: 1234.5s1 value: [ :options |  ] ) equals: '1,234.5';
    assert: ( format value: 5 value: [ :options | options alwaysDisplaySign ] ) equals: '+5'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testReusingAFormatter [

  | formatter |
  formatter := LocalizedNumberFormatter
                 for: 'es-AR' asLanguageTag
                 configuredBy: [ :options | options decimalPlaces: 2 ].

  self
    assert: ( formatter format: 1234.5s1 ) equals: '1.234,50';
    assert: ( formatter format: 0 ) equals: '0,00';
    assert: ( formatter format: -12.345s3 ) equals: '-12,35';
    assert: ( formatter format: 1 / 3 ) equals: '0,33'
]

{ #category : 'tests' }
LocalizedNumberFormatterTest >> testScaledDecimals [

  self
    assert: 1.50s2 formattedIn: 'en' equals: '1.5';
    assert: 1234.5678s4 formattedIn: 'en' equals: '1,234.5678';
    assert: 1.50s2 formattedWith: [ :options | options decimalPlaces: 2 ] equals: '1.50';
    assert: -0.05s2 formattedIn: 'en' equals: '-0.05';
    assert: 3s2 formattedIn: 'en' equals: '3'
]
