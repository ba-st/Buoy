tests-testing
testOdd

	self
		deny: 0 perMille odd;
		assert: 1000 perMille odd;
		assert: (PerMille of: 14) odd