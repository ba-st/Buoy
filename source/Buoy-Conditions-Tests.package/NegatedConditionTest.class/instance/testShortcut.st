tests
testShortcut

	| condition |

	condition := (ArithmeticCondition toBeEqualTo: 10) negated.

	self
		assert: (condition isSatisfiedBy: 8);
		deny: (condition isSatisfiedBy: 10)