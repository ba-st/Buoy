"
An UnaryMessageSendingCollectorTest is a test class for testing the behavior of UnaryMessageSendingCollector
"
Class {
	#name : #UnaryMessageSendingCollectorTest,
	#superclass : #TestCase,
	#instVars : [
		'messagesSent'
	],
	#category : #'Buoy-Metaprogramming-Tests'
}

{ #category : #initialization }
UnaryMessageSendingCollectorTest >> setUp [

	super setUp.
	messagesSent := IdentitySet new
]

{ #category : #'tests-evaluating' }
UnaryMessageSendingCollectorTest >> testValue [

	( UnaryMessageSendingCollector
		sendingAllMessagesBeginningWith: 'zzzTest'
		andEndingWith: 'Test'
		to: self ) value.

	self
		assert: messagesSent size equals: 1;
		assert: messagesSent includes: #zzzTest
]

{ #category : #'tests-evaluating' }
UnaryMessageSendingCollectorTest >> testValueWithPrefix [

	( UnaryMessageSendingCollector sendingAllMessagesBeginningWith: 'zzzTest' to: self ) value.

	self
		assert: messagesSent size equals: 2;
		assert: messagesSent includes: #zzzTest;
		assert: messagesSent includes: #zzzTest2
]

{ #category : #'tests-evaluating' }
UnaryMessageSendingCollectorTest >> testValueWithSuffix [

	( UnaryMessageSendingCollector sendingAllMessagesEndingWith: 'Test2' to: self ) value.

	self
		assert: messagesSent size equals: 2;
		assert: messagesSent includes: #zzzTest2;
		assert: messagesSent includes: #zzTest2
]

{ #category : #private }
UnaryMessageSendingCollectorTest >> zzTest [

	<ignoreForCoverage>
	"This methods must exist but not be executed"
	self fail
]

{ #category : #private }
UnaryMessageSendingCollectorTest >> zzTest2 [

	messagesSent add: #zzTest2
]

{ #category : #private }
UnaryMessageSendingCollectorTest >> zzzTest [

	messagesSent add: #zzzTest
]

{ #category : #private }
UnaryMessageSendingCollectorTest >> zzzTest2 [

	messagesSent add: #zzzTest2
]
