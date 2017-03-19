tests-Combining
testWithUsedOnlyInInjectInto

	| firstOptional secondOptional thirdOptional combinedOptional result |

	firstOptional := Optional containing: 1.
	secondOptional := Optional containing: 2.
	thirdOptional := Optional containing: 3.

	combinedOptional := Optional
		withUsedOnlyIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :sum :current | sum + current ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 6.

	combinedOptional := Optional
		withUsedOnlyIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :sum :current | sum + current ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 6