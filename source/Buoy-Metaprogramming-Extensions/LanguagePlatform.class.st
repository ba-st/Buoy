Class {
	#name : #LanguagePlatform,
	#superclass : #Object,
	#classInstVars : [
		'Current'
	],
	#category : #'Buoy-Metaprogramming-Extensions'
}

{ #category : #accessing }
LanguagePlatform class >> current [

	Current ifNil: [ Error signal: 'The language platform was not set' ].
	^Current
]

{ #category : #accessing }
LanguagePlatform class >> setCurrentTo: aLanguagePlatform [

	<ignoreForCoverage>
	Current := aLanguagePlatform.
	^ Current
]

{ #category : #reflection }
LanguagePlatform >> globalNamed: aSymbol ifAbsent: absentBlock [

	^ self subclassResponsibility
]

{ #category : #reflection }
LanguagePlatform >> includesGlobalNamed: aSymbol [

	^ self subclassResponsibility
]
