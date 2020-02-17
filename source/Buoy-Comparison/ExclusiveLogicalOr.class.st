Class {
	#name : #ExclusiveLogicalOr,
	#superclass : #Object,
	#category : #'Buoy-Comparison'
}

{ #category : #Computing }
ExclusiveLogicalOr class >> collecting: aBlock ofAll: anObjectCollection [

	^self ofAll: (anObjectCollection collect: aBlock)
]

{ #category : #Computing }
ExclusiveLogicalOr class >> ofAll: anObjectCollection [

	anObjectCollection isEmpty
		ifTrue: [
			AssertionFailed 
				signal: 'At least 2 operands are required to compute the Logical Or'].

	^anObjectCollection withoutFirst
		inject: anObjectCollection first
		into: [:accumulatedBit :currentBit | accumulatedBit bitXor: currentBit]
]

{ #category : #Computing }
ExclusiveLogicalOr class >> ofHashesOfAll: anObjectCollection [

	^self collecting: #hash ofAll: anObjectCollection
]
