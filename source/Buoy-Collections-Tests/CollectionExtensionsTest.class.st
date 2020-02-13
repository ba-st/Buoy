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
		assert: ( #(a b c d e f) copyFirst: 0 ) isEmpty;
		assert: ( #(a b c d e f) copyFirst: 2 ) equals: #(a b);
		assert: ( #(a b c d e f) copyFirst: 6 ) equals: #(a b c d e f).

	self should: [ #(a b c d e f) copyFirst: 7 ] raise: Error
]

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testCopyLast [

	self
		assert: ( #(a b c d e f) copyLast: 0 ) isEmpty;
		assert: ( #(a b c d e f) copyLast: 2 ) equals: #(e f);
		assert: ( #(a b c d e f) copyLast: 6 ) equals: #(a b c d e f).

	self should: [ #(a b c d e f) copyLast: 7 ] raise: Error
]

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testCopyNoMoreThanFirst [

	self
		assert: ( #(a b c d e f) copyNoMoreThanFirst: 0 ) isEmpty;
		assert: ( #(a b c d e f) copyNoMoreThanFirst: 2 ) equals: #(a b);
		assert: ( #(a b c d e f) copyNoMoreThanFirst: 6 ) equals: #(a b c d e f);
		assert: ( #(a b c d e f) copyNoMoreThanFirst: 20 ) equals: #(a b c d e f)
]

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testCopyNoMoreThanLast [

	self
		assert: ( #(a b c d e f) copyNoMoreThanLast: 0 ) isEmpty;
		assert: ( #(a b c d e f) copyNoMoreThanLast: 2 ) equals: #(e f);
		assert: ( #(a b c d e f) copyNoMoreThanLast: 6 ) equals: #(a b c d e f);
		assert: ( #(a b c d e f) copyNoMoreThanLast: 20 ) equals: #(a b c d e f)

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

{ #category : #'tests - copying' }
CollectionExtensionsTest >> testWithoutFirst [

	self
		assert: #(a b c d e f) withoutFirst equals: #(b c d e f);
		assert: ( #(a b c d e f) withoutFirst: 0 ) equals: #(a b c d e f);
		assert: ( #(a b c d e f) withoutFirst: 1 ) equals: #(b c d e f);
		assert: ( #(a b c d e f) withoutFirst: 2 ) equals: #(c d e f);
		assert: ( #(a b c d e f) withoutFirst: 6 ) isEmpty;
		assert: ( #(a b c d e f) withoutFirst: 20 ) isEmpty
]
