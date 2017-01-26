tests
testConditionalCheckingWhenFirstConditionFails

	| explanation rowCount |

	explanation := 'A row count must be positive'.
	rowCount := -15.

	checkerBuilder checking: [ :asserter | asserter affirm: [ rowCount positive ] because: explanation onSuccess: [ :successAsserter | self fail ] ].

	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: explanation;
				assertCollection: exception failures hasSameElements: {explanation} ]