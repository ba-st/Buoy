Class {
	#name : #PharoPlatform,
	#superclass : #LanguagePlatform,
	#category : #'Buoy-Metaprogramming-Pharo-Extensions'
}

{ #category : #'class initialization' }
PharoPlatform class >> initialize [

	<ignoreForCoverage>
	LanguagePlatform setCurrentTo: self new
]

{ #category : #'process scheduling' }
PharoPlatform >> fork: block named: processName at: priority [

	^ block forkAt: priority named: processName
]

{ #category : #reflection }
PharoPlatform >> globalNamed: aSymbol ifAbsent: absentBlock [

	^ Smalltalk globals at: aSymbol ifAbsent: absentBlock
]

{ #category : #reflection }
PharoPlatform >> includesGlobalNamed: aSymbol [

	^ Smalltalk globals includesKey: aSymbol
]

{ #category : #accessing }
PharoPlatform >> os [

	^ OSPlatform current
]
