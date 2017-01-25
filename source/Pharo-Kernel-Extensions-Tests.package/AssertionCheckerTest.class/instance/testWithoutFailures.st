tests
testWithoutFailures

	checker
		checking: [ :asserter | 
			asserter
				affirm: [ true ] because: [ self fail ];
				affirm: [ 1 positive ] because: [ self fail ] ].

	self shouldnt: [ checker check ] raise: AssertionFailed