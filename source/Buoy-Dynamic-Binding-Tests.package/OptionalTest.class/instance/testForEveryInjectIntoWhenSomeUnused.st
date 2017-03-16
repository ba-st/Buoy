tests-Combining
testForEveryInjectIntoWhenSomeUnused

	| firstOptional secondOptional thirdOptional combinedOptional |

	firstOptional := Optional containing: 1.
	secondOptional := Optional unused.
	thirdOptional := Optional containing: 3.

	combinedOptional := Optional
		forEvery:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :min :current | min min: current ].

	self assert: (combinedOptional withContentDo: [ :min | self fail ] ifUnused: [ 0 ]) isZero