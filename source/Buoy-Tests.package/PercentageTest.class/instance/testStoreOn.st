tests-printing
testStoreOn

	self
		assert: Percentage zero storeString equals: 'Percentage zero';
		assert: Percentage oneHundred storeString equals: 'Percentage oneHundred';
		assert: (Percentage of: 12) storeString equals: 'Percentage of: 12'