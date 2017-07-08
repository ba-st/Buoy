tests
testSatisfyingEquality

	| condition |

	condition := ArithmeticCondition toBeEqualTo: 1.

	self
		assert: (condition isSatisfiedBy: 1);
		deny: (condition isSatisfiedBy: 0);
		deny: (condition isSatisfiedBy: 2)