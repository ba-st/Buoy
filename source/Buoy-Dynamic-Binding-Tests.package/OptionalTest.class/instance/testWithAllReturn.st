tests-Combining
testWithAllReturn

	| firstOptional secondOptional thirdOptional combinedOptional |

	firstOptional := Optional containing: 0.
	secondOptional := Optional containing: 2.
	thirdOptional := Optional containing: 3.

	combinedOptional := firstOptional
		withAll:
			{secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	combinedOptional withContentDo: [ :sum | self assert: sum equals: 5 ] ifUnused: [ self fail ].

	combinedOptional := Optional
		withAll:
			{firstOptional.
			secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	combinedOptional withContentDo: [ :sum | self assert: sum equals: 5 ] ifUnused: [ self fail ]