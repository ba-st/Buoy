tests-Combining
testWithWhenBothUsedReturnWhenSecondIsUnused

	| firstOptional secondOptional combinedOptional |

	firstOptional := Optional containing: 2.
	secondOptional := Optional unused.

	combinedOptional := firstOptional with: secondOptional whenBothUsedReturn: [ :x :y | self fail ].

	self assert: (combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ 0 ]) isZero