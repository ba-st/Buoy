Class {
	#name : #UnaryMessageSendingCollector,
	#superclass : #MessageSendingCollector,
	#instVars : [
		'receiver',
		'filterBlock'
	],
	#category : 'Buoy-Metaprogramming'
}

{ #category : #'Instance Creation' }
UnaryMessageSendingCollector class >> sendingAllMessagesBeginningWith: aPrefix andEndingWith: aSuffix to: aReceiver [

	^ self sendingAllMessagesMatching: [ :selector | (selector beginsWith: aPrefix) and: [ selector endsWith: aSuffix ] ] to: aReceiver
]

{ #category : #'Instance Creation' }
UnaryMessageSendingCollector class >> sendingAllMessagesBeginningWith: aPrefix to: aReceiver [

	^ self sendingAllMessagesMatching: [ :selector | selector beginsWith: aPrefix ] to: aReceiver
]

{ #category : #'Instance Creation' }
UnaryMessageSendingCollector class >> sendingAllMessagesEndingWith: aSuffix to: aReceiver [

	^ self sendingAllMessagesMatching: [ :selector | selector endsWith: aSuffix ] to: aReceiver
]

{ #category : #'Instance Creation' }
UnaryMessageSendingCollector class >> sendingAllMessagesMatching: aFilterBlock to: aReceiver [

	^ self new initializeSendingAllMessagesMatching: aFilterBlock to: aReceiver
]

{ #category : #private }
UnaryMessageSendingCollector >> filterBlock [

	^ filterBlock
]

{ #category : #initialization }
UnaryMessageSendingCollector >> initializeSendingAllMessagesMatching: aFilterBlock to: aReceiver [

	filterBlock := aFilterBlock.
	receiver := aReceiver
]

{ #category : #private }
UnaryMessageSendingCollector >> receiver [

	^ receiver
]

{ #category : #evaluating }
UnaryMessageSendingCollector >> value [

	^ self matchingSelectorsCollect: [ :selector | receiver perform: selector ]
]
