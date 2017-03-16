tests-Combining
testWithAllReturnWhenEmpty

	| combinedOptional |

	combinedOptional := Optional withAll: #() return: [ :addends | addends sum ].

	combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ :explanations | self assert: explanations isEmpty ]