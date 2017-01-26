tests
testFailFastPassingSomeConditions

	| failureExplanation |

	failureExplanation := 'An obvious math error'.
	checkerBuilder
		failFast;
		checking: [ :asserter | 
			asserter
				affirm: [ true ] because: [ self fail ];
				affirm: [ false ] because: failureExplanation;
				affirm: [ self fail ] because: [ self fail ] ].

	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: failureExplanation;
				assertCollection: exception failures hasSameElements: {failureExplanation} ]