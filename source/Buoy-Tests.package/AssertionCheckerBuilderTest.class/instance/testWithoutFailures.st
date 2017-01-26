tests
testWithoutFailures

	checkerBuilder
		checking: [ :asserter | 
			asserter
				affirm: [ true ] because: [ self fail ];
				affirm: [ 1 positive ] because: [ self fail ] ].

	self shouldnt: [ checkerBuilder buildAndCheck ] raise: AssertionFailed