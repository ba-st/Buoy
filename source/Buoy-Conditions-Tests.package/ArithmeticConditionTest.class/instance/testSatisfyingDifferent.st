tests
testSatisfyingDifferent

	| condition |

	condition := ArithmeticCondition toBeDifferentTo: 1.

	self
		deny: (condition isSatisfiedBy: 1);
		assert: (condition isSatisfiedBy: 0);
		assert: (condition isSatisfiedBy: 2)