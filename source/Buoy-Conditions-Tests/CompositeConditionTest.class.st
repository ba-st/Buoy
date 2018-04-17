Class {
	#name : #CompositeConditionTest,
	#superclass : #TestCase,
	#category : 'Buoy-Conditions-Tests'
}

{ #category : #tests }
CompositeConditionTest >> testAndCompositionShortcut [

	| betweenZeroAndTwo |

	betweenZeroAndTwo := (ArithmeticCondition toBeGreaterThan: 0) and: (ArithmeticCondition toBeLessThan: 2).
	self
		assert: (betweenZeroAndTwo isA: CompositeCondition);
		deny: (betweenZeroAndTwo isSatisfiedBy: 0);
		assert: (betweenZeroAndTwo isSatisfiedBy: 1);
		deny: (betweenZeroAndTwo isSatisfiedBy: 2)
]

{ #category : #tests }
CompositeConditionTest >> testOrCompositionShortcut [

	| oneOrTwo |

	oneOrTwo := (ArithmeticCondition toBeEqualTo: 1) or: (ArithmeticCondition toBeEqualTo: 2).
	self
		assert: (oneOrTwo isA: CompositeCondition);
		assert: (oneOrTwo isSatisfiedBy: 1);
		assert: (oneOrTwo isSatisfiedBy: 2);
		deny: (oneOrTwo isSatisfiedBy: 3)
]

{ #category : #tests }
CompositeConditionTest >> testSatisfyingAnyOfManyConditions [

	| condition |

	condition := CompositeCondition
		satisfyingAnyOf:
			{(ArithmeticCondition toBeEqualTo: 1).
			(ArithmeticCondition toBeEqualTo: 2).
			(ArithmeticCondition toBeEqualTo: 3)}.

	self
		assert: (condition isSatisfiedBy: 1);
		assert: (condition isSatisfiedBy: 2);
		assert: (condition isSatisfiedBy: 3);
		deny: (condition isSatisfiedBy: 4);
		deny: (condition isSatisfiedBy: 2.5);
		deny: (condition isSatisfiedBy: 9)
]

{ #category : #tests }
CompositeConditionTest >> testSatisfyingAnyOfTwoConditions [

	| condition |

	condition := CompositeCondition satisfying: (ArithmeticCondition toBeEqualTo: 1) or: (ArithmeticCondition toBeEqualTo: 2).

	self
		assert: (condition isSatisfiedBy: 1);
		assert: (condition isSatisfiedBy: 2);
		deny: (condition isSatisfiedBy: 3);
		deny: (condition isSatisfiedBy: 1.5);
		deny: (condition isSatisfiedBy: 0)
]

{ #category : #tests }
CompositeConditionTest >> testSatisfyingManyConditions [

	| condition |

	condition := CompositeCondition
		satisfyingAll:
			{(ArithmeticCondition toBeGreaterThan: 10).
			(ArithmeticCondition toBeLessThan: 11).
			(ArithmeticCondition toBeDifferentTo: 10.5)}.

	self
		assert: (condition isSatisfiedBy: 10.4);
		deny: (condition isSatisfiedBy: 10.5);
		deny: (condition isSatisfiedBy: 10);
		deny: (condition isSatisfiedBy: 11)
]

{ #category : #tests }
CompositeConditionTest >> testSatisfyingTwoConditions [

	| condition |

	condition := CompositeCondition satisfying: (ArithmeticCondition toBeGreaterThan: 10) and: (ArithmeticCondition toBeLessThan: 11).

	self
		assert: (condition isSatisfiedBy: 10.5);
		deny: (condition isSatisfiedBy: 10);
		deny: (condition isSatisfiedBy: 11)
]
