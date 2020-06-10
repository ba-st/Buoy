Class {
	#name : #ExclusiveLogicalOr,
	#superclass : #Object,
	#category : #'Buoy-Deprecated'
}

{ #category : #Computing }
ExclusiveLogicalOr class >> collecting: aBlock ofAll: anObjectCollection [

	self
		deprecated: 'Use self equalityHashCombinator'
		transformWith:
			' ExclusiveLogicalOr collecting: `@aBlock ofAll: `@anObjectCollection'
				-> 'self equalityHashCombinator combineAll: `@collection doing: `@aBlock'.
	^ self equalityHashCombinator combineAll: anObjectCollection doing: aBlock
]

{ #category : #testing }
ExclusiveLogicalOr class >> isDeprecated [

	^ true
]

{ #category : #Computing }
ExclusiveLogicalOr class >> ofAll: anObjectCollection [

	self
		deprecated: 'Use self equalityHashCombinator'
		transformWith:
			' ExclusiveLogicalOr ofAll: `@collection'
				-> 'self equalityHashCombinator combineAll: `@collection'.
	^ self equalityHashCombinator combineAll: anObjectCollection
]

{ #category : #Computing }
ExclusiveLogicalOr class >> ofHashesOfAll: anObjectCollection [

	self
		deprecated: 'Use self equalityHashCombinator'
		transformWith:
			' ExclusiveLogicalOr ofHashesOfAll: `@collection'
				-> 'self equalityHashCombinator combineHashesOfAll: `@collection'.
	^ self equalityHashCombinator combineHashesOfAll: anObjectCollection
]
