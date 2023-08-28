Extension { #name : #Set }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Set >> intersection: aCollection [

	^ aCollection select: [ :each | self includes: each ]
]
