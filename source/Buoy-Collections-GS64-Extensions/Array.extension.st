Extension { #name : #Array }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Array >> fillFrom: aCollection with: aBlock [

	| index |
	index := 0.
	aCollection do: [ :each |
		self at: (index := index + 1) put: (aBlock value: each) ]
]
