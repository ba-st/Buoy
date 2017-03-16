tests-Combining
testWithReturn

	| firstOptional secondOptional combinedOptional |

	firstOptional := Optional containing: 1.
	secondOptional := Optional containing: 2.

	combinedOptional := firstOptional with: secondOptional return: [ :x :y | x + y ].

	combinedOptional withContentDo: [ :sum | self assert: sum equals: 3 ] ifUnused: [ self fail ]