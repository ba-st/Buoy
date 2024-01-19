Extension { #name : 'Random' }

{ #category : '*Buoy-GS64-Compatibility' }
Random >> integerBetween: anInteger and: anInteger2 [

	^ anInteger2 atRandom: SharedRandom globalGenerator
]
