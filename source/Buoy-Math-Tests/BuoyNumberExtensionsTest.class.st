"
I'm a Test Case for the extensions defined in this package to Number.
"
Class {
	#name : #BuoyNumberExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Math-Tests'
}

{ #category : #tests }
BuoyNumberExtensionsTest >> testAsHexStringPaddedTo [

	self
		assert: (1 asHexStringPaddedTo: 4) equals: '0001';
		assert: (10 asHexStringPaddedTo: 4) equals: '000A';
		assert: (17 asHexStringPaddedTo: 4) equals: '0011';
		assert: (17 asHexStringPaddedTo: 2) equals: '11';
		assert: (17 asHexStringPaddedTo: 1) equals: '11'
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testCloseTo [

	self assert: (3 closeTo: 3.00001).
	self assert: (0 closeTo: 0.00001).
	self deny: (3.3345 closeTo: 3.335).

	self deny: (-1.0 closeTo: 1.0).

	self assert: (1.0 / 3.0 closeTo: 1 / 3).
	self assert: (1.0e-8 closeTo: 0).
	self assert: (0 closeTo: 1.0e-8).
	self assert: (1 + 1.0e-8 closeTo: 1.0)
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testCompoundingPercentages [

	self assert: ((200 increasedBy: 10 percent) decreasedBy: 10 percent) equals: 198
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testDecreasedBy [

	self
		assert: (1000 decreasedBy: 60 percent) equals: 400;
		assert: (200 decreasedBy: Percentage oneHundred) equals: 0;
		should: [ 143 decreasedBy: 101 percent ]
			raise: ArithmeticError
			withMessageText: 'A number can''t be decreased by a percentage greater than 100% and lesser than 0%';
		should: [ 1 decreasedBy: -1 percent ]
			raise: ArithmeticError
			withMessageText: 'A number can''t be decreased by a percentage greater than 100% and lesser than 0%'
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testIncreasedBy [

	self
		assert: (1000 increasedBy: 100 percent) equals: 2000;
		assert: (200 increasedBy: 10 percent) equals: 220;
		should: [ 1 increasedBy: -1 percent ]
			raise: ArithmeticError
			withMessageText: 'A number can''t be increased by a negative percentage'
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testIsPercentage [

	self
		assert: 10 percent isPercentage;
		deny: 10 isPercentage
]
