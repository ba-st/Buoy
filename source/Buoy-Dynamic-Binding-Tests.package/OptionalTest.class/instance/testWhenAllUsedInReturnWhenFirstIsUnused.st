tests-Combining
testWhenAllUsedInReturnWhenFirstIsUnused

	| firstOptional secondOptional thirdOptional combinedOptional |

	firstOptional := Optional unusedBecause: 'This is expected.'.
	secondOptional := Optional unusedBecause: 'This is also expected.'.
	thirdOptional := Optional containing: 3.

	combinedOptional := firstOptional
		whenAllUsedIn:
			{secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ :explanations | self assert: explanations equals: #('This is expected.' 'This is also expected.') ].

	combinedOptional := Optional
		whenAllUsedIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].
		
	combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ :explanations | self assert: explanations equals: #('This is expected.' 'This is also expected.') ]