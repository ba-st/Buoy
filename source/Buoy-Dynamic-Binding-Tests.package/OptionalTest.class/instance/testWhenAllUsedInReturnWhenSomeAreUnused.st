tests-Combining
testWhenAllUsedInReturnWhenSomeAreUnused

	| firstOptional secondOptional thirdOptional combinedOptional |

	firstOptional := Optional containing: 0.
	secondOptional := Optional unused.
	thirdOptional := Optional containing: 3.

	combinedOptional := firstOptional
		whenAllUsedIn:
			{secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ :explanations | self assert: explanations isEmpty ].

	combinedOptional := Optional
		whenAllUsedIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ :explanations | self assert: explanations isEmpty ]