"
In GS64, a GsQuery is a programmatic way to define a query, allowing you to easily abstract, store
and reuse various aspects of the query.

This version is just a placeholder so we can easily create extensions methods to load in GS64 specific
packages.
"
Class {
	#name : 'GsQuery',
	#superclass : 'Object',
	#instVars : [
		'results',
		'queryString'
	],
	#category : 'Buoy-GS64-Compatibility',
	#package : 'Buoy-GS64-Compatibility'
}

{ #category : 'instance creation' }
GsQuery class >> fromString: aString options: anOption [

	^ self new initializeFromString: aString
]

{ #category : 'accessing' }
GsQuery >> asArray [

	^ self queryResult asArray
]

{ #category : 'accessing' }
GsQuery >> asSet [

	^ self queryResult asSet
]

{ #category : 'accessing' }
GsQuery >> do: aBlock [

	^ self queryResult do: aBlock
]

{ #category : 'initialization' }
GsQuery >> initializeFromString: aString [

	queryString := aString
]

{ #category : 'configuring' }
GsQuery >> on: anUnorderedCollection [

	( queryString includesSubstring: 'Silvester' ) ifTrue: [
		^ results := anUnorderedCollection select: [ :each | each firstName = 'Silvester' ] ].

	( queryString includesSubstring: 'SDF-1' ) ifTrue: [
		^ results := anUnorderedCollection select: [ :each |
			             each name = 'SDF-1' and: ( each fleet anySatisfy: [ :ship | ship name = 'VF-1D' ] ) ]
		].

	( queryString includesSubstring: '2117' ) ifTrue: [
		^ results := anUnorderedCollection select: [ :each | each firepower between: 2117 + 1 and: 8000 ] ].

	( queryString includesSubstring: '2001' ) ifTrue: [
		^ results := anUnorderedCollection select: [ :each | each firepower between: 2001 and: 6000 - 1 ] ]
]

{ #category : 'accessing' }
GsQuery >> queryResult [

	^ results
]

{ #category : 'accessing' }
GsQuery >> readStream [

	^ self queryResult asArray readStream
]

{ #category : 'accessing' }
GsQuery >> size [

	^ self queryResult size
]
