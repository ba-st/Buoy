Extension { #name : 'Interval' }

{ #category : '*Buoy-Collections-GS64-Extensions' }
Interval >> sorted [

	^ self increment >= 0
		  ifTrue: [ self copy ]
		  ifFalse: [ self last to: self first by: self increment negated ]
]
