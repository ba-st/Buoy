tests-Combining
testWhenAllUsedInReturnWhenEmpty

	| combinedOptional |

	combinedOptional := Optional whenAllUsedIn: #() return: [ :addends | addends sum ].

	combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ :explanations | self assert: explanations isEmpty ]