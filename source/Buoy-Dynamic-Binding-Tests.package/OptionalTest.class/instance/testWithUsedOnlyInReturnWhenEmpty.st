tests-Combining
testWithUsedOnlyInReturnWhenEmpty

	| combinedOptional explanations |

	combinedOptional := Optional withUsedOnlyIn: #() return: [ :addends | addends sum ].

	explanations := 'something'.
	combinedOptional
		withContentDo: [ :sum | self fail ]
		ifUnused: [ :optionalExplanations | explanations := optionalExplanations ].
	self assert: explanations isEmpty