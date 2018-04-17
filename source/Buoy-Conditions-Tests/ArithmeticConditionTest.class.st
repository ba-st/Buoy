"
An ArithmeticConditionTest is a test class for testing the behavior of ArithmeticCondition
"
Class {
	#name : #ArithmeticConditionTest,
	#superclass : #TestCase,
	#category : 'Buoy-Conditions-Tests'
}

{ #category : #tests }
ArithmeticConditionTest >> testSatisfyingDifferent [

	| condition |

	condition := ArithmeticCondition toBeDifferentTo: 1.

	self
		deny: (condition isSatisfiedBy: 1);
		assert: (condition isSatisfiedBy: 0);
		assert: (condition isSatisfiedBy: 2)
]

{ #category : #tests }
ArithmeticConditionTest >> testSatisfyingEquality [

	| condition |

	condition := ArithmeticCondition toBeEqualTo: 1.

	self
		assert: (condition isSatisfiedBy: 1);
		deny: (condition isSatisfiedBy: 0);
		deny: (condition isSatisfiedBy: 2)
]

{ #category : #tests }
ArithmeticConditionTest >> testSatisfyingGreaterOrEqualThan [

	| condition |

	condition := ArithmeticCondition toBeGreaterOrEqualThan: 5.

	self
		deny: (condition isSatisfiedBy: 1);
		deny: (condition isSatisfiedBy: 4);
		assert: (condition isSatisfiedBy: 5);
		assert: (condition isSatisfiedBy: 6)
]

{ #category : #tests }
ArithmeticConditionTest >> testSatisfyingGreaterThan [

	| condition |

	condition := ArithmeticCondition toBeGreaterThan: 5.

	self
		deny: (condition isSatisfiedBy: 1);
		deny: (condition isSatisfiedBy: 4);
		deny: (condition isSatisfiedBy: 5);
		assert: (condition isSatisfiedBy: 6)
]

{ #category : #tests }
ArithmeticConditionTest >> testSatisfyingLessOrEqualThan [

	| condition |

	condition := ArithmeticCondition toBeLessOrEqualThan: 5.

	self
		assert: (condition isSatisfiedBy: 1);
		assert: (condition isSatisfiedBy: 4);
		assert: (condition isSatisfiedBy: 5);
		deny: (condition isSatisfiedBy: 6)
]

{ #category : #tests }
ArithmeticConditionTest >> testSatisfyingLessThan [

	| condition |

	condition := ArithmeticCondition toBeLessThan: 5.

	self
		assert: (condition isSatisfiedBy: 1);
		assert: (condition isSatisfiedBy: 4);
		deny: (condition isSatisfiedBy: 5);
		deny: (condition isSatisfiedBy: 6)
]
