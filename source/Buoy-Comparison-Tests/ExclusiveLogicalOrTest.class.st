Class {
	#name : #ExclusiveLogicalOrTest,
	#superclass : #TestCase,
	#category : #'Buoy-Comparison-Tests'
}

{ #category : #tests }
ExclusiveLogicalOrTest >> testComputeOnEmptyCollectionShouldRaiseError [

	self
		should: [ ExclusiveLogicalOr ofAll: #() ]
		raise: AssertionFailed
		withMessageText: 'Se requieren más de dos operandos para calcular el xor'
]

{ #category : #tests }
ExclusiveLogicalOrTest >> testComputedCollectingValuesInCollection [

	self
		assert: ( ExclusiveLogicalOr collecting: #hash ofAll: #('alpha' 'beta' 'gamma') )
		equals: ( ( 'alpha' hash bitXor: 'beta' hash ) bitXor: 'gamma' hash )
]

{ #category : #tests }
ExclusiveLogicalOrTest >> testComputedOnMoreThanOneElementCollection [

	self
		assert: ( ExclusiveLogicalOr ofAll: #(2 5 6) ) equals: ( ( 2 bitXor: 5 ) bitXor: 6 );
		assert: ( ExclusiveLogicalOr ofAll: #(20 1) ) equals: ( 1 bitXor: 20 );
		assert: ( ExclusiveLogicalOr ofAll: #(100 0 4 50) )
			equals: ( ( ( 100 bitXor: 50 ) bitXor: 4 ) bitXor: 0 )
]

{ #category : #tests }
ExclusiveLogicalOrTest >> testComputedOnSingleElementReturnsSameElement [

	self
		assert: ( ExclusiveLogicalOr ofAll: #(2) ) equals: 2;
		assert: ( ExclusiveLogicalOr ofAll: #(20) ) equals: 20;
		assert: ( ExclusiveLogicalOr ofAll: #(100) ) equals: 100 
]
