tests-Combining
testWithWhenBothUsedReturnWhenBothAreUnused

	| firstOptional secondOptional combinedOptional |

	firstOptional := Optional unused.
	secondOptional := Optional unused.

	combinedOptional := firstOptional with: secondOptional whenBothUsedReturn: [ :x :y | self fail ].

	self
		assert:
			(combinedOptional
				withContentDo: [ :sum | self fail ]
				ifUnused: [ :explanations | 
					self assert: explanations isEmpty.
					0 ]) isZero