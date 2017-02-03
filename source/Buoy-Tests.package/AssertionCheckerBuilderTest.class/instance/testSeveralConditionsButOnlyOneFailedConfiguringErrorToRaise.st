tests
testSeveralConditionsButOnlyOneFailedConfiguringErrorToRaise

	| mathFailureExplanation |

	mathFailureExplanation := 'An obvious math error'.
	checkerBuilder
		raising: InstanceCreationFailed;
		checking: [ :asserter | 
			asserter
				enforce: [ 4 > 3 ] because: [ self fail ];
				enforce: [ 1 > 2 ] because: mathFailureExplanation;
				enforce: [ #() isEmpty ] because: [ self fail ] ].
	self
		should: [ checkerBuilder buildAndCheck ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: mathFailureExplanation;
				assertCollection: exception failures hasSameElements: {mathFailureExplanation} ]