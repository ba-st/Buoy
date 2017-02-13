tests-testing
testEven

	self
		assert: 0 perMille even;
		deny: 1000 perMille even;
		deny: (PerMille of: 14) even