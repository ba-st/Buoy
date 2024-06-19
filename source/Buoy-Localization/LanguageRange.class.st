"
A language-range has the same syntax as a language-tag, or is the single character ""*"".

A language-range matches a language-tag if it exactly equals the tag,
or if it exactly equals a prefix of the tag such that the first
character following the prefix is ""-"".

The special range ""*"" matches any tag.  A protocol which uses
language ranges may specify additional rules about the semantics of
""*""; for instance, HTTP/1.1 specifies that the range ""*"" matches only
languages not matched by any other range within an ""Accept-Language:""
header.

Reference:

	https://datatracker.ietf.org/doc/html/rfc3066
"
Class {
	#name : 'LanguageRange',
	#superclass : 'Object',
	#instVars : [
		'languageTagOptional'
	],
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'instance creation' }
LanguageRange class >> any [

	^ self with: Optional unused
]

{ #category : 'instance creation' }
LanguageRange class >> from: aSubtagCollection [

	^ self with: ( Optional containing: ( LanguageTag from: aSubtagCollection ) )
]

{ #category : 'instance creation' }
LanguageRange class >> fromString: aString [

	^ aString = '*'
		then: [ self any ]
		otherwise: [ self with: ( Optional containing: ( LanguageTag fromString: aString ) ) ]
]

{ #category : 'private - instance creation' }
LanguageRange class >> with: aLanguageTagOptional [

	^ self new initializeWith: aLanguageTagOptional
]

{ #category : 'comparing' }
LanguageRange >> = anObject [

	^ self equalityChecker
		compare: #subtags;
		checkAgainst: anObject
]

{ #category : 'converting' }
LanguageRange >> asLanguageRange [

  ^ self
]

{ #category : 'converting' }
LanguageRange >> asString [

	^ self printString
]

{ #category : 'comparing' }
LanguageRange >> hash [

	^ languageTagOptional withContentDo: [ :tag | tag hash ] ifUnused: [ $* hash ]
]

{ #category : 'initialization' }
LanguageRange >> initializeWith: aLanguageTagOptional [

	languageTagOptional := aLanguageTagOptional
]

{ #category : 'testing' }
LanguageRange >> matches: aLanguageTag [

	^ languageTagOptional
		withContentDo: [ :tag | aLanguageTag subtags beginsWith: tag subtags ]
		ifUnused: [ true ]
]

{ #category : 'printing' }
LanguageRange >> printOn: stream [

	languageTagOptional withContentDo: [ :tag | tag printOn: stream ] ifUnused: [ stream nextPut: $* ]
]

{ #category : 'accessing' }
LanguageRange >> specificity [

  ^ languageTagOptional withContentDo: [ :languageTag | languageTag subtags size ] ifUnused: [ 0 ]
]

{ #category : 'accessing' }
LanguageRange >> subtags [

	^ languageTagOptional withContentDo: [ :tag | tag subtags ] ifUnused: [ #('*') ]
]
