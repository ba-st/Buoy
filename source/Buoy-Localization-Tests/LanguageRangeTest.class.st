"
A LanguageRangeTest is a test class for testing the behavior of LanguageRange
"
Class {
	#name : 'LanguageRangeTest',
	#superclass : 'TestCase',
	#category : 'Buoy-Localization-Tests',
	#package : 'Buoy-Localization-Tests'
}

{ #category : 'tests' }
LanguageRangeTest >> testAny [

	self
		assert: LanguageRange any printString equals: '*';
		assert: LanguageRange any equals: LanguageRange any;
		assert: LanguageRange any hash equals: LanguageRange any hash;
		assert: LanguageRange any subtags equals: #('*')
]

{ #category : 'tests' }
LanguageRangeTest >> testAnyMatches [

	| range |

	range := LanguageRange any.
	self
		assert: ( range matches: 'en-Latn-US' asLanguageTag );
		assert: ( range matches: 'en' asLanguageTag );
		assert: ( range matches: 'es-ar' asLanguageTag )
]

{ #category : 'tests' }
LanguageRangeTest >> testAsLanguageRange [

  self
    assert: '*' asLanguageRange equals: LanguageRange any;
    assert: LanguageRange any asLanguageRange equals: LanguageRange any;
    assert: 'es-AR' asLanguageRange
    equals: ( LanguageRange composedOf: #( 'es' 'AR' ) ) asLanguageRange
]

{ #category : 'tests' }
LanguageRangeTest >> testCantCreateWhenLanguageCodeIsInvalid [

  self
    should: [ LanguageRange fromString: 'e' ]
    raise: InstanceCreationFailed
    withMessageText: 'ISO 639 language codes must be 2 or 3 letters.';
    should: [ LanguageRange fromString: 'e2' ]
    raise: InstanceCreationFailed
    withMessageText: 'ISO 639 language codes must consist only of letters.'
]

{ #category : 'tests' }
LanguageRangeTest >> testCantCreateWhenRegionIsInvalid [

  self
    should: [ LanguageRange fromString: 'en-A3' ]
    raise: InstanceCreationFailed
    withMessageText: 'Supported ISO 3166-1 codes must be 2 letters.'
]

{ #category : 'tests' }
LanguageRangeTest >> testCantCreateWhenScriptIsInvalid [

  self
    should: [ LanguageRange fromString: 'en-L123' ]
    raise: InstanceCreationFailed
    withMessageText: 'ISO 15924 script codes must be 4 letters.'
]

{ #category : 'tests' }
LanguageRangeTest >> testCantCreateWithEmptyString [

  self
    should: [ LanguageRange fromString: '' ]
    raise: InstanceCreationFailed
    withMessageText: 'At least one sub tag is required.'
]

{ #category : 'tests' }
LanguageRangeTest >> testCantCreateWithoutSubtags [

  self
    should: [ LanguageRange composedOf: #(  ) ]
    raise: InstanceCreationFailed
    withMessageText: 'At least one sub tag is required.'
]

{ #category : 'tests' }
LanguageRangeTest >> testComparison [

  | range |
  range := LanguageRange composedOf: #( 'en' 'US' ).
  self
    assert: range equals: ( LanguageRange fromString: 'en-us' );
    assert: range hash equals: ( LanguageRange fromString: 'en-us' ) hash;
    deny: range equals: LanguageRange any;
    deny: range equals: ( LanguageRange composedOf: #( 'en' ) )
]

{ #category : 'tests' }
LanguageRangeTest >> testCreation [

  | range |
  range := LanguageRange composedOf: #( 'en' 'Latn' 'us' ).
  self
    assert: range subtags equals: #( 'en' 'Latn' 'US' );
    assert: range printString equals: 'en-Latn-US'
]

{ #category : 'tests' }
LanguageRangeTest >> testMatches [

  | range |
  range := LanguageRange composedOf: #( 'en' 'US' ).
  self
    deny: ( range matches: 'en-Latn-US' asLanguageTag );
    assert: ( range matches: 'en-US' asLanguageTag );
    deny: ( range matches: 'en' asLanguageTag );
    assert: ( range matches: 'en-us-x-x-x' asLanguageTag );
    deny: ( range matches: 'en-CA' asLanguageTag ).

  range := LanguageRange composedOf: #( 'en' ).
  self
    assert: ( range matches: 'en-Latn-US' asLanguageTag );
    assert: ( range matches: 'en-US' asLanguageTag );
    assert: ( range matches: 'en-CA' asLanguageTag );
    assert: ( range matches: 'en' asLanguageTag );
    assert: ( range matches: 'en-us-x-x-x' asLanguageTag );
    deny: ( range matches: 'es' asLanguageTag )
]

{ #category : 'tests' }
LanguageRangeTest >> testSpecificity [

  self
    assert: '*' asLanguageRange specificity equals: 0;
    assert: 'es' asLanguageRange specificity equals: 1;
    assert: 'es-AR' asLanguageRange specificity equals: 2;
    assert: 'hy-Latn-IT-arevela' asLanguageRange specificity equals: 4
]
