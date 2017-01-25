tests
testSeveralConditionsButOnlyOneFailed

	| mathFailureExplanation |

	mathFailureExplanation := 'An obvious math error'.
	checker
		checking: [ :asserter | 
			asserter
				affirm: [ 4 > 3 ] because: [ self fail ];
				affirm: [ 1 > 2 ] because: mathFailureExplanation;
				affirm: [ #() isEmpty ] because: [ self fail ] ].
	self
		should: [ checker check ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: mathFailureExplanation;
				assert: exception failures size equals: 1 ]