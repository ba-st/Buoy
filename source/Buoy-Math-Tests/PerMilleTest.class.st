"
A PerMilleTest is a test class for testing the behavior of PerMille
"
Class {
	#name : #PerMilleTest,
	#superclass : #TestCase,
	#category : #'Buoy-Math-Tests'
}

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testAbs [

	self
		assert: 0 perMille abs equals: 0 perMille;
		assert: 1000 perMille abs equals: 1000 perMille;
		assert: -15 perMille abs equals: 15 perMille;
		assert: -15 perMille abs printString equals: '15‰'
]

{ #category : #'tests - converting' }
PerMilleTest >> testAsFloat [

	self
		assert: 0 perMille asFloat equals: 0.0;
		assert: 1000 perMille asFloat equals: 1.0;
		assert: 500 perMille asFloat equals: 0.5;
		assert: 5.0 perMille asFloat equals: 0.005
]

{ #category : #'tests - converting' }
PerMilleTest >> testAsFraction [

	self
		assert: 0 perMille asFraction equals: 0;
		assert: 1000 perMille asFraction equals: 1;
		assert: 500 perMille asFraction equals: 1 / 2
]

{ #category : #'tests - converting' }
PerMilleTest >> testAsNumber [

	self
		assert: 0 perMille asNumber equals: 0;
		assert: 1000 perMille asNumber equals: 1;
		assert: 500 perMille asNumber equals: 1 / 2
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testBetweenAnd [

	self
		assert: (1000 perMille between: 0 perMille and: 101);
		assert: (1000 perMille between: 1000 perMille and: 1001 perMille);
		assert: (1000 perMille between: 0 perMille and: 1000 perMille);
		deny: (1000 perMille between: 1001 and: 1002)
]

{ #category : #'tests - creation' }
PerMilleTest >> testCreationShortcut [

	self
		assert: 5 perMille printString equals: '5‰';
		assert: 50 perMille equals: 1 / 20;
		assert: 5.0 perMille printString equals: '5.0‰';
		assert: 50.0 perMille equals: 0.05;
		assert: 5.0s2 perMille printString equals: '5.00s2‰';
		assert: 50.0s2 perMille equals: 0.05s2;
		assert: (1 / 2) perMille printString equals: '(1/2)‰';
		assert: (1 / 2) perMille equals: 1 / 2000
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testDivisionWithFloats [

	self
		assert: 0 perMille / 100.0 equals: 0.0;
		runOnlyInPharo: [
			self should: [ 100.0 / 0 perMille ] raise: ZeroDivide ];
		runOnlyInGemStone64: [
			self assert: (100.0 / 0 perMille) isInfinite ];
		assert: 1000 perMille / 5.0 equals: 0.2;
		assert: 5.0 / 1000 perMille equals: 5.0;
		assert: (PerMille of: 500) / 5.0 equals: 0.1;
		assert: 5.0 / (PerMille of: 500) equals: 10.0
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testDivisionWithFractions [

	self
		assert: 0 perMille  / (1 / 2) equals: 0;
		should: [ (1 / 2) / 0 perMille ] raise: ZeroDivide;
		assert: 1000 perMille / (3 / 4) equals: 4 / 3;
		assert: (3 / 4) / 1000 perMille equals: 3 / 4;
		assert: 500 perMille / (3 / 4) equals: 2 / 3;
		assert: (3 / 4) / 500 perMille equals: 3 / 2
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testDivisionWithIntegers [

	self
		assert: 0 perMille / 100 equals: 0;
		should: [ 100 / 0 perMille ] raise: ZeroDivide;
		assert: 1000 perMille / 5 equals: 1 / 5;
		assert: 5 / 1000 perMille equals: 5;
		assert: 500 perMille / 5 equals: 1 / 10;
		assert: 5 / 500 perMille equals: 10
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testDivisionWithScaledDecimals [

	self
		assert: 0 perMille / 100.0s2 equals: 0.0s2;
		should: [ 100.0s2 / 0 perMille ] raise: ZeroDivide;
		assert: 1000 perMille / 5.0s2 equals: 0.2s2;
		assert: 5.0s2 / 1000 perMille equals: 5.0s2;
		assert: 500 perMille / 5.0s2 equals: 0.1s2;
		assert: 5.0s2 / 500 perMille equals: 10.0s2
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testEquals [

	self
		assert: 0 perMille equals: 0 perMille;
		assert: 1000 perMille equals: (PerMille ratio: 1)
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testEqualsWithFloats [

	self
		assert: 0.0 perMille equals: 0.0;
		assert: 0.0 equals: 0.0 perMille;
		assert: (PerMille ratio: 1.0) equals: 1.0;
		assert: 1.0 equals: (PerMille ratio: 1.0)
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testEqualsWithFractions [

	self
		assert: (PerMille ratio: 3/2) equals: 3/2;
		assert: 3/2 equals: (PerMille ratio: 3/2)
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testEqualsWithIntegers [

	self
		assert: 0 perMille  equals: 0;
		assert: 0 equals: 0 perMille;
		assert: 1000 perMille  equals: 1;
		assert: 1 equals: 1000 perMille
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testEqualsWithScaledDecimals [

	self
		assert: (PerMille ratio: 0.0s2) equals: 0.0s2;
		assert: 0.0s2 equals: (PerMille ratio: 0.0s2);
		assert: (PerMille ratio: 1.0s2) equals: 1.0s2;
		assert: 1.0s2 equals: (PerMille ratio: 1.0s2);
		assert: 4.32s2 equals: (PerMille ratio: 4.32s2)
]

{ #category : #'tests - testing' }
PerMilleTest >> testEven [

	self
		assert: 0 perMille even;
		deny: 1000 perMille even;
		deny: (PerMille of: 14) even
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testGreaterThan [

	self
		assert: 1000 perMille > 0 perMille;
		assert: 1 > 0 perMille;
		deny: 0 perMille > 0 perMille;
		assert: 0 perMille > -1
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testGreaterThanEquals [

	self
		assert: 1000 perMille >= 0 perMille;
		assert: 1 >= 0 perMille;
		assert: 0 perMille >= 0 perMille;
		assert: 0 >= 0 perMille;
		assert: 0 perMille >= -1
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testHash [

	self
		assert: 0 perMille hash equals: 0 perMille  hash;
		assert: 1000 perMille hash equals: (PerMille  ratio: 1) hash;
		assert: (PerMille ratio: 0.0s2) hash equals: 0.0s2 hash;
		assert: 0 perMille hash equals: 0 hash;
		assert: (PerMille ratio: 3 / 2) hash equals: (3 / 2) hash;
		assert: 1.123 hash equals: (PerMille ratio: 1.123) hash
]

{ #category : #'tests - testing' }
PerMilleTest >> testIsAbstract [

	self
		deny: PerMille isAbstract;
		assert: PerMille superclass isAbstract
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testLessThan [

	self
		assert: 0 perMille < 1000 perMille;
		assert: 0 perMille < 1;
		deny: 0 perMille < 0 perMille;
		assert: -1 < 0 perMille
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testLessThanEquals [

	self
		assert: 0 perMille <= 1000 perMille;
		assert: 0 perMille <= 1;
		assert: 0 perMille <= 0 perMille;
		assert: -1 <= 0 perMille
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testMax [

	self assert: (1000 perMille max: 0 perMille) equals: 1000 perMille
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testMin [

	self assert: (1000 perMille min: 0 perMille) equals: 0 perMille
]

{ #category : #'tests - testing' }
PerMilleTest >> testNegative [

	self
		deny: 0 perMille   negative;
		deny: 1 perMille negative;
		assert: (PerMille of: -114) negative
]

{ #category : #'tests - magnitude-API' }
PerMilleTest >> testNotEquals [

	self
		assert: 0 perMille ~= 1 perMille;
		assert: 1 perMille ~= 0 perMille;
		assert: 0 perMille ~= 1
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testNthRoot [

	self
		assert: ( 0 perMille nthRoot: 2 ) equals: 0;
		assert: ( 1000 perMille nthRoot: 2 ) equals: 1;
		assert: ( 4000 perMille nthRoot: 2 ) equals: 2;
		assert: ( 0 perMille nthRoot: 4 ) equals: 0;
		assert: ( 1000 perMille nthRoot: 4 ) equals: 1;
		assert: ( 16000 perMille nthRoot: 4 ) equals: 2
]

{ #category : #'tests - testing' }
PerMilleTest >> testOdd [

	self
		deny: 0 perMille odd;
		assert: 1000 perMille odd;
		assert: (PerMille of: 14) odd
]

{ #category : #'tests - testing' }
PerMilleTest >> testPositive [

	self
		assert: 0 perMille positive;
		assert: 1000 perMille positive;
		deny: (PerMille of: -114) positive
]

{ #category : #'tests - printing' }
PerMilleTest >> testPrintOn [

	self
		assert: 0 perMille printString equals: '0‰';
		assert: 1000 perMille printString equals: '1000‰';
		assert: (PerMille of: 15) printString equals: '15‰';
		assert: (PerMille ratio: 3 / 2) printString equals: '1500‰'
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testProduct [

	self
		assert: 0 perMille * 100 equals: 0;
		assert: 100 * 0 perMille equals: 0;
		assert: 1000 perMille * 5 equals: 5;
		assert: 5 * 1000 perMille equals: 5;
		assert: (PerMille of: 500) * 5 equals: 5 / 2;
		assert: 5 * (PerMille of: 500) equals: 5 / 2
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testProductWithFloats [

	self
		assert: 0 perMille * 100.0 equals: 0.0;
		assert: 100.0 * 0 perMille equals: 0.0;
		assert: 1000 perMille * 5.0 equals: 5.0;
		assert: 5.0 * 1000 perMille equals: 5.0;
		assert: (PerMille of: 500.0) * 5.0 equals: 2.5;
		assert: 5.0 * (PerMille of: 500.0) equals: 2.5
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testProductWithFractions [

	self
		assert: 0 perMille * (1 / 2) equals: 0;
		assert: 1 / 2 * 0 perMille equals: 0;
		assert: 1000 perMille * (3 / 4) equals: 3 / 4;
		assert: 3 / 4 * 1000 perMille equals: 3 / 4;
		assert: (PerMille of: 500) * (3 / 4) equals: 3 / 8;
		assert: 3 / 4 * (PerMille of: 500) equals: 3 / 8
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testProductWithScaledDecimals [

	self
		assert: 0 perMille * 100.0s2 equals: 0.0s2;
		assert: 100.0s2 * 0 perMille equals: 0.0s2;
		assert: 1000 perMille * 5.0s2 equals: 5.0s2;
		assert: 5.0s2 * 1000 perMille equals: 5.0s2;
		assert: (PerMille of: 500.0s2) * 5.0s2 equals: 2.5s2;
		assert: 5.0s2 * (PerMille of: 500.0s2) equals: 2.5s2
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testReciprocal [

	self
		should: [ 0 perMille reciprocal ] raise: ZeroDivide;
		assert: 1000 perMille reciprocal equals: 1000 perMille;
		assert: 1000 perMille reciprocal printString equals: '1000‰';
		assert: (PerMille of: 500) reciprocal equals: (PerMille of: 2000);
		assert: (PerMille of: 500) reciprocal printString equals: '2000‰'
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testRound [

	self assert: ( ( PerMille ratio: 6 / 90 ) round: 2 ) equals: 7 / 100
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testSqrt [

	self
		assert: 0 perMille sqrt equals: 0;
		assert: 1000 perMille sqrt equals: 1;
		assert: 4000 perMille sqrt equals: 2
]

{ #category : #'tests - printing' }
PerMilleTest >> testStoreOn [

	self
		assert: 0 perMille storeString equals: '0 perMille';
		assert: 1000 perMille storeString equals: '1000 perMille';
		assert: (PerMille of: 12) storeString equals: '12 perMille'
]

{ #category : #'tests - testing' }
PerMilleTest >> testStrictlyPositive [

	self
		deny: 0 perMille strictlyPositive;
		assert: 1000 perMille strictlyPositive;
		deny: (PerMille of: -114) strictlyPositive
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testSubtraction [

	self
		assert: 0 perMille - 1000 perMille equals: -1000 perMille;
		assert: (0 perMille - 1000 perMille) printString equals: '-1000‰';
		assert: 1000 perMille - (PerMille of: 5) equals: 995 perMille;
		assert: (1000 perMille - (PerMille of: 5)) printString equals: '995‰'
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testSubtractionWithFloats [

	self
		assert: 0 perMille - 100.0 equals: -100.0;
		assert: 100.0 - 0 perMille equals: 100.0;
		assert: 1000 perMille - 5.0 equals: -4.0;
		assert: 5.0 - 1000 perMille equals: 4.0;
		assert: (PerMille of: 500) - 5.0 equals: -4.5;
		assert: 5.0 - (PerMille of: 500) equals: 4.5
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testSubtractionWithFractions [

	self
		assert: 0 perMille - (1 / 2) equals: -1 / 2;
		assert: (1 / 2) - 0 perMille equals: 1 / 2;
		assert: 1000 perMille - (1 / 2) equals: 1 / 2;
		assert: (1 / 2) - 1000 perMille equals: -1 / 2;
		assert: (PerMille of: 500) - (1 / 2) equals: 0;
		assert: (1 / 2) - (PerMille of: 500) equals: 0
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testSubtractionWithScaledDecimals [

	self
		assert: 0 perMille - 100.0s2 equals: -100.0s2;
		assert: 100.0s2 - 0 perMille equals: 100.0s2;
		assert: 1000 perMille - 5.0s2 equals: -4.0s2;
		assert: 5.0s2 - 1000 perMille equals: 4.0s2;
		assert: (PerMille of: 500) - 5.0s2 equals: -4.5s2;
		assert: 5.0s2 - (PerMille of: 500) equals: 4.5s2
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testSum [

	self
		assert: 0 perMille + 1000 perMille equals: 1000 perMille;
		assert: (0 perMille + 1000 perMille) printString equals: '1000‰';
		assert: 1000 perMille + (PerMille of: 50) equals: (PerMille of: 1050);
		assert: (1000 perMille + (PerMille of: 50)) printString equals: '1050‰'
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testSumWithFloats [

	self
		assert: 0 perMille + 100.0 equals: 100.0;
		assert: 100.0 + 0 perMille equals: 100.0;
		assert: 1000 perMille + 5.0 equals: 6.0;
		assert: 5.0 + 1000 perMille equals: 6.0;
		assert: (PerMille of: 500) + 5.0 equals: 5.5;
		assert: 5.0 + (PerMille of: 500) equals: 5.5
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testSumWithFractions [

	self
		assert: 0 perMille + (1 / 2) equals: 1 / 2;
		assert: 1 / 2 + 0 perMille equals: 1 / 2;
		assert: 1000 perMille + (1 / 2) equals: 3 / 2;
		assert: 1 / 2 + 1000 perMille equals: 3 / 2;
		assert: (PerMille of: 500) + (1 / 2) equals: 1;
		assert: 1 / 2 + (PerMille of: 500) equals: 1
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testSumWithIntegers [

	self
		assert: 0 perMille + 100 equals: 100;
		assert: 100 + 0 perMille equals: 100;
		assert: 1000 perMille + 5 equals: 6;
		assert: 5 + 1000 perMille equals: 6;
		assert: (PerMille of: 500) + 5 equals: 11 / 2;
		assert: 5 + (PerMille of: 500) equals: 11 / 2
]

{ #category : #'tests - arithmetic-API' }
PerMilleTest >> testSumWithScaledDecimals [

	self
		assert: 0 perMille + 100.0s2 equals: 100.0s2;
		assert: 100.0s2 + 0 perMille equals: 100.0s2;
		assert: 1000 perMille + 5.0s2 equals: 6.0s2;
		assert: 5.0s2 + 1000 perMille equals: 6.0s2;
		assert: (PerMille of: 500) + 5.0s2 equals: 5.5s2;
		assert: 5.0s2 + (PerMille of: 500) equals: 5.5s2
]
