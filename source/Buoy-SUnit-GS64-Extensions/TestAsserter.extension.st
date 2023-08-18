Extension { #name : #TestAsserter }

{ #category : #'*Buoy-SUnit-GS64-Extensions' }
TestAsserter >> assert: actual identicalTo: expected [

	self assert: expected == actual
]

{ #category : #'*Buoy-SUnit-GS64-Extensions' }
TestAsserter >> assertCollection: actual hasSameElements: expected [
	"Assert that a collection contains the same elements as the given collection. Order is not checked, only the presence/absence of elements. Occurences of elements mater."

	| missingElements additionalElements |
	"For performance reasons we check first that they are not equals because difference computation takes long on collections that are not really small."
	actual = expected ifTrue: [ ^ self ].

	"The fast way to know if they have the same elements is to make them a bag. In case they don't have the same elements, then we compute the differences to print a nice little log to the user so that he knows the added and removed elements :)"
	actual asBag = expected asBag ifTrue: [ ^ self ].

	additionalElements := actual difference: expected.
	missingElements := expected difference: (actual intersection: expected).
	self assert: (additionalElements isEmpty and: [ missingElements isEmpty ]) description: (String streamContents: [ :stream |
			 stream
				 nextPutAll: 'Given Collections do not match!';
				 lf;
				 tab;
				 nextPutAll: 'additions : ';
				 print: additionalElements asArray;
				 lf;
				 tab;
				 nextPutAll: 'missing: ';
				 print: missingElements asArray;
				 lf ])
]

{ #category : #'*Buoy-SUnit-GS64-Extensions' }
TestAsserter >> assertString: aString equals: anotherString [

	self
		assert: aString asUnicodeString
		equals: anotherString asUnicodeString
]

{ #category : #'*Buoy-SUnit-GS64-Extensions' }
TestAsserter >> deny: actual identicalTo: expected [

	self deny: expected == actual
]

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
				on: anException
				do: [:aSignal |
					anotherBlock value: aSignal.
					aSignal sunitExitWith: true].

	^self assert: exceptionWasRaised
]
