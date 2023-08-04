Extension { #name : #TestAsserter }

{ #category : #'*Buoy-SUnit-GS64-Extensions' }
TestAsserter >> fail [
	"I make my receiver fail with TestFailure"

	^ self assert: false
]

{ #category : #'*Buoy-SUnit-GS64-Extensions' }
TestAsserter >> should: aBlock raise: anException withExceptionDo: anotherBlock [

	| exceptionWasRaised |

	exceptionWasRaised :=
		[
			aBlock value.
			false]
				sunitOn: anException
				do: [:aSignal |
					anotherBlock value: aSignal.
					aSignal sunitExitWith: true].

	^self assert: exceptionWasRaised
]
