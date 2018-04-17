Class {
	#name : #KeywordMessageSendingCollector,
	#superclass : #MessageSendingCollector,
	#instVars : [
		'receiver',
		'filterBlock',
		'arguments'
	],
	#category : 'Buoy-Metaprogramming'
}

{ #category : #'Instance Creation' }
KeywordMessageSendingCollector class >> sendingAllMessagesBeginningWith: aPrefix andEndingWith: aSuffix to: aReceiver with: anArgument [

	^ self
		sendingAllMessagesMatching: [ :selector | (selector beginsWith: aPrefix) and: [ selector endsWith: aSuffix ] ]
		to: aReceiver
		withAll: {anArgument}
]

{ #category : #'Instance Creation' }
KeywordMessageSendingCollector class >> sendingAllMessagesMatching: aFilterBlock to: aReceiver withAll: anArgumentCollection [

	^ self new
		initializeSendingAllMessagesMatching: [ :selector | selector argumentCount = anArgumentCollection size and: [ aFilterBlock value: selector ] ]
		to: aReceiver
		withAll: anArgumentCollection asArray
]

{ #category : #private }
KeywordMessageSendingCollector >> filterBlock [

	^ filterBlock
]

{ #category : #initialization }
KeywordMessageSendingCollector >> initializeSendingAllMessagesMatching: aFilterBlock to: aReceiver withAll: anArgumentCollection [

	filterBlock := aFilterBlock.
	receiver := aReceiver.
	arguments := anArgumentCollection
]

{ #category : #private }
KeywordMessageSendingCollector >> receiver [

	^ receiver
]

{ #category : #evaluating }
KeywordMessageSendingCollector >> value [

	^ self matchingSelectorsCollect: [ :selector | receiver perform: selector withArguments: arguments ]
]
