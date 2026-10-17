"
A NumberPatternTest is a test class for testing the behavior of NumberPattern
"
Class {
	#name : 'NumberPatternTest',
	#superclass : 'TestCase',
	#category : 'Buoy-Localization-Tests',
	#package : 'Buoy-Localization-Tests'
}

{ #category : 'private' }
NumberPatternTest >> assertInvalid: aString because: anExplanation [

  self
    should: [ NumberPattern fromString: aString ]
    raise: InstanceCreationFailed
    withMessageText: anExplanation
]

{ #category : 'tests' }
NumberPatternTest >> testDecimalPattern [

  | pattern |
  pattern := NumberPattern fromString: '#,##0.###'.

  self
    assert: pattern positivePrefix isEmpty;
    assert: pattern positiveSuffix isEmpty;
    assert: pattern negativePrefix equals: #( #minusSign );
    assert: pattern negativeSuffix isEmpty;
    assert: pattern signedPositivePrefix equals: #( #plusSign );
    assert: pattern signedPositiveSuffix isEmpty;
    assert: pattern isGrouped;
    assert: pattern primaryGroupingSize equals: 3;
    assert: pattern secondaryGroupingSize equals: 3;
    assert: pattern minimumFractionDigits equals: 0
]

{ #category : 'tests' }
NumberPatternTest >> testGrouping [

  | pattern |
  pattern := NumberPattern fromString: '#,##0.###'.

  self
    assert: ( pattern group: '0' minimumGroupingDigits: 1 ) equals: #( '0' );
    assert: ( pattern group: '123' minimumGroupingDigits: 1 ) equals: #( '123' );
    assert: ( pattern group: '1234' minimumGroupingDigits: 1 ) equals: #( '1' '234' );
    assert: ( pattern group: '123456' minimumGroupingDigits: 1 ) equals: #( '123' '456' );
    assert: ( pattern group: '1234567' minimumGroupingDigits: 1 ) equals: #( '1' '234' '567' )
]

{ #category : 'tests' }
NumberPatternTest >> testGroupingWithMinimumGroupingDigits [

  | pattern |
  pattern := NumberPattern fromString: '#,##0.###'.

  self
    assert: ( pattern group: '1234' minimumGroupingDigits: 2 ) equals: #( '1234' );
    assert: ( pattern group: '12345' minimumGroupingDigits: 2 ) equals: #( '12' '345' );
    assert: ( pattern group: '1234567' minimumGroupingDigits: 2 ) equals: #( '1' '234' '567' )
]

{ #category : 'tests' }
NumberPatternTest >> testIndianGrouping [

  | pattern |
  pattern := NumberPattern fromString: '#,##,##0.###'.

  self
    assert: pattern primaryGroupingSize equals: 3;
    assert: pattern secondaryGroupingSize equals: 2;
    assert: ( pattern group: '1000' minimumGroupingDigits: 1 ) equals: #( '1' '000' );
    assert: ( pattern group: '100000' minimumGroupingDigits: 1 ) equals: #( '1' '00' '000' );
    assert: ( pattern group: '10000000' minimumGroupingDigits: 1 ) equals: #( '1' '00' '00' '000' )
]

{ #category : 'tests' }
NumberPatternTest >> testInvalidPatterns [

  self
    assertInvalid: '#,##0.###E0'
    because: 'Scientific notation and padding are not supported in number patterns';
    assertInvalid: '*x#,##0'
    because: 'Scientific notation and padding are not supported in number patterns';
    assertInvalid: ( String with: ( Character codePoint: 16rA4 ) ) , '#,##0.00'
    because: 'Currencies are not supported in number patterns';
    assertInvalid: '@@#'
    because: 'Significant digits and rounding increments are not supported in number patterns';
    assertInvalid: '#,##0.05'
    because: 'Significant digits and rounding increments are not supported in number patterns';
    assertInvalid: '#,##0.#.#' because: 'A number pattern can have only one decimal separator';
    assertInvalid: '#,##0.#,#' because: 'The fraction part of a number pattern cannot be grouped';
    assertInvalid: '#,##0,'
    because: 'The integer part of a number pattern cannot end with a grouping separator';
    assertInvalid: '%' because: 'A number pattern needs an integer part';
    assertInvalid: '.##' because: 'A number pattern needs an integer part';
    assertInvalid: '#;-#;#' because: 'A number pattern can have at most two subpatterns';
    assertInvalid: '''#,##0' because: 'Missing closing quote in number pattern'
]

{ #category : 'tests' }
NumberPatternTest >> testMinimumFractionDigits [

  self
    assert: ( NumberPattern fromString: '#,##0' ) minimumFractionDigits equals: 0;
    assert: ( NumberPattern fromString: '#,##0.###' ) minimumFractionDigits equals: 0;
    assert: ( NumberPattern fromString: '#,##0.00' ) minimumFractionDigits equals: 2;
    assert: ( NumberPattern fromString: '#,##0.00##' ) minimumFractionDigits equals: 2
]

{ #category : 'tests' }
NumberPatternTest >> testNegativeSubpattern [

  | pattern |
  pattern := NumberPattern fromString: '#,##0.###;(#,##0.###)'.

  self
    assert: pattern positivePrefix isEmpty;
    assert: pattern positiveSuffix isEmpty;
    assert: pattern negativePrefix equals: #( '(' );
    assert: pattern negativeSuffix equals: #( ')' );
    assert: pattern signedPositivePrefix equals: #( #plusSign );
    assert: pattern signedPositiveSuffix isEmpty
]

{ #category : 'tests' }
NumberPatternTest >> testNegativeSubpatternWithMinusSign [

  | pattern |
  pattern := NumberPattern fromString: '#,##0.###;#,##0.###-'.

  self
    assert: pattern negativePrefix isEmpty;
    assert: pattern negativeSuffix equals: #( #minusSign );
    assert: pattern signedPositivePrefix isEmpty;
    assert: pattern signedPositiveSuffix equals: #( #plusSign )
]

{ #category : 'tests' }
NumberPatternTest >> testPatternWithoutGrouping [

  | pattern |
  pattern := NumberPattern fromString: '0.###'.

  self
    deny: pattern isGrouped;
    assert: ( pattern group: '1234567' minimumGroupingDigits: 1 ) equals: #( '1234567' )
]

{ #category : 'tests' }
NumberPatternTest >> testPercentPatternWithSpace [

  | pattern noBreakSpace |
  noBreakSpace := String with: ( Character codePoint: 16rA0 ).
  pattern := NumberPattern fromString: '#,##0' , noBreakSpace , '%'.

  self
    assert: pattern positivePrefix isEmpty;
    assert: pattern positiveSuffix equals: { noBreakSpace . #percentSign };
    assert: pattern negativePrefix equals: #( #minusSign );
    assert: pattern negativeSuffix equals: { noBreakSpace . #percentSign }
]

{ #category : 'tests' }
NumberPatternTest >> testPercentPatterns [

  | pattern |
  pattern := NumberPattern fromString: '#,##0%'.
  self
    assert: pattern positivePrefix isEmpty;
    assert: pattern positiveSuffix equals: #( #percentSign );
    assert: pattern minimumFractionDigits equals: 0.

  pattern := NumberPattern fromString: '%#,##0'.
  self
    assert: pattern positivePrefix equals: #( #percentSign );
    assert: pattern positiveSuffix isEmpty;
    assert: pattern negativePrefix equals: #( #minusSign #percentSign );
    assert: pattern signedPositivePrefix equals: #( #plusSign #percentSign ).

  pattern := NumberPattern fromString: '#,##0' , ( String with: ( Character codePoint: 16r2030 ) ).
  self assert: pattern positiveSuffix equals: #( #perMilleSign )
]

{ #category : 'tests' }
NumberPatternTest >> testQuotedLiterals [

  self
    assert: ( NumberPattern fromString: '''#''#,##0' ) positivePrefix equals: #( '#' );
    assert: ( NumberPattern fromString: '#,##0'' units''' ) positiveSuffix equals: #( ' units' );
    assert: ( NumberPattern fromString: '''''#,##0' ) positivePrefix equals: #( '''' );
    assert: ( NumberPattern fromString: '#,##0'' o''''clock''' ) positiveSuffix
    equals: #( ' o''clock' );
    assert: ( NumberPattern fromString: '#,##0''%''' ) positiveSuffix equals: #( '%' );
    assert: ( NumberPattern fromString: '#,##0 ''-''%' ) positiveSuffix
    equals: { ' -' . #percentSign }
]

{ #category : 'tests' }
NumberPatternTest >> testSmallPrimaryGroupingSize [

  | pattern |
  pattern := NumberPattern fromString: '#,#0.###'.

  self
    assert: pattern primaryGroupingSize equals: 2;
    assert: pattern secondaryGroupingSize equals: 2;
    assert: ( pattern group: '12345' minimumGroupingDigits: 1 ) equals: #( '1' '23' '45' )
]
