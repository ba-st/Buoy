Extension { #name : #AbstractDictionary }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
AbstractDictionary >> at: key ifPresent: aBlock ifAbsentPut: anAbsentBlock [

	| presentValue |
	presentValue := self at: key ifAbsent: [
		                | absentValue |
		                absentValue := anAbsentBlock value.
		                self at: key put: absentValue.
		                ^ absentValue ].
	^ aBlock cull: presentValue
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
AbstractDictionary class >> newFromPairs: anArray [
	"Answer an instance of me associating (anArray at: i) to (anArray at: i+1)
	 for each odd i.  anArray must have an even number of entries."

	"Dictionary newFromPairs: {'Red' . Color red . 'Blue' . Color blue . 'Green' . Color green}."

	| newDictionary |
	newDictionary := self new: anArray size / 2.
	1 to: anArray size - 1 by: 2 do: [ :i | newDictionary at: (anArray at: i) put: (anArray at: i + 1) ].
	^ newDictionary
]
