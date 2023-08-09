"
A PercentageTest is a test class for testing the behavior of Percentage
"
Class {
	#name : #PercentageTest,
	#superclass : #TestCase,
	#category : #'Buoy-Math-Tests'
}

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testAbs [

	self
		assert: Percentage zero abs equals: Percentage zero;
		assert: Percentage oneHundred abs equals: Percentage oneHundred;
		assert: (Percentage of: -15) abs equals: (Percentage of: 15);
		assert: (Percentage of: -15) abs printString equals: '15%'
]

{ #category : #'tests - converting' }
PercentageTest >> testAsFloat [

	self
		assert: 0 percent asFloat equals: 0.0;
		assert: 100 percent asFloat equals: 1.0;
		assert: 50 percent asFloat equals: 0.5;
		assert: 5.0 percent asFloat equals: 0.05
]

{ #category : #'tests - converting' }
PercentageTest >> testAsFraction [

	self
		assert: Percentage zero asFraction equals: 0;
		assert: Percentage oneHundred asFraction equals: 1;
		assert: ( Percentage of: 50 ) asFraction equals: 1 / 2
]

{ #category : #'tests - converting' }
PercentageTest >> testAsNumber [

	self
		assert: 0 percent asNumber equals: 0;
		assert: 100 percent asNumber equals: 1;
		assert: 50 percent asNumber equals: 1 / 2
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testBetweenAnd [

	self
		assert: (Percentage oneHundred between: Percentage zero and: 101 percent);
		assert: (Percentage oneHundred between: Percentage oneHundred and: (Percentage of: 101));
		assert: (Percentage oneHundred between: Percentage zero and: Percentage oneHundred);
		deny: (Percentage oneHundred between: 1.1 and: 1.2)
]

{ #category : #'tests - creation' }
PercentageTest >> testCreationShortcut [

	self
		assert: 5 percent printString equals: '5%';
		assert: 5 percent equals: 1 / 20;
		assert: 5.0 percent printString equals: '5.0%';
		assert: 5.0 percent equals: 0.05;
		runOnlyInPharo: [
			self assert: 5.0s2 percent printString equals: '5.00s2%' ];
		runOnlyInGemStone64: [ "Scaled decimals printString ommit scale (bug in GS)"
			self
				should: [
					self assert: 5.0s2 percent printString equals: '5.00s2%' ]
				raise: TestFailure ];
		assert: 5.0s2 percent equals: 0.05s2;
		runOnlyInPharo: [
			self assert: (1 / 2) percent printString equals: '(1/2)%' ];
		runOnlyInGemStone64: [
			self assert: (1 / 2) percent printString equals: '1/2%' ];
		assert: (1 / 2) percent equals: 1 / 200
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testDivisionWithFloats [

	self
		assert: Percentage zero / 100.0 equals: 0.0;
		runOnlyInPharo: [
			self should: [ 100.0 / Percentage zero ] raise: ZeroDivide ];
		runOnlyInGemStone64: [
			self assert: (100.0 / Percentage zero) isInfinite ];
		assert: Percentage oneHundred / 5.0 equals: 0.2;
		assert: 5.0 / Percentage oneHundred equals: 5.0;
		assert: (Percentage of: 50) / 5.0 equals: 0.1;
		assert: 5.0 / (Percentage of: 50) equals: 10.0
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testDivisionWithFractions [

	self
		assert: Percentage zero / (1 / 2) equals: 0;
		should: [ (1 / 2) / Percentage zero ] raise: ZeroDivide;
		assert: Percentage oneHundred / (3 / 4) equals: 4 / 3;
		assert: (3 / 4) / Percentage oneHundred equals: 3 / 4;
		assert: (Percentage of: 50) / (3 / 4) equals: 2 / 3;
		assert: (3 / 4) / (Percentage of: 50) equals: 3 / 2
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testDivisionWithIntegers [

	self
		assert: Percentage zero / 100 equals: 0;
		should: [ 100 / Percentage zero ] raise: ZeroDivide;
		assert: Percentage oneHundred / 5 equals: 1 / 5;
		assert: 5 / Percentage oneHundred equals: 5;
		assert: (Percentage of: 50) / 5 equals: 1 / 10;
		assert: 5 / (Percentage of: 50) equals: 10
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testDivisionWithScaledDecimals [

	self
		assert: Percentage zero / 100.0s2 equals: 0.0s2;
		should: [ 100.0s2 / Percentage zero ] raise: ZeroDivide;
		assert: Percentage oneHundred / 5.0s2 equals: 0.2s2;
		assert: 5.0s2 / Percentage oneHundred equals: 5.0s2;
		assert: (Percentage of: 50) / 5.0s2 equals: 0.1s2;
		assert: 5.0s2 / (Percentage of: 50) equals: 10.0s2
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testEquals [

	self
		assert: Percentage zero equals: Percentage zero;
		assert: Percentage oneHundred equals: (Percentage ratio: 1)
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testEqualsWithFloats [

	self
		assert: (Percentage ratio: 0.0) equals: 0.0;
		assert: 0.0 equals: (Percentage ratio: 0.0);
		assert: (Percentage ratio: 1.0) equals: 1.0;
		assert: 1.0 equals: (Percentage ratio: 1.0)
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testEqualsWithFractions [

	self
		assert: (Percentage ratio: 3/2) equals: 3/2;
		assert: 3/2 equals: (Percentage ratio: 3/2)
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testEqualsWithIntegers [

	self
		assert: Percentage zero equals: 0;
		assert: 0 equals: Percentage zero;
		assert: Percentage oneHundred equals: 1;
		assert: 1 equals: Percentage oneHundred
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testEqualsWithScaledDecimals [

	self
		assert: (Percentage ratio: 0.0s2) equals: 0.0s2;
		assert: 0.0s2 equals: (Percentage ratio: 0.0s2);
		assert: (Percentage ratio: 1.0s2) equals: 1.0s2;
		assert: 1.0s2 equals: (Percentage ratio: 1.0s2);
		assert: 4.32s2 equals: (Percentage ratio: 4.32s2)
]

{ #category : #'tests - testing' }
PercentageTest >> testEven [

	self
		assert: Percentage zero even;
		deny: Percentage oneHundred even;
		deny: (Percentage of: 14) even
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testGreaterThan [

	self
		assert: Percentage oneHundred > Percentage zero;
		assert: 1 > Percentage zero;
		deny: Percentage zero > Percentage zero;
		assert: Percentage zero > -1
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testGreaterThanEquals [

	self
		assert: Percentage oneHundred >= Percentage zero;
		assert: 1 >= Percentage zero;
		assert: Percentage zero >= Percentage zero;
		assert: 0 >= Percentage zero;
		assert: Percentage zero >= -1
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testHash [

	self
		assert: Percentage zero hash equals: Percentage zero hash;
		assert: Percentage oneHundred hash equals: (Percentage ratio: 1) hash;
		assert: (Percentage ratio: 0.0s2) hash equals: 0.0s2 hash;
		assert: Percentage zero hash equals: 0 hash;
		assert: (Percentage ratio: 3 / 2) hash equals: (3 / 2) hash;
		assert: 1.123 hash equals: (Percentage ratio: 1.123) hash
]

{ #category : #'tests - testing' }
PercentageTest >> testIsAbstract [

	self
		deny: Percentage isAbstract;
		assert: Percentage superclass isAbstract
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testLessThan [

	self
		assert: Percentage zero < Percentage oneHundred;
		assert: Percentage zero < 1;
		deny: Percentage zero < Percentage zero;
		assert: -1 < Percentage zero
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testLessThanEquals [

	self
		assert: Percentage zero <= Percentage oneHundred;
		assert: Percentage zero <= 1;
		assert: Percentage zero <= Percentage zero;
		assert: -1 <= Percentage zero
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testMax [

	self assert: (Percentage oneHundred max: Percentage zero) equals: Percentage oneHundred
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testMin [

	self assert: (Percentage oneHundred min: Percentage zero) equals: Percentage zero
]

{ #category : #'tests - testing' }
PercentageTest >> testNegative [

	self
		deny: Percentage zero negative;
		deny: Percentage oneHundred negative;
		assert: (Percentage of: -114) negative
]

{ #category : #'tests - magnitude-API' }
PercentageTest >> testNotEquals [

	self
		assert: Percentage zero ~= Percentage oneHundred;
		assert: Percentage oneHundred ~= Percentage zero;
		assert: Percentage zero ~= 1
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testNthRoot [

	self
		assert: ( 0 percent nthRoot: 2 ) equals: 0;
		assert: ( 100 percent nthRoot: 2 ) equals: 1;
		assert: ( 400 percent nthRoot: 2 ) equals: 2;
		assert: ( 0 percent nthRoot: 4 ) equals: 0;
		assert: ( 100 percent nthRoot: 4 ) equals: 1;
		assert: ( 1600 percent nthRoot: 4 ) equals: 2
]

{ #category : #'tests - testing' }
PercentageTest >> testOdd [

	self
		deny: Percentage zero odd;
		assert: Percentage oneHundred odd;
		assert: (Percentage of: 14) odd
]

{ #category : #'tests - testing' }
PercentageTest >> testPositive [

	self
		assert: Percentage zero positive;
		assert: Percentage oneHundred positive;
		deny: (Percentage of: -114) positive
]

{ #category : #'tests - printing' }
PercentageTest >> testPrintOn [

	self
		assert: Percentage zero printString equals: '0%';
		assert: Percentage oneHundred printString equals: '100%';
		assert: (Percentage of: 15) printString equals: '15%';
		assert: (Percentage ratio: 3/2) printString equals: '150%'
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testProduct [

	self
		assert: Percentage zero * 100 equals: 0;
		assert: 100 * Percentage zero equals: 0;
		assert: Percentage oneHundred * 5 equals: 5;
		assert: 5 * Percentage oneHundred equals: 5;
		assert: (Percentage of: 50) * 5 equals: 5 / 2;
		assert: 5 * (Percentage of: 50) equals: 5 / 2
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testProductWithFloats [

	self
		assert: Percentage zero * 100.0 equals: 0.0;
		assert: 100.0 * Percentage zero equals: 0.0;
		assert: Percentage oneHundred * 5.0 equals: 5.0;
		assert: 5.0 * Percentage oneHundred equals: 5.0;
		assert: (Percentage of: 50.0) * 5.0 equals: 2.5;
		assert: 5.0 * (Percentage of: 50.0) equals: 2.5
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testProductWithFractions [

	self
		assert: Percentage zero * (1 / 2) equals: 0;
		assert: 1 / 2 * Percentage zero equals: 0;
		assert: Percentage oneHundred * (3 / 4) equals: 3 / 4;
		assert: 3 / 4 * Percentage oneHundred equals: 3 / 4;
		assert: (Percentage of: 50) * (3 / 4) equals: 3 / 8;
		assert: 3 / 4 * (Percentage of: 50) equals: 3 / 8
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testProductWithScaledDecimals [

	self
		assert: Percentage zero * 100.0s2 equals: 0.0s2;
		assert: 100.0s2 * Percentage zero equals: 0.0s2;
		assert: Percentage oneHundred * 5.0s2 equals: 5.0s2;
		assert: 5.0s2 * Percentage oneHundred equals: 5.0s2;
		assert: (Percentage of: 50.0s2) * 5.0s2 equals: 2.5s2;
		assert: 5.0s2 * (Percentage of: 50.0s2) equals: 2.5s2
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testReciprocal [

	self
		should: [ Percentage zero reciprocal ] raise: ZeroDivide;
		assert: Percentage oneHundred reciprocal equals: Percentage oneHundred;
		assert: Percentage oneHundred reciprocal printString equals: '100%';
		assert: (Percentage of: 50) reciprocal equals: (Percentage of: 200);
		assert: (Percentage of: 50) reciprocal printString equals: '200%'
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testRound [

	self assert: ( ( Percentage ratio: 6 / 90 ) round: 2 ) equals: 7 / 100
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testSqrt [

	self
		assert: Percentage zero sqrt equals: 0;
		assert: Percentage oneHundred sqrt equals: 1;
		assert: 400 percent sqrt equals: 2
]

{ #category : #'tests - printing' }
PercentageTest >> testStoreOn [

	self
		assert: Percentage zero storeString equals: 'Percentage zero';
		assert: Percentage oneHundred storeString equals: 'Percentage oneHundred';
		assert: (Percentage of: 12) storeString equals: '12 percent'
]

{ #category : #'tests - testing' }
PercentageTest >> testStrictlyPositive [

	self
		deny: Percentage zero strictlyPositive;
		assert: Percentage oneHundred strictlyPositive;
		deny: (Percentage of: -114) strictlyPositive
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testSubtraction [

	self
		assert: Percentage zero - Percentage oneHundred equals: Percentage oneHundred negated;
		assert: (Percentage zero - Percentage oneHundred) printString equals: '-100%';
		assert: Percentage oneHundred - (Percentage of: 5) equals: (Percentage of: 95);
		assert: (Percentage oneHundred - (Percentage of: 5)) printString equals: '95%'
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testSubtractionWithFloats [

	self
		assert: Percentage zero - 100.0 equals: -100.0;
		assert: 100.0 - Percentage zero equals: 100.0;
		assert: Percentage oneHundred - 5.0 equals: -4.0;
		assert: 5.0 - Percentage oneHundred equals: 4.0;
		assert: (Percentage of: 50) - 5.0 equals: -4.5;
		assert: 5.0 - (Percentage of: 50) equals: 4.5
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testSubtractionWithFractions [

	self
		assert: Percentage zero - (1/2) equals: -1/2;
		assert: 1/2 - Percentage zero equals: 1/2;
		assert: Percentage oneHundred - (1/2) equals: 1/2;
		assert: 1/2 - Percentage oneHundred equals: -1/2;
		assert: (Percentage of: 50) - (1/2) equals: 0;
		assert: 1/2 - (Percentage of: 50) equals: 0
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testSubtractionWithScaledDecimals [

	self
		assert: Percentage zero - 100.0s2 equals: -100.0s2;
		assert: 100.0s2 - Percentage zero equals: 100.0s2;
		assert: Percentage oneHundred - 5.0s2 equals: -4.0s2;
		assert: 5.0s2 - Percentage oneHundred equals: 4.0s2;
		assert: (Percentage of: 50) - 5.0s2 equals: -4.5s2;
		assert: 5.0s2 - (Percentage of: 50) equals: 4.5s2
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testSum [

	self
		assert: Percentage zero + Percentage oneHundred equals: Percentage oneHundred;
		assert: (Percentage zero + Percentage oneHundred) printString equals: '100%';
		assert: Percentage oneHundred + (Percentage of: 5) equals: (Percentage of: 105);
		assert: (Percentage oneHundred + (Percentage of: 5)) printString equals: '105%'
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testSumWithFloats [

	self
		assert: Percentage zero + 100.0 equals: 100.0;
		assert: 100.0 + Percentage zero equals: 100.0;
		assert: Percentage oneHundred + 5.0 equals: 6.0;
		assert: 5.0 + Percentage oneHundred equals: 6.0;
		assert: (Percentage of: 50) + 5.0 equals: 5.5;
		assert: 5.0 + (Percentage of: 50) equals: 5.5
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testSumWithFractions [

	self
		assert: Percentage zero + (1/2) equals: 1/2;
		assert: 1/2 + Percentage zero equals: 1/2;
		assert: Percentage oneHundred + (1/2) equals: 3/2;
		assert: 1/2 + Percentage oneHundred equals: 3/2;
		assert: (Percentage of: 50) + (1/2) equals: 1;
		assert: 1/2 + (Percentage of: 50) equals: 1
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testSumWithIntegers [

	self
		assert: Percentage zero + 100 equals: 100;
		assert: 100 + Percentage zero equals: 100;
		assert: Percentage oneHundred + 5 equals: 6;
		assert: 5 + Percentage oneHundred equals: 6;
		assert: (Percentage of: 50) + 5 equals: 11 / 2;
		assert: 5 + (Percentage of: 50) equals: 11 / 2
]

{ #category : #'tests - arithmetic-API' }
PercentageTest >> testSumWithScaledDecimals [

	self
		assert: Percentage zero + 100.0s2 equals: 100.0s2;
		assert: 100.0s2 + Percentage zero equals: 100.0s2;
		assert: Percentage oneHundred + 5.0s2 equals: 6.0s2;
		assert: 5.0s2 + Percentage oneHundred equals: 6.0s2;
		assert: (Percentage of: 50) + 5.0s2 equals: 5.5s2;
		assert: 5.0s2 + (Percentage of: 50) equals: 5.5s2
]
