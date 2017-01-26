tests
testSingleConditionFailure

	| explanation |

	explanation := 'An obvious math error'.
	checkerBuilder checking: [ :asserter | asserter enforce: [ 1 > 2 ] because: explanation ].
	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: explanation;
				assertCollection: exception failures hasSameElements: {explanation} ]