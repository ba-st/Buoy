"
I'm a test case for BinarySearchAlgorithm
"
Class {
	#name : #BinarySearchAlgorithmTest,
	#superclass : #TestCase,
	#category : #'Buoy-Collections-Tests'
}

{ #category : #private }
BinarySearchAlgorithmTest >> assertExpectedInsertionIndexFor: key in: collection is: expectedIndex [

	self assert: ( BinarySearchAlgorithm searchFor: key in: collection using: [ :number | number ] ) execute equals: expectedIndex
]

{ #category : #tests }
BinarySearchAlgorithmTest >> testExecute [

	self assertExpectedInsertionIndexFor: 1 in: #(1 2 3) is: 2.
	self assertExpectedInsertionIndexFor: 1 in: #(1 1 1 2 3 4 5) is: 4.
	self assertExpectedInsertionIndexFor: 3 in: #(1 1 1 2 3 3 4 5) is: 7.
	self assertExpectedInsertionIndexFor: 5 in: #(1 2 3 4 5) is: 6.
	self assertExpectedInsertionIndexFor: 5 in: #(1 2 3 4 5 5) is: 7.

	self assertExpectedInsertionIndexFor: 4 in: #(1 5) is: 2.
	self assertExpectedInsertionIndexFor: 0 in: #(1 5) is: 1.
	self assertExpectedInsertionIndexFor: 6 in: #(1 5) is: 3
]

{ #category : #tests }
BinarySearchAlgorithmTest >> testExecuteWithSymbol [

	self assert: ( BinarySearchAlgorithm searchFor: 1 in: #(#(1) #(2 1) #(3)) using: #first ) execute equals: 2
]
