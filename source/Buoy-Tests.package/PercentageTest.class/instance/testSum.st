tests-arithmetic-API
testSum

	self
		assert: Percentage zero + Percentage oneHundred equals: Percentage oneHundred;
		assert: (Percentage zero + Percentage oneHundred) printString equals: '100%';
		assert: Percentage oneHundred + (Percentage of: 5) equals: (Percentage of: 105);
		assert: (Percentage oneHundred + (Percentage of: 5)) printString equals: '105%'