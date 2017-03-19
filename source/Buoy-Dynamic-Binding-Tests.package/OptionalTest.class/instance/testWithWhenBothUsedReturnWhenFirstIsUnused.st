tests-Combining
testWithWhenBothUsedReturnWhenFirstIsUnused

	| firstOptional secondOptional combinedOptional |

	firstOptional := Optional unused.
	secondOptional := Optional containing: 2.

	combinedOptional := firstOptional with: secondOptional whenBothUsedReturn: [ :x :y | self fail ].

	self assert: (combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ 0 ]) isZero