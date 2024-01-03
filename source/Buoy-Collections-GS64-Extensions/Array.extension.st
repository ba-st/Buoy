Extension { #name : 'Array' }

{ #category : '*Buoy-Collections-GS64-Extensions' }
Array >> fillFrom: aCollection with: aBlock [

	| index |
	index := 0.
	aCollection do: [ :each |
		self at: (index := index + 1) put: (aBlock value: each) ]
]

{ #category : '*Buoy-Collections-GS64-Extensions' }
Array >> isArray [

	^ true
]

{ #category : '*Buoy-Collections-GS64-Extensions' }
Array class >> newFrom: aCollection [
	"Answer an instance of me containing the same elements as aCollection."

	| newArray |
	newArray := self new: aCollection size.
	1 to: aCollection size do: [ :i |
	newArray at: i put: (aCollection at: i) ].
	^ newArray
]
