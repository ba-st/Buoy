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
BuoyNumberExtensionsTest >> testIntegerReadFromIfFail [

	self
		assert: (Integer readFrom: '12' ifFail: [ self fail ]) equals: 12;
		assert: (Integer readFrom: '-12' ifFail: [ self fail ]) equals: -12;
		assert: (Integer readFrom: 'AA' ifFail: [ 95 ]) equals: 95;
		assert: (Integer readFrom: '23AA' ifFail: [ self fail ]) equals: 23;
		assert: (Integer readFrom: 'AA33' ifFail: [ 95 ]) equals: 95;
		assert: (Integer readFrom: '12' readStream ifFail: [ self fail ])
		equals: 12
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testIsFinite [

	self assert: 1.1 isFinite.
	self assert: Float zero isFinite.
	self deny: Float nan isFinite.
	self deny: Float infinity isFinite.
	self deny: Float negativeInfinity isFinite
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testIsInfinite [

	self deny: 1.1 isInfinite.
	self deny: Float zero isInfinite.
	self deny: Float nan isInfinite.
	self assert: Float infinity isInfinite.
	self assert: Float negativeInfinity isInfinite
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testIsNaN [

	self deny: 1.1 isNaN.
	self deny: Float zero isNaN.
	self assert: Float nan isNaN.
	self deny: Float infinity isNaN.
	self deny: Float negativeInfinity isNaN
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testIsPercentage [

	self
		assert: 10 percent isPercentage;
		deny: 10 isPercentage
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testPrintStringHex [

	self
		assert: 1 printStringHex equals: '1';
		assert: 10 printStringHex equals: 'A';
		assert: 17 printStringHex equals: '11'
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testPrintStringLenghtPadded [

	self
		assert: (10 printStringLength: 4 padded: true) equals: '0010';
		assert: (-10 printStringLength: 4 padded: true) equals: '-010';
		assert: (10000 printStringLength: 4 padded: true) equals: '10000';
		assert: (1000 printStringLength: 4 padded: true) equals: '1000';
		assert: (10 printStringLength: 4 padded: false) equals: '  10'
]
