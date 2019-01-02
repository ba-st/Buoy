"
I'm a test case for extensions to the collection hierarchy
"
Class {
	#name : #CollectionExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Collections-Tests'
}

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testCopyFirst [

	self
		assert: ( #(p r u e b a) copyFirst: 0 ) isEmpty;
		assert: ( #(p r u e b a) copyFirst: 2 ) equals: #(p r);
		assert: ( #(p r u e b a) copyFirst: 6 ) equals: #(p r u e b a).

	self should: [ #(p r u e b a) copyFirst: 7 ] raise: Error
]

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testCopyLast [

	self
		assert: ( #(p r u e b a) copyLast: 0 ) isEmpty;
		assert: ( #(p r u e b a) copyLast: 2 ) equals: #(b a);
		assert: ( #(p r u e b a) copyLast: 6 ) equals: #(p r u e b a).

	self should: [ #(p r u e b a) copyLast: 7 ] raise: Error
]

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testCopyNoMoreThanFirst [

	self
		assert: ( #(p r u e b a) copyNoMoreThanFirst: 0 ) isEmpty;
		assert: ( #(p r u e b a) copyNoMoreThanFirst: 2 ) equals: #(p r);
		assert: ( #(p r u e b a) copyNoMoreThanFirst: 20 ) equals: #(p r u e b a);
		assert: ( #(p r u e b a) copyNoMoreThanFirst: 6 ) equals: #(p r u e b a)
]

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testCopyNoMoreThanLast [

	self
		assert: ( #(p r u e b a) copyNoMoreThanLast: 0 ) isEmpty;
		assert: ( #(p r u e b a) copyNoMoreThanLast: 2 ) equals: #(b a);
		assert: ( #(p r u e b a) copyNoMoreThanLast: 20 ) equals: #(p r u e b a);
		assert: ( #(p r u e b a) copyNoMoreThanLast: 6 ) equals: #(p r u e b a)
]

{ #category : #tests }
CollectionExtensionsTest >> testMaxUsing [

	self assert: ( #(#(1) #(3 1) #(2)) maxUsing: [ :anArray | anArray first ] ) equals: 3.
	
	self should: [ #() maxUsing: [ :anArray | anArray first ] ] raise: Error
]

{ #category : #tests }
CollectionExtensionsTest >> testMinUsing [

	self assert: ( #(#(3 1) #(1) #(2)) minUsing: [ :anArray | anArray first ] ) equals: 1.
	self should: [ #() minUsing: [ :anArray | anArray first ] ] raise: Error
]
