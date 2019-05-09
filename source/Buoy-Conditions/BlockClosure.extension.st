Extension { #name : #BlockClosure }

{ #category : #'*Buoy-Conditions' }
BlockClosure >> unless: aBoolean [

	aBoolean ifFalse: self
]

{ #category : #'*Buoy-Conditions' }
BlockClosure >> unless: aBoolean inWhichCase: anAlternativeBlock [

	^ aBoolean then: anAlternativeBlock otherwise: self
]
