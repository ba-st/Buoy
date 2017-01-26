tests
testSeveralConditionsButOnlyOneFailed

	| mathFailureExplanation |

	mathFailureExplanation := 'An obvious math error'.
	checkerBuilder
		checking: [ :asserter | 
			asserter
				affirm: [ 4 > 3 ] because: [ self fail ];
				affirm: [ 1 > 2 ] because: mathFailureExplanation;
				affirm: [ #() isEmpty ] because: [ self fail ] ].
	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: mathFailureExplanation;
				assertCollection: exception failures hasSameElements: {mathFailureExplanation} ]