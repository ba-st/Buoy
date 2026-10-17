"
I test the number conventions shipped with Buoy, loaded into the current locale conventions when Buoy is loaded.
"
Class {
	#name : 'ShippedNumberConventionsTest',
	#superclass : 'TestCase',
	#category : 'Buoy-Localization-Tests',
	#package : 'Buoy-Localization-Tests'
}

{ #category : 'private' }
ShippedNumberConventionsTest >> assertConventionsFor: aLanguageTag areDecimal: decimalSeparator group: groupSeparator minimumGroupingDigits: minimumGroupingDigits [

  self
    assert: ( self numberPropertyNamed: #decimalSeparator for: aLanguageTag )
    equals: decimalSeparator;
    assert: ( self numberPropertyNamed: #groupSeparator for: aLanguageTag ) equals: groupSeparator;
    assert: ( self numberPropertyNamed: #minimumGroupingDigits for: aLanguageTag )
    equals: minimumGroupingDigits
]

{ #category : 'private' }
ShippedNumberConventionsTest >> noBreakSpace [

  ^ Character nbsp asString
]

{ #category : 'private' }
ShippedNumberConventionsTest >> numberPropertyNamed: aName for: aLanguageTag [

  ^ LocaleConventions current numberPropertyNamed: aName for: aLanguageTag
]

{ #category : 'tests' }
ShippedNumberConventionsTest >> testDefaults [

  self
    assertConventionsFor: 'ja'
    areDecimal: '.'
    group: ','
    minimumGroupingDigits: 1;
    assert: ( self numberPropertyNamed: #plusSign for: 'ja' ) equals: '+';
    assert: ( self numberPropertyNamed: #minusSign for: 'ja' ) equals: '-';
    assert: ( self numberPropertyNamed: #percentSign for: 'ja' ) equals: '%';
    assert: ( self numberPropertyNamed: #perMilleSign for: 'ja' ) equals: '‰';
    assert: ( self numberPropertyNamed: #numberFormat for: 'ja' ) equals: '#,##0.###';
    assert: ( self numberPropertyNamed: #percentFormat for: 'ja' ) equals: '#,##0%'
]

{ #category : 'tests' }
ShippedNumberConventionsTest >> testEnglish [

  self
    assertConventionsFor: 'en'
    areDecimal: '.'
    group: ','
    minimumGroupingDigits: 1;
    assertConventionsFor: 'en-US'
    areDecimal: '.'
    group: ','
    minimumGroupingDigits: 1;
    assertConventionsFor: 'en-GB'
    areDecimal: '.'
    group: ','
    minimumGroupingDigits: 1;
    assertConventionsFor: 'en-CH'
    areDecimal: '.'
    group: ''''
    minimumGroupingDigits: 1;
    assertConventionsFor: 'en-ZA'
    areDecimal: ','
    group: self noBreakSpace
    minimumGroupingDigits: 1;
    assert: ( self numberPropertyNamed: #numberFormat for: 'en-IN' ) equals: '#,##,##0.###';
    assert: ( self numberPropertyNamed: #percentFormat for: 'en-IN' ) equals: '#,##,##0%';
    assert: ( self numberPropertyNamed: #percentFormat for: 'en-DE' )
    equals: '#,##0' , self noBreakSpace , '%'
]

{ #category : 'tests' }
ShippedNumberConventionsTest >> testSpanish [

  self
    assertConventionsFor: 'es'
    areDecimal: ','
    group: '.'
    minimumGroupingDigits: 2;
    assertConventionsFor: 'es-ES'
    areDecimal: ','
    group: '.'
    minimumGroupingDigits: 2;
    assertConventionsFor: 'es-AR'
    areDecimal: ','
    group: '.'
    minimumGroupingDigits: 1;
    assertConventionsFor: 'es-MX'
    areDecimal: '.'
    group: ','
    minimumGroupingDigits: 1;
    assertConventionsFor: 'es-419'
    areDecimal: '.'
    group: ','
    minimumGroupingDigits: 1;
    assertConventionsFor: 'es-CR'
    areDecimal: ','
    group: self noBreakSpace
    minimumGroupingDigits: 1;
    assert: ( self numberPropertyNamed: #percentFormat for: 'es' )
    equals: '#,##0' , self noBreakSpace , '%';
    assert: ( self numberPropertyNamed: #percentFormat for: 'es-AR' ) equals: '#,##0%'
]
