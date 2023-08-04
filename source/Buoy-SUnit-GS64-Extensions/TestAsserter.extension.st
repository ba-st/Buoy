Extension { #name : #TestAsserter }

{ #category : #'*Buoy-SUnit-GS64-Extensions' }
TestAsserter >> fail [
	"I make my receiver fail with TestFailure"

	^ self assert: false
]

{ #category : #'*Buoy-SUnit-GS64-Extensions' }
TestAsserter >> should: aBlock raise: anException withExceptionDo: anotherBlock [
	<debuggerCompleteToSender>
	^self assert: (self executeShould: aBlock inScopeOf: anException withExceptionDo: anotherBlock)
]
