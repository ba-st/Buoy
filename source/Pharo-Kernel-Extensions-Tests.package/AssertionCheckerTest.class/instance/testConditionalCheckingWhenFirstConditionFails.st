tests
testConditionalCheckingWhenFirstConditionFails

	|   explanation rowCount |

	explanation := 'A row count must be positive'.
	rowCount := -15.

	checker  checking: [ :asserter | asserter affirm: [ rowCount positive ] because: explanation onSuccess: [ :successAsserter | self fail ] ].

	self
		should: [ checker check ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: explanation;
				assert: exception failures size equals: 1 ]