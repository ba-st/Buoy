tests-testing
testStrictlyPositive

	self
		deny: 0 perMille strictlyPositive;
		assert: 1000 perMille strictlyPositive;
		deny: (PerMille of: -114) strictlyPositive