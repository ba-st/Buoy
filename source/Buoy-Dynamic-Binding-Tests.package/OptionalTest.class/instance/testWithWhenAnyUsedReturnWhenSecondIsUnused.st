tests-Combining
testWithWhenAnyUsedReturnWhenSecondIsUnused

	| firstOptional secondOptional combinedOptional result |

	firstOptional := Optional containing: 2.
	secondOptional := Optional unused.

	combinedOptional := firstOptional
		with: secondOptional
		whenAnyUsedReturn: [ :x :y | x + y ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 2