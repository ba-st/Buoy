tests
testSatisfyingManyConditions

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