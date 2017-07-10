tests
testAndCompositionShortcut

	| betweenZeroAndTwo |

	betweenZeroAndTwo := (ArithmeticCondition toBeGreaterThan: 0) and: (ArithmeticCondition toBeLessThan: 2).
	self
		assert: (betweenZeroAndTwo isA: CompositeCondition);
		deny: (betweenZeroAndTwo isSatisfiedBy: 0);
		assert: (betweenZeroAndTwo isSatisfiedBy: 1);
		deny: (betweenZeroAndTwo isSatisfiedBy: 2)