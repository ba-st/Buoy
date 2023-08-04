Extension { #name : #BlockClosure }

{ #category : #'*Buoy-Conditions-Extensions' }
BlockClosure >> unless: aBoolean [

	aBoolean ifFalse: self
]

{ #category : #'*Buoy-Conditions-Extensions' }
BlockClosure >> unless: aBoolean inWhichCase: anAlternativeBlock [

	^ aBoolean then: anAlternativeBlock otherwise: self
]
