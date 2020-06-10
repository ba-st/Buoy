"
A BitwiseExclusiveDisjunctionHashCombinatorTest is a test class for testing the behavior of BitwiseExclusiveDisjunctionHashCombinator
"
Class {
	#name : #BitwiseExclusiveDisjunctionHashCombinatorTest,
	#superclass : #TestCase,
	#instVars : [
		'hashCombinator'
	],
	#category : #'Buoy-Comparison-Tests'
}

{ #category : #running }
BitwiseExclusiveDisjunctionHashCombinatorTest >> setUp [

	super setUp.
	hashCombinator := BitwiseExclusiveDisjunctionHashCombinator new
]

{ #category : #tests }
BitwiseExclusiveDisjunctionHashCombinatorTest >> testCannotCombineAnEmptyCollection [

	self
		should: [ hashCombinator combineAll: #() ]
		raise: AssertionFailed
		withMessageText: 'Cannot combine an empty collection of hashes'
]

{ #category : #tests }
BitwiseExclusiveDisjunctionHashCombinatorTest >> testCombineAll [

	self
		assert: ( hashCombinator combineAll: #(2 5 6) ) equals: ( ( 2 bitXor: 5 ) bitXor: 6 );
		assert: ( hashCombinator combineAll: #(20 1) ) equals: ( 1 bitXor: 20 );
		assert: ( hashCombinator combineAll: #(100 0 4 50) )
			equals: ( ( ( 100 bitXor: 50 ) bitXor: 4 ) bitXor: 0 );
		assert: ( hashCombinator combineAll: #(2) ) equals: 2;
		assert: ( hashCombinator combineAll: #(20) ) equals: 20;
		assert: ( hashCombinator combineAll: #(100) ) equals: 100
]

{ #category : #tests }
BitwiseExclusiveDisjunctionHashCombinatorTest >> testCombineHashOfWith [

	self
		assert: ( hashCombinator combineHashOf: 'alpha' with: 'beta' )
		equals: ( 'alpha' hash bitXor: 'beta' hash )
]

{ #category : #tests }
BitwiseExclusiveDisjunctionHashCombinatorTest >> testCombineHashesOfAll [

	self
		assert: ( hashCombinator combineHashesOfAll: #('alpha' 'beta' 'gamma') )
		equals: ( ( 'alpha' hash bitXor: 'beta' hash ) bitXor: 'gamma' hash )
]
