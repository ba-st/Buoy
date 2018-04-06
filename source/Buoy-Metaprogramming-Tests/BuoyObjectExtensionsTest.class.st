Class {
	#name : #BuoyObjectExtensionsTest,
	#superclass : #TestCase,
	#category : 'Buoy-Metaprogramming-Tests'
}

{ #category : #test }
BuoyObjectExtensionsTest >> testIsA [

	self
		assert: (self isA: TestCase);
		assert: (self isA: self class);
		assert: (self isAn: Object);
		deny: (self isA: Number);
		deny: (self isAn: Integer);
		deny: (self isA: Collection)
]
