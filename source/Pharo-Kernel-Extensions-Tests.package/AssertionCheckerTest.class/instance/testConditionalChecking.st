tests
testConditionalChecking

	| explanation rowCount |

	explanation := 'A row count must be positive'.
	rowCount := -15.

	checker checking: [ :asserter | asserter affirm: [ rowCount notNil ] because: [ self fail ] onSuccess: [ :successAsserter | successAsserter affirm: [ rowCount positive ] because: [ explanation ] ] ].

	self
		should: [ checker check ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: explanation;
				assert: exception failures size equals: 1 ]