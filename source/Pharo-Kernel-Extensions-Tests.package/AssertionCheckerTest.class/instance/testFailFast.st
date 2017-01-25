tests
testFailFast

	| mathFailureExplanation |

	mathFailureExplanation := 'An obvious math error'.
	checker
		failFast;
		checking: [ :asserter | 
			asserter
				affirm: [ 2 > 3 ] because: mathFailureExplanation;
				affirm: [ self fail ] because: [ self fail ];
				affirm: [ self fail ] because: [ self fail ] ].

	self
		should: [ checker check ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: mathFailureExplanation;
				assert: exception failures size equals: 1 ]