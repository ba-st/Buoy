tests-Combining
testWithReturnWhenFirstIsUnused

	| firstOptional secondOptional combinedOptional |

	firstOptional := Optional unused.
	secondOptional := Optional containing: 2.

	combinedOptional := firstOptional with: secondOptional return: [ :x :y | self fail ].

	self assert: (combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ 0 ]) isZero