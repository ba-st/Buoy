test-creation
testCreationShortcut

	self
		assert: 5 percent printString equals: '5%';
		assert: 5 percent equals: 1 / 20;
		assert: 5.0 percent printString equals: '5.0%';
		assert: 5.0 percent equals: 0.05;
		assert: 5.0s2 percent printString equals: '5.00s2%';
		assert: 5.0s2 percent equals: 0.05s2;
		assert: (1 / 2) percent printString equals: '(1/2)%';
		assert: (1 / 2) percent equals: 1 / 200