tests
testIsSatisfied

	| condition |

	condition := NegatedCondition with: (ArithmeticCondition toBeEqualTo: 10).

	self
		assert: (condition isSatisfiedBy: 8);
		deny: (condition isSatisfiedBy: 10)