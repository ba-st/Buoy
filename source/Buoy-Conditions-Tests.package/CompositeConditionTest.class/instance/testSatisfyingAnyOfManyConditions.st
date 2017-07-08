tests
testSatisfyingAnyOfManyConditions

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