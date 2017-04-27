tests-arithmetic-API
testReciprocal

	self
		should: [ 0 perMille reciprocal ] raise: ZeroDivide;
		assert: 1000 perMille reciprocal equals: 1000 perMille;
		assert: 1000 perMille reciprocal printString equals: '1000‰';
		assert: (PerMille of: 500) reciprocal equals: (PerMille of: 2000);
		assert: (PerMille of: 500) reciprocal printString equals: '2000‰'