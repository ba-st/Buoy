tests-Combining
testForEveryUsedOptionalInjectInto

	| firstOptional secondOptional thirdOptional combinedOptional |

	firstOptional := Optional containing: 1.
	secondOptional := Optional containing: 0.
	thirdOptional := Optional containing: 3.

	combinedOptional := Optional
		forEvery:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :min :current | min min: current ].

	combinedOptional withContentDo: [ :min | self assert: min equals: 0 ] ifUnused: [ self fail ].

	combinedOptional := Optional
		forEvery:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :sum :current | sum + current ].

	combinedOptional withContentDo: [ :sum | self assert: sum equals: 4 ] ifUnused: [ self fail ]