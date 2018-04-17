"
I'm a test case for Assertion Checker Builder
"
Class {
	#name : #AssertionCheckerBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'checkerBuilder'
	],
	#category : 'Buoy-Assertions-Tests'
}

{ #category : #initialization }
AssertionCheckerBuilderTest >> setUp [

	checkerBuilder := AssertionCheckerBuilder new
]

{ #category : #tests }
AssertionCheckerBuilderTest >> testConditionalChecking [

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
]

{ #category : #tests }
AssertionCheckerBuilderTest >> testConditionalCheckingWhenFirstConditionFails [

	| explanation rowCount |

	explanation := 'A row count must be positive'.
	rowCount := -15.

	checkerBuilder checking: [ :asserter | asserter enforce: [ rowCount positive ] because: explanation onSuccess: [ :successAsserter | self fail ] ].

	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: explanation;
				assertCollection: exception failures hasSameElements: {explanation} ]
]

{ #category : #tests }
AssertionCheckerBuilderTest >> testFailFast [

	| mathFailureExplanation |

	mathFailureExplanation := 'An obvious math error'.
	checkerBuilder
		failFast;
		checking: [ :asserter | 
			asserter
				enforce: [ 2 > 3 ] because: mathFailureExplanation;
				enforce: [ self fail ] because: [ self fail ];
				enforce: [ self fail ] because: [ self fail ] ].

	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: mathFailureExplanation;
				assertCollection: exception failures hasSameElements: {mathFailureExplanation} ]
]

{ #category : #tests }
AssertionCheckerBuilderTest >> testFailFastConfiguringErrorToRaise [

	| mathFailureExplanation |

	mathFailureExplanation := 'An obvious math error'.
	checkerBuilder
		failFast;
		raising: InstanceCreationFailed;
		checking: [ :asserter | 
			asserter
				enforce: [ 2 > 3 ] because: mathFailureExplanation;
				enforce: [ self fail ] because: [ self fail ];
				enforce: [ self fail ] because: [ self fail ] ].

	self
		should: [ checkerBuilder buildAndCheck ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: mathFailureExplanation;
				assertCollection: exception failures hasSameElements: {mathFailureExplanation} ]
]

{ #category : #tests }
AssertionCheckerBuilderTest >> testFailFastInConditional [

	| mathFailureExplanation |

	mathFailureExplanation := 'An obvious math error'.
	checkerBuilder
		failFast;
		checking: [ :asserter | 
			asserter
				enforce: [ true ] because: [ self fail ] onSuccess: [ :successAsserter | successAsserter enforce: [ false ] because: mathFailureExplanation ];
				enforce: [ self fail ] because: [ self fail ];
				enforce: [ self fail ] because: [ self fail ] ].

	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: mathFailureExplanation;
				assertCollection: exception failures hasSameElements: {mathFailureExplanation} ]
]

{ #category : #tests }
AssertionCheckerBuilderTest >> testFailFastPassingSomeConditions [

	| failureExplanation |

	failureExplanation := 'An obvious math error'.
	checkerBuilder
		failFast;
		checking: [ :asserter | 
			asserter
				enforce: [ true ] because: [ self fail ];
				enforce: [ false ] because: failureExplanation;
				enforce: [ self fail ] because: [ self fail ] ].

	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: failureExplanation;
				assertCollection: exception failures hasSameElements: {failureExplanation} ]
]

{ #category : #tests }
AssertionCheckerBuilderTest >> testSeveralConditionsButOnlyOneFailed [

	| mathFailureExplanation |

	mathFailureExplanation := 'An obvious math error'.
	checkerBuilder
		checking: [ :asserter | 
			asserter
				enforce: [ 4 > 3 ] because: [ self fail ];
				enforce: [ 1 > 2 ] because: mathFailureExplanation;
				refuse: [ #() notEmpty ] because: [ self fail ] ].
	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: mathFailureExplanation;
				assertCollection: exception failures hasSameElements: {mathFailureExplanation} ]
]

{ #category : #tests }
AssertionCheckerBuilderTest >> testSeveralConditionsButOnlyOneFailedConfiguringErrorToRaise [

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
]

{ #category : #tests }
AssertionCheckerBuilderTest >> testSeveralConditionsFailed [

	| mathFailureExplanation collectionSizeFailureExplanation |

	mathFailureExplanation := 'An obvious math error'.
	collectionSizeFailureExplanation := 'An empty collection was not expected'.
	checkerBuilder
		checking: [ :asserter | 
			asserter
				enforce: [ 1 > 2 ] because: mathFailureExplanation;
				enforce: [ #() notEmpty ] because: collectionSizeFailureExplanation ].
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
]

{ #category : #tests }
AssertionCheckerBuilderTest >> testSingleConditionFailure [

	| explanation |

	explanation := 'An obvious math error'.
	checkerBuilder checking: [ :asserter | asserter enforce: [ 1 > 2 ] because: explanation ].
	self
		should: [ checkerBuilder buildAndCheck ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: explanation;
				assertCollection: exception failures hasSameElements: {explanation} ]
]

{ #category : #tests }
AssertionCheckerBuilderTest >> testWithoutChecks [

	self shouldnt: [ checkerBuilder buildAndCheck ] raise: AssertionFailed
]

{ #category : #tests }
AssertionCheckerBuilderTest >> testWithoutFailures [

	checkerBuilder
		checking: [ :asserter | 
			asserter
				enforce: [ true ] because: [ self fail ];
				enforce: [ 1 positive ] because: [ self fail ] ].

	self shouldnt: [ checkerBuilder buildAndCheck ] raise: AssertionFailed
]
