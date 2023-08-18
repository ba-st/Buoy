Extension { #name : #OffsetError }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
OffsetError class >> signalFor: subscript [

	^ self signal: ('<1p> is out of bounds' expandMacrosWith: subscript)
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
OffsetError class >> signalFor: subscript lowerBound: lowerBound upperBound: upperBound [

	^ self signal: ('<1p> is not between <2p> and <3p>'
			   expandMacrosWith: subscript
			   with: lowerBound
			   with: upperBound)
]
