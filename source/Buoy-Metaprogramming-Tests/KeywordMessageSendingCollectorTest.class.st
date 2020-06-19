"
A KeywordMessageSendingCollectorTest is a test class for testing the behavior of KeywordMessageSendingCollector
"
Class {
	#name : #KeywordMessageSendingCollectorTest,
	#superclass : #TestCase,
	#instVars : [
		'arguments'
	],
	#category : #'Buoy-Metaprogramming-Tests'
}

{ #category : #initialization }
KeywordMessageSendingCollectorTest >> setUp [

	super setUp.
	arguments := OrderedCollection new
]

{ #category : #'tests-evaluating' }
KeywordMessageSendingCollectorTest >> testValue [

	(KeywordMessageSendingCollector sendingAllMessagesBeginningWith: 'zzzTest' andEndingWith: 'Add:' to: self with: 1) value.

	self
		assert: arguments size equals: 1;
		assert: arguments includes: 1
]

{ #category : #private }
KeywordMessageSendingCollectorTest >> zzzTestAdd: anArgument [

	arguments add: anArgument
]

{ #category : #private }
KeywordMessageSendingCollectorTest >> zzzTestAdd: anArgument testAdd: aSecondArgument [

	<ignoreForCoverage>
	"This methods must exist but not be executed"
	self fail
]
