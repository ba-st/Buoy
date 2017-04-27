tests
testConditionalChecking

	| explanation rowCount |

	explanation := 'A row count must be positive'.
	rowCount := -15.

	checkerBuilder
		checking: [ :asserter | asserter refuse: [ rowCount isNil ] because: [ self fail ] onSuccess: [ :successAsserter | successAsserter enforce: [ rowCount positive ] because: [ explanation ] ] ].

	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: explanation;
				assertCollection: exception failures hasSameElements: {explanation} ]