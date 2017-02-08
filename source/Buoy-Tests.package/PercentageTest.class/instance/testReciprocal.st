tests-arithmetic-API
testReciprocal

	self
		should: [ Percentage zero reciprocal ] raise: ZeroDivide;
		assert: Percentage oneHundred reciprocal equals: Percentage oneHundred;
		assert: Percentage oneHundred reciprocal printString equals: '100%';
		assert: (Percentage of: 50) reciprocal equals: (Percentage of: 200);
		assert: (Percentage of: 50) reciprocal printString equals: '200%'