tests
testFailFastInConditional

	| mathFailureExplanation |

	mathFailureExplanation := 'An obvious math error'.
	checkerBuilder
		failFast;
		checking: [ :asserter | 
			asserter
				affirm: [ true ] because: [ self fail ] onSuccess: [ :successAsserter | successAsserter affirm: [ false ] because: mathFailureExplanation ];
				affirm: [ self fail ] because: [ self fail ];
				affirm: [ self fail ] because: [ self fail ] ].

	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: mathFailureExplanation;
				assertCollection: exception failures hasSameElements: {mathFailureExplanation} ]