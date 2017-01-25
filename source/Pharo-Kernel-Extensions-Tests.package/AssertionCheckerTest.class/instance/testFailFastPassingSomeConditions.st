tests
testFailFastPassingSomeConditions

	| failureExplanation |

	failureExplanation := 'An obvious math error'.
	checker
		failFast;
		checking: [ :asserter | 
			asserter
				affirm: [ true ] because: [ self fail ];
				affirm: [ false ] because: failureExplanation;
				affirm: [ self fail ] because: [ self fail ] ].

	self
		should: [ checker check ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: failureExplanation;
				assert: exception failures size equals: 1 ]