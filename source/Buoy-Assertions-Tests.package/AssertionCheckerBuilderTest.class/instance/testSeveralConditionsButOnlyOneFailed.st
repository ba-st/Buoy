tests
testSeveralConditionsButOnlyOneFailed

	| mathFailureExplanation |

	mathFailureExplanation := 'An obvious math error'.
	checkerBuilder
		checking: [ :asserter | 
			asserter
				enforce: [ 4 > 3 ] because: [ self fail ];
				enforce: [ 1 > 2 ] because: mathFailureExplanation;
				refuse: [ #() notEmpty ] because: [ self fail ] ].
	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: mathFailureExplanation;
				assertCollection: exception failures hasSameElements: {mathFailureExplanation} ]