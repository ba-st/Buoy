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
				signal: 'Se requieren más de dos operandos para calcular el xor'].

	^anObjectCollection withoutFirst
		inject: anObjectCollection first
		into: [:accumulatedBit :currentBit | accumulatedBit bitXor: currentBit]
]

{ #category : #Computing }
ExclusiveLogicalOr class >> ofHashesOfAll: anObjectCollection [

	^self collecting: #hash ofAll: anObjectCollection
]
