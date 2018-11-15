Extension { #name : #TestAsserter }

{ #category : #'*Buoy-SUnit-Model' }
TestAsserter >> assert: aCollection includes: anObject [

	self assert: (aCollection includes: anObject)
]

{ #category : #'*Buoy-SUnit-Model' }
TestAsserter >> deny: aCollection includes: anObject [

	self deny: (aCollection includes: anObject)
]

{ #category : #'*Buoy-SUnit-Model' }
TestAsserter >> should: aBlock raise: anException withMessageText: aString [

	self
		should: aBlock
		raise: anException
		withExceptionDo: [ :error | self assert: error messageText equals: aString ]
]

{ #category : #'*Buoy-SUnit-Model' }
TestAsserter >> withTheOnlyOneIn: aCollection do: aBlock [ 

	self
		assert: aCollection size
		equals: 1.
	aBlock value: aCollection anyOne
]
