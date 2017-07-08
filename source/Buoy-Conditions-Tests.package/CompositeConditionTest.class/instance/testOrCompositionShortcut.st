tests
testOrCompositionShortcut

	| oneOrTwo |

	oneOrTwo := (ArithmeticCondition toBeEqualTo: 1) or: (ArithmeticCondition toBeEqualTo: 2).
	self
		assert: (oneOrTwo isA: CompositeCondition);
		assert: (oneOrTwo isSatisfiedBy: 1);
		assert: (oneOrTwo isSatisfiedBy: 2);
		deny: (oneOrTwo isSatisfiedBy: 3)