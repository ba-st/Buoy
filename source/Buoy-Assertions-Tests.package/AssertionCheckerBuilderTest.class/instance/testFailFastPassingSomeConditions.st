tests
testFailFastPassingSomeConditions

	| failureExplanation |

	failureExplanation := 'An obvious math error'.
	checkerBuilder
		failFast;
		checking: [ :asserter | 
			asserter
				enforce: [ true ] because: [ self fail ];
				enforce: [ false ] because: failureExplanation;
				enforce: [ self fail ] because: [ self fail ] ].

	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: failureExplanation;
				assertCollection: exception failures hasSameElements: {failureExplanation} ]