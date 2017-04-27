tests-magnitude-API
testNotEquals

	self
		assert: Percentage zero ~= Percentage oneHundred;
		assert: Percentage oneHundred ~= Percentage zero;
		assert: Percentage zero ~= 1