tests
testFailFastInConditional

	| mathFailureExplanation |

	mathFailureExplanation := 'An obvious math error'.
	checker
		failFast;
		checking: [ :asserter | 
			asserter
				affirm: [ true ] because: [ self fail ] onSuccess: [ :successAsserter | successAsserter affirm: [ false ] because: mathFailureExplanation ];
				affirm: [ self fail ] because: [ self fail ];
				affirm: [ self fail ] because: [ self fail ] ].

	self
		should: [ checker check ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: mathFailureExplanation;
				assert: exception failures size equals: 1 ]