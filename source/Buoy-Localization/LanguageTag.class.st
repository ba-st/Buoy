"
A language tag is used to label the language used by some information content.

These tags can also be used to specify the user's preferences when selecting information 
content or to label additional attributes of content and associated
resources.

Sometimes language tags are used to indicate additional language
attributes of content.  

Reference: 

	https://www.rfc-editor.org/rfc/rfc5646.html

"
Class {
	#name : 'LanguageTag',
	#superclass : 'Object',
	#instVars : [
		'languageCode',
		'scriptOptional',
		'regionOptional',
		'subtags'
	],
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'instance creation' }
LanguageTag class >> from: aSubtagCollection [

	AssertionChecker
		enforce: [ aSubtagCollection notEmpty ]
		because: 'At least a sub tag is required.'
		raising: InstanceCreationFailed.

	^ self new initializeFrom: aSubtagCollection
]

{ #category : 'instance creation' }
LanguageTag class >> fromString: aString [

	^ self from: ( aString substrings: '-' )
]

{ #category : 'comparing' }
LanguageTag >> = anObject [

	^ self equalityChecker
		compare: #subtags;
		checkAgainst: anObject
]

{ #category : 'converting' }
LanguageTag >> asByteArray [

	^ self printString asByteArray
]

{ #category : 'converting' }
LanguageTag >> asLanguageTag [

	^ self
]

{ #category : 'printing' }
LanguageTag >> asString [

	^ self printString
]

{ #category : 'private' }
LanguageTag >> assertIsValid [

	AssertionCheckerBuilder new
		raising: InstanceCreationFailed;
		checking: [ :asserter | 
			asserter
				enforce: [ languageCode size between: 2 and: 3 ]
					because: 'ISO 639 language codes must be 2 or 3 letters.';
				enforce: [ languageCode allSatisfy: #isLetter ]
					because: 'ISO 639 language codes must consist only of letters.'.
			self
				withScriptDo: [ :script | 
					asserter
						enforce: [ script size = 4 ] because: 'ISO 15924 script codes must be 4 letters.';
						enforce: [ script allSatisfy: #isLetter ]
							because: 'ISO 15924 script codes must be 4 letters.'
					];
				withRegionDo: [ :region | 
					asserter
						enforce: [ region size = 2 ] because: 'Supported ISO 3166-1 codes must be 2 letters.';
						enforce: [ region allSatisfy: #isLetter ]
							because: 'Supported ISO 3166-1 codes must be 2 letters.'
					]
			];
		buildAndCheck
]

{ #category : 'comparing' }
LanguageTag >> hash [

	^ self equalityHashCombinator combineHashesOfAll: subtags
]

{ #category : 'initialization' }
LanguageTag >> initializeFrom: aSubtagCollection [

	subtags := Array withAll: aSubtagCollection.
	self
		initializeLanguageCode;
		initializeScript;
		initializeRegion;
		assertIsValid
]

{ #category : 'private' }
LanguageTag >> initializeLanguageCode [

	subtags at: 1 put: subtags first asLowercase.
	languageCode := subtags first
]

{ #category : 'private' }
LanguageTag >> initializeRegion [

	regionOptional := Optional unused.
	scriptOptional
		withContentDo: [ self initializeRegionTaggedAt: 3 ]
		ifUnused: [ self initializeRegionTaggedAt: 2 ]
]

{ #category : 'private' }
LanguageTag >> initializeRegionTaggedAt: index [

	[ | regionCandidate |

	regionCandidate := ( subtags at: index ) asUppercase.
	regionCandidate size = 2 then: [ 
			subtags at: index put: regionCandidate.
			regionOptional := Optional containing: regionCandidate
			]
	] unless: subtags size < index
]

{ #category : 'private' }
LanguageTag >> initializeScript [

	scriptOptional := Optional unused.

	[ 
	| scriptCandidate |
	scriptCandidate := subtags second asLowercase capitalized.
	scriptCandidate size = 4 then: [ 
		subtags at: 2 put: scriptCandidate.
		scriptOptional := Optional containing: scriptCandidate
		]
	] unless: subtags size = 1
]

{ #category : 'accessing' }
LanguageTag >> languageCode [

	^ languageCode
]

{ #category : 'printing' }
LanguageTag >> printOn: stream [

	subtags do: [ :subtag | stream nextPutAll: subtag ] separatedBy: [ stream nextPut: $- ]
]

{ #category : 'accessing' }
LanguageTag >> subtags [

	^ subtags
]

{ #category : 'accessing' }
LanguageTag >> withRegionDo: aBlock [

	regionOptional withContentDo: aBlock
]

{ #category : 'accessing' }
LanguageTag >> withScriptDo: aBlock [

	scriptOptional withContentDo: aBlock
]
