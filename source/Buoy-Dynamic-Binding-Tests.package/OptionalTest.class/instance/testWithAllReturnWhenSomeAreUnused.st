tests-Combining
testWithAllReturnWhenSomeAreUnused

	| firstOptional secondOptional thirdOptional combinedOptional |

	firstOptional := Optional containing: 0.
	secondOptional := Optional unused.
	thirdOptional := Optional containing: 3.

	combinedOptional := firstOptional
		withAll:
			{secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ :explanations | self assert: explanations isEmpty ].

	combinedOptional := Optional
		withAll:
			{firstOptional.
			secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ :explanations | self assert: explanations isEmpty ]