tests
testSeveralConditionsFailed

	| mathFailureExplanation collectionSizeFailureExplanation |

	mathFailureExplanation := 'An obvious math error'.
	collectionSizeFailureExplanation := 'An empty collection was not expected'.
	checkerBuilder
		checking: [ :asserter | 
			asserter
				affirm: [ 1 > 2 ] because: mathFailureExplanation;
				affirm: [ #() notEmpty ] because: collectionSizeFailureExplanation ].
	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: ('<1s>. <2s>' expandMacrosWith: mathFailureExplanation with: collectionSizeFailureExplanation);
				assertCollection: exception failures
					hasSameElements:
					{mathFailureExplanation.
					collectionSizeFailureExplanation} ]