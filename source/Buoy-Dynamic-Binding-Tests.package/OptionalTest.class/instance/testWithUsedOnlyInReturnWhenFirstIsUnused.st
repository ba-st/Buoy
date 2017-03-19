tests-Combining
testWithUsedOnlyInReturnWhenFirstIsUnused

	| firstOptional secondOptional thirdOptional combinedOptional result |

	firstOptional := Optional unusedBecause: 'This is expected.'.
	secondOptional := Optional unusedBecause: 'This is also expected.'.
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
	self assert: result equals: 3.

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
	self assert: result equals: 3