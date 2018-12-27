"
I'm a test case for Assertion Checker  
"
Class {
	#name : #AssertionCheckerTest,
	#superclass : #TestCase,
	#category : 'Buoy-Assertions-Tests'
}

{ #category : #tests }
AssertionCheckerTest >> testEnforceOneFactFailing [

	| explanation |

	explanation := 'A false statement'.
	self should: [ AssertionChecker enforce: [ false ] because: explanation ] raise: AssertionFailed withMessageText: explanation
]

{ #category : #tests }
AssertionCheckerTest >> testEnforceOneFactFailingRaisingError [

	| explanation |

	explanation := 'A false statement'.
	"For single fact checking any exception can be configured to be raised, but it's not the case when using multiple fact checking"
	self should: [ AssertionChecker enforce: [ false ] because: explanation raising: Error ] raise: Error withMessageText: explanation
]

{ #category : #tests }
AssertionCheckerTest >> testEnforceOneFactFailingRaisingNonDefaultException [

	| explanation |

	explanation := 'A false statement'.
	
	self
		should: [ AssertionChecker enforce: [ false ] because: explanation raising: InstanceCreationFailed ]
		raise: InstanceCreationFailed
		withMessageText: explanation
]

{ #category : #tests }
AssertionCheckerTest >> testEnforceOneFactNotFailing [

	self
		shouldnt: [ AssertionChecker enforce: [ true ] because: [ self fail ] ] raise: AssertionFailed;
		shouldnt: [ AssertionChecker enforce: [ true ] because: [ self fail ] raising: InstanceCreationFailed ] raise: InstanceCreationFailed
]

{ #category : #tests }
AssertionCheckerTest >> testRefuseOneFactFailing [

	| explanation |

	explanation := 'A false statement'.
	self should: [ AssertionChecker refuse: [ true ] because: explanation ] raise: AssertionFailed withMessageText: explanation
]

{ #category : #tests }
AssertionCheckerTest >> testRefuseOneFactNotFailing [

	self
		shouldnt: [ AssertionChecker refuse: [ false ] because: [ self fail ] ] raise: AssertionFailed;
		shouldnt: [ AssertionChecker refuse: [ false ] because: [ self fail ] raising: InstanceCreationFailed ] raise: InstanceCreationFailed
]
