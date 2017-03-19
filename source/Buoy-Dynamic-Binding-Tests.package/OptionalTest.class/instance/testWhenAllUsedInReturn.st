tests-Combining
testWhenAllUsedInReturn

	| firstOptional secondOptional thirdOptional combinedOptional result |

	firstOptional := Optional containing: 0.
	secondOptional := Optional containing: 2.
	thirdOptional := Optional containing: 3.

	combinedOptional := firstOptional
		whenAllUsedIn:
			{secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 5.

	combinedOptional := Optional
		whenAllUsedIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 5