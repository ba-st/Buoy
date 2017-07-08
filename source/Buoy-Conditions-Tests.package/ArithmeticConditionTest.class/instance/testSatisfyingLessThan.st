tests
testSatisfyingLessThan

	| condition |

	condition := ArithmeticCondition toBeLessThan: 5.

	self
		assert: (condition isSatisfiedBy: 1);
		assert: (condition isSatisfiedBy: 4);
		deny: (condition isSatisfiedBy: 5);
		deny: (condition isSatisfiedBy: 6)