tests-Combining
testWithUsedOnlyInReturnWhenSomeAreUnused

	| firstOptional secondOptional thirdOptional combinedOptional result |

	firstOptional := Optional containing: 1.
	secondOptional := Optional unused.
	thirdOptional := Optional containing: 3.

	combinedOptional := firstOptional
		withUsedOnlyIn:
			{secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	result := 0.
	combinedOptional
		withContentDo: [ :sum | result := sum ]
		ifUnused: [ :explanations | self fail ].
	self assert: result equals: 4.

	combinedOptional := Optional
		withUsedOnlyIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	result := 0.
	combinedOptional
		withContentDo: [ :sum | result := sum ]
		ifUnused: [ :explanations | self fail ].
	self assert: result equals: 4