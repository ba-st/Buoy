tests-Combining
testWithWhenAnyUsedReturn

	| firstOptional secondOptional combinedOptional result |

	firstOptional := Optional containing: 1.
	secondOptional := Optional containing: 2.

	combinedOptional := firstOptional
		with: secondOptional
		whenAnyUsedReturn: [ :x :y | x + y ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 3