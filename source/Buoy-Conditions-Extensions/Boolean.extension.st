Extension { #name : #Boolean }

{ #category : #'*Buoy-Conditions-Extensions' }
Boolean >> then: aBlock [

	self ifTrue: aBlock 
]

{ #category : #'*Buoy-Conditions-Extensions' }
Boolean >> then: aTrueBlock otherwise: aFalseBlock [

	^ self
		ifTrue: aTrueBlock
		ifFalse: aFalseBlock
]
