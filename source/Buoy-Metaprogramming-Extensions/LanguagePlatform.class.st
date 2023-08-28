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

{ #category : #'process scheduling' }
LanguagePlatform >> fork: block named: processName at: priority [

	self subclassResponsibility
]

{ #category : #reflection }
LanguagePlatform >> globalNamed: aSymbol ifAbsent: absentBlock [

	^ self subclassResponsibility
]

{ #category : #reflection }
LanguagePlatform >> globalNamed: aSymbol ifPresent: presentBlock ifAbsent: absentBlock [

	| global |
	global := self globalNamed: aSymbol ifAbsent: [ ^ absentBlock value ].
	^ presentBlock cull: global
]

{ #category : #reflection }
LanguagePlatform >> includesGlobalNamed: aSymbol [

	^ self subclassResponsibility
]

{ #category : #accessing }
LanguagePlatform >> os [
	"Returns the underlying operating system abstraction"

	^ self subclassResponsibility
]
