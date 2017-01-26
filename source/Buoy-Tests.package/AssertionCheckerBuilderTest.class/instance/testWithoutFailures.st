tests
testWithoutFailures

	checkerBuilder
		checking: [ :asserter | 
			asserter
				enforce: [ true ] because: [ self fail ];
				enforce: [ 1 positive ] because: [ self fail ] ].

	self shouldnt: [ checkerBuilder buildAndCheck ] raise: AssertionFailed