tests-Printing
testPrintingUnusedOptional

	self assert: (Optional unusedBecause: 'This feature is disabled.') printString equals: 'This feature is disabled.'