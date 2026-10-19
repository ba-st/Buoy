"
A LocaleConventionsTest is a test class for testing the behavior of LocaleConventions
"
Class {
	#name : 'LocaleConventionsTest',
	#superclass : 'TestCase',
	#instVars : [
		'conventions'
	],
	#category : 'Buoy-Localization-Tests',
	#package : 'Buoy-Localization-Tests'
}

{ #category : 'private' }
LocaleConventionsTest >> load: json [

  conventions loadJSONNumberConventionsFromString: json
]

{ #category : 'private' }
LocaleConventionsTest >> loadSpanishConventions [

  self load: '{
	"*": {"decimalSeparator": ".", "groupSeparator": ",", "minimumGroupingDigits": 1, "plusSign": "+", "percentFormat": "#,##0%"},
	"es": {"decimalSeparator": ",", "groupSeparator": ".", "minimumGroupingDigits": 2, "percentFormat": "#,##0\u00A0%"},
	"es-AR": {"minimumGroupingDigits": 1, "percentFormat": "#,##0%"}
}'
]

{ #category : 'private' }
LocaleConventionsTest >> numberPropertyNamed: aName for: aLanguageTag [

  ^ conventions numberPropertyNamed: aName for: aLanguageTag
]

{ #category : 'running' }
LocaleConventionsTest >> setUp [

  super setUp.
  conventions := LocaleConventions new
]

{ #category : 'tests' }
LocaleConventionsTest >> testEscapedCharacters [

  self load: '{"*": {"groupSeparator": "\u00A0", "perMilleSign": "\u2030"}}'.

  self
    assert: ( self numberPropertyNamed: #groupSeparator for: 'en' )
    equals: ( String with: ( Character codePoint: 16rA0 ) );
    assert: ( self numberPropertyNamed: #perMilleSign for: 'en' ) equals: '‰'
]

{ #category : 'tests' }
LocaleConventionsTest >> testLaterLoadsOverridePropertyByProperty [

  self loadSpanishConventions.
  self load: '{"es": {"decimalSeparator": "\u066B"}, "fr-CA": {"groupSeparator": " "}}'.

  self
    assert: ( self numberPropertyNamed: #decimalSeparator for: 'es' ) equals: '٫';
    assert: ( self numberPropertyNamed: #groupSeparator for: 'es' ) equals: '.';
    assert: ( self numberPropertyNamed: #minimumGroupingDigits for: 'es' ) equals: 2;
    assert: ( self numberPropertyNamed: #groupSeparator for: 'fr-CA' ) equals: ' ';
    assert: ( self numberPropertyNamed: #decimalSeparator for: 'fr-CA' ) equals: '.'
]

{ #category : 'tests' }
LocaleConventionsTest >> testLoadingFromAFile [

  | location file |
  location := FileLocator temp / 'Buoy' / self selector asString.
  location ensureCreateDirectory.
  [
    file := location / 'numbers.json'.
    file writeStreamDo: [ :stream | stream nextPutAll: '{"es": {"decimalSeparator": ","}}' ].
    conventions loadJSONNumberConventionsFrom: file
  ] ensure: [ location ensureDeleteAll ].

  self assert: ( self numberPropertyNamed: #decimalSeparator for: 'es-AR' ) equals: ','
]

{ #category : 'tests' }
LocaleConventionsTest >> testNameCanBeAStringOrASymbol [

  self loadSpanishConventions.

  self
    assert: ( self numberPropertyNamed: 'decimalSeparator' for: 'es' ) equals: ',';
    assert: ( self numberPropertyNamed: #decimalSeparator for: 'es' ) equals: ','
]

{ #category : 'tests' }
LocaleConventionsTest >> testPropertyNotDefined [

  self
    should: [ self numberPropertyNamed: #decimalSeparator for: 'es' ]
    raise: ObjectNotFound
    withMessageText: 'There''s no decimalSeparator convention for es'.

  self load: '{"es": {"groupSeparator": "."}}'.

  self
    should: [ self numberPropertyNamed: #decimalSeparator for: 'es-AR' ]
    raise: ObjectNotFound
    withMessageText: 'There''s no decimalSeparator convention for es-AR'
]

{ #category : 'tests' }
LocaleConventionsTest >> testPropertyResolvedFromTheMostSpecificRange [

  self loadSpanishConventions.

  self
    assert: ( self numberPropertyNamed: #minimumGroupingDigits for: 'es-AR' ) equals: 1;
    assert: ( self numberPropertyNamed: #decimalSeparator for: 'es-AR' ) equals: ',';
    assert: ( self numberPropertyNamed: #plusSign for: 'es-AR' ) equals: '+';
    assert: ( self numberPropertyNamed: #minimumGroupingDigits for: 'es-ES' ) equals: 2;
    assert: ( self numberPropertyNamed: #minimumGroupingDigits for: 'es' ) equals: 2;
    assert: ( self numberPropertyNamed: #decimalSeparator for: 'fr-CA' ) equals: '.';
    assert: ( self numberPropertyNamed: #minimumGroupingDigits for: 'fr-CA' ) equals: 1
]

{ #category : 'tests' }
LocaleConventionsTest >> testUnknownPropertyInFile [

  self
    should: [ self load: '{"es": {"decimalSeparatr": ","}}' ]
    raise: AssertionFailed
    withMessageText: 'decimalSeparatr is not a number formatting convention'
]

{ #category : 'tests' }
LocaleConventionsTest >> testUnknownPropertyInLookup [

  self loadSpanishConventions.

  self
    should: [ self numberPropertyNamed: #currencySign for: 'es' ]
    raise: AssertionFailed
    withMessageText: 'currencySign is not a number formatting convention'
]
