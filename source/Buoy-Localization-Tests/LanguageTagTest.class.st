"
A LanguageTagTest is a test class for testing the behavior of LanguageTag
"
Class {
	#name : 'LanguageTagTest',
	#superclass : 'TestCase',
	#category : 'Buoy-Localization-Tests',
	#package : 'Buoy-Localization-Tests'
}

{ #category : 'tests' }
LanguageTagTest >> testCantCreateWhenLanguageCodeIsInvalid [

	self
		should: [ LanguageTag fromString: 'e' ]
			raise: InstanceCreationFailed
			withMessageText: 'ISO 639 language codes must be 2 or 3 letters.';
		should: [ LanguageTag fromString: 'e2' ]
			raise: InstanceCreationFailed
			withMessageText: 'ISO 639 language codes must consist only of letters.'
]

{ #category : 'tests' }
LanguageTagTest >> testCantCreateWhenRegionIsInvalid [

	self
		should: [ LanguageTag fromString: 'en-A3' ]
		raise: InstanceCreationFailed
		withMessageText: 'Supported ISO 3166-1 codes must be 2 letters.'
]

{ #category : 'tests' }
LanguageTagTest >> testCantCreateWhenScriptIsInvalid [

	self
		should: [ LanguageTag fromString: 'en-L123' ]
		raise: InstanceCreationFailed
		withMessageText: 'ISO 15924 script codes must be 4 letters.'
]

{ #category : 'tests' }
LanguageTagTest >> testCantCreateWithEmptyString [

  self
    should: [ LanguageTag fromString: '' ]
    raise: InstanceCreationFailed
    withMessageText: 'At least one sub tag is required.'
]

{ #category : 'tests' }
LanguageTagTest >> testCantCreateWithoutSubtags [

  self
    should: [ LanguageTag composedOf: #(  ) ]
    raise: InstanceCreationFailed
    withMessageText: 'At least one sub tag is required.'
]

{ #category : 'tests' }
LanguageTagTest >> testComparison [

  | tag |
  tag := LanguageTag composedOf: #( 'en' 'US' ).
  self
    assert: tag equals: ( LanguageTag fromString: 'en-us' );
    assert: tag hash equals: ( LanguageTag fromString: 'en-us' ) hash;
    deny: tag equals: ( LanguageTag composedOf: #( 'en' ) )
]

{ #category : 'tests' }
LanguageTagTest >> testCreation [

	| tag |

	tag := LanguageTag fromString: 'en-Latn-US'.
	self assert: tag languageCode equals: 'en'.
	tag
		withScriptDo: [ :script | self assert: script equals: 'Latn' ];
		withRegionDo: [ :region | self assert: region equals: 'US' ].

	self assert: tag subtags equals: #('en' 'Latn' 'US')
]

{ #category : 'tests' }
LanguageTagTest >> testCreationWithExtensions [

	| tag |

	tag := LanguageTag fromString: 'en-Latn-GB-boont-r-extended-sequence-x-private'.
	self assert: tag languageCode equals: 'en'.
	tag
		withScriptDo: [ :script | self assert: script equals: 'Latn' ];
		withRegionDo: [ :region | self assert: region equals: 'GB' ].

	self
		assert: tag subtags
		equals: #('en' 'Latn' 'GB' 'boont' 'r' 'extended' 'sequence' 'x' 'private')
]

{ #category : 'tests' }
LanguageTagTest >> testCreationWithHorribleCase [

	| tag |

	tag := LanguageTag fromString: 'Es-lAtN-aR'.
	self assert: tag languageCode equals: 'es'.
	tag
		withScriptDo: [ :script | self assert: script equals: 'Latn' ];
		withRegionDo: [ :region | self assert: region equals: 'AR' ].

	self assert: tag subtags equals: #('es' 'Latn' 'AR')
]

{ #category : 'tests' }
LanguageTagTest >> testCreationWithOnlyLanguage [

	| tag |

	tag := LanguageTag fromString: 'en'.
	self assert: tag languageCode equals: 'en'.
	tag
		withScriptDo: [ :script | self fail ];
		withRegionDo: [ :region | self fail ].

	self assert: tag subtags equals: #('en')
]

{ #category : 'tests' }
LanguageTagTest >> testCreationWithRegionButNotScript [

	| tag |

	tag := LanguageTag fromString: 'en-us'.
	self assert: tag languageCode equals: 'en'.
	tag
		withScriptDo: [ :script | self fail ];
		withRegionDo: [ :region | self assert: region equals: 'US' ].

	self assert: tag subtags equals: #('en' 'US')
]

{ #category : 'tests' }
LanguageTagTest >> testCreationWithScriptButNoRegion [

	| tag |

	tag := LanguageTag fromString: 'es-latn'.
	self assert: tag languageCode equals: 'es'.
	tag
		withScriptDo: [ :script | self assert: script equals: 'Latn' ];
		withRegionDo: [ :region | self fail ].

	self assert: tag subtags equals: #('es' 'Latn')
]

{ #category : 'tests' }
LanguageTagTest >> testPrintString [

  | tag |
  tag := LanguageTag composedOf: #( 'en' 'US' ).
  self
    assert: tag asString equals: 'en-US';
    assert: tag printString equals: 'en-US'
]
