Extension { #name : #OrderedCollection }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
OrderedCollection class >> new: anInteger withAll: anObject [

	^ ( Array new: anInteger withAll: anObject ) asOrderedCollection
]
