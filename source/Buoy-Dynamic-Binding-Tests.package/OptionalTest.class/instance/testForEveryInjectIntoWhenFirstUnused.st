tests-Combining
testForEveryInjectIntoWhenFirstUnused

	| firstOptional secondOptional thirdOptional combinedOptional |

	firstOptional := Optional unused.
	secondOptional := Optional containing: 1.
	thirdOptional := Optional containing: 3.

	combinedOptional := Optional
		forEvery:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :min :current | min min: current ].

	self assert: (combinedOptional withContentDo: [ :min | self fail ] ifUnused: [ 0 ]) isZero