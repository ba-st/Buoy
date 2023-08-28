"
I'm a test case for extensions related to meta programming
"
Class {
	#name : #BuoyMetaprogrammingExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Metaprogramming-Tests'
}

{ #category : #tests }
BuoyMetaprogrammingExtensionsTest >> testBehaviorAllLeafSubclasses [

	self assert: self class allLeafSubclasses isEmpty.

	self
		assert: MessageSendingCollector allLeafSubclasses size equals: 2;
		assert: MessageSendingCollector allLeafSubclasses includes: KeywordMessageSendingCollector;
		assert: MessageSendingCollector allLeafSubclasses includes: UnaryMessageSendingCollector
]

{ #category : #tests }
BuoyMetaprogrammingExtensionsTest >> testBehaviorAllSubclassesDo [

	| collectorSubclasses |
	self class allSubclassesDo: [ :class | self fail ].

	collectorSubclasses := OrderedCollection new.
	MessageSendingCollector allSubclassesDo: [ :class |
		collectorSubclasses add: class ].
	self
		assert: collectorSubclasses size equals: 2;
		assert: collectorSubclasses
		includes: KeywordMessageSendingCollector;
		assert: collectorSubclasses includes: UnaryMessageSendingCollector
]

{ #category : #test }
BuoyMetaprogrammingExtensionsTest >> testIsA [

	self
		assert: (self isA: TestCase);
		assert: (self isA: self class);
		assert: (self isAn: Object);
		deny: (self isA: Number);
		deny: (self isAn: Integer);
		deny: (self isA: Collection)
]
