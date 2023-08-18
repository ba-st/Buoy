Extension { #name : #TestAsserter }

{ #category : #'*Buoy-SUnit-Pharo-Extensions' }
TestAsserter >> assertString: aString equals: anotherString [

	self assert: aString equals: anotherString
]
