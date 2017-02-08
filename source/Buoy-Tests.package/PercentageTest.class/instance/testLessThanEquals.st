tests-magnitude-API
testLessThanEquals

	self
		assert: Percentage zero <= Percentage oneHundred;
		assert: Percentage zero <= 1;
		assert: Percentage zero <= Percentage zero;
		assert: -1 <= Percentage zero