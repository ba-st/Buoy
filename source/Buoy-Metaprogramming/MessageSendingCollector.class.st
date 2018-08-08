Class {
	#name : #MessageSendingCollector,
	#superclass : #Object,
	#category : 'Buoy-Metaprogramming'
}

{ #category : #private }
MessageSendingCollector >> filterBlock [

	^ self subclassResponsibility
]

{ #category : #private }
MessageSendingCollector >> matchingSelectorsCollect: aTransformationBlock [

	^ self receiver class allSelectors asSortedCollection
		select: self filterBlock
		thenCollect: aTransformationBlock
]

{ #category : #private }
MessageSendingCollector >> receiver [

	^ self subclassResponsibility
]

{ #category : #evaluating }
MessageSendingCollector >> value [

	^ self subclassResponsibility
]
