tests
testSatisfyingLessOrEqualThan

	| condition |

	condition := ArithmeticCondition toBeLessOrEqualThan: 5.

	self
		assert: (condition isSatisfiedBy: 1);
		assert: (condition isSatisfiedBy: 4);
		assert: (condition isSatisfiedBy: 5);
		deny: (condition isSatisfiedBy: 6)