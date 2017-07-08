tests
testSatisfyingGreaterThan

	| condition |

	condition := ArithmeticCondition toBeGreaterThan: 5.

	self
		deny: (condition isSatisfiedBy: 1);
		deny: (condition isSatisfiedBy: 4);
		deny: (condition isSatisfiedBy: 5);
		assert: (condition isSatisfiedBy: 6)