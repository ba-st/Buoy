test-creation
testCreationShortcut

	self
		assert: 5 perMille printString equals: '5‰';
		assert: 50 perMille equals: 1 / 20;
		assert: 5.0 perMille printString equals: '5.0‰';
		assert: 50.0 perMille equals: 0.05;
		assert: 5.0s2 perMille printString equals: '5.00s2‰';
		assert: 50.0s2 perMille equals: 0.05s2;
		assert: (1 / 2) perMille printString equals: '(1/2)‰';
		assert: (1 / 2) perMille equals: 1 / 2000