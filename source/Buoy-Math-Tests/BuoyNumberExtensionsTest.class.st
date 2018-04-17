"
I'm a Test Case for the extensions defined in this package to Number.
"
Class {
	#name : #BuoyNumberExtensionsTest,
	#superclass : #TestCase,
	#category : 'Buoy-Math-Tests'
}

{ #category : #tests }
BuoyNumberExtensionsTest >> testCompoundingPercentages [

	self assert: ((200 increasedBy: 10 percent) decreasedBy: 10 percent) equals: 198
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testDecreasedBy [

	self
		assert: (1000 decreasedBy: 60 percent) equals: 400;
		assert: (200 decreasedBy: Percentage oneHundred) equals: 0;
		should: [ 143 decreasedBy: 101 percent ] raise: ArithmeticError;
		should: [ 1 decreasedBy: -1 percent ] raise: ArithmeticError
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testIncreasedBy [

	self
		assert: (1000 increasedBy: 100 percent) equals: 2000;
		assert: (200 increasedBy: 10 percent) equals: 220;
		should: [ 1 increasedBy: -1 percent ] raise: ArithmeticError
]

{ #category : #tests }
BuoyNumberExtensionsTest >> testIsPercentage [

	self
		assert: 10 percent isPercentage;
		deny: 10 isPercentage
]
