tests
testSatisfyingTwoConditions

	| condition |

	condition := CompositeCondition satisfying: (ArithmeticCondition toBeGreaterThan: 10) and: (ArithmeticCondition toBeLessThan: 11).

	self
		assert: (condition isSatisfiedBy: 10.5);
		deny: (condition isSatisfiedBy: 10);
		deny: (condition isSatisfiedBy: 11)