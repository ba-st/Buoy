tests
testSatisfyingGreaterOrEqualThan

	| condition |

	condition := ArithmeticCondition toBeGreaterOrEqualThan: 5.

	self
		deny: (condition isSatisfiedBy: 1);
		deny: (condition isSatisfiedBy: 4);
		assert: (condition isSatisfiedBy: 5);
		assert: (condition isSatisfiedBy: 6)