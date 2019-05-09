Extension { #name : #Boolean }

{ #category : #'*Buoy-Conditions' }
Boolean >> then: aBlock [

	self ifTrue: aBlock 
]

{ #category : #'*Buoy-Conditions' }
Boolean >> then: aTrueBlock otherwise: aFalseBlock [

	^ self
		ifTrue: aTrueBlock
		ifFalse: aFalseBlock
]
