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
