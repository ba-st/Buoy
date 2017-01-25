tests
testSingleConditionFailure

	|   explanation |

	explanation := 'An obvious math error'.
	checker  checking: [ :asserter | asserter affirm: [ 1 > 2 ] because: explanation ].
	self
		should: [ checker check ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: explanation;
				assert: exception failures size equals: 1 ]