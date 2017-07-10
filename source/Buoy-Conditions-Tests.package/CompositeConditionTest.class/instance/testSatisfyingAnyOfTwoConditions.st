tests
testSatisfyingAnyOfTwoConditions

	| condition |

	condition := CompositeCondition satisfying: (ArithmeticCondition toBeEqualTo: 1) or: (ArithmeticCondition toBeEqualTo: 2).

	self
		assert: (condition isSatisfiedBy: 1);
		assert: (condition isSatisfiedBy: 2);
		deny: (condition isSatisfiedBy: 3);
		deny: (condition isSatisfiedBy: 1.5);
		deny: (condition isSatisfiedBy: 0)