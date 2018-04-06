"
An AssertionFailedTest is a test class for testing the behavior of AssertionFailed
"
Class {
	#name : #AssertionFailedTest,
	#superclass : #TestCase,
	#category : 'Buoy-Assertions-Tests'
}

{ #category : #'tests-Accessing' }
AssertionFailedTest >> testFailures [

	| explanation |

	explanation := 'Testing failures'.
	self
		should: [ AssertionFailed signal: explanation ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: explanation;
				assert: exception failures size equals: 1;
				assert: exception failures first equals: explanation ]
]

{ #category : #'tests-Accessing' }
AssertionFailedTest >> testSignalAll [

	| firstExplanation secondExplanation |

	firstExplanation := 'Testing failures'.
	secondExplanation := 'More failures'.
	self
		should: [ AssertionFailed
				signalAll:
					{firstExplanation.
					secondExplanation} ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: ('<1s>. <2s>' expandMacrosWith: firstExplanation with: secondExplanation);
				assertCollection: exception failures
					hasSameElements:
					{firstExplanation.
					secondExplanation} ]
]
