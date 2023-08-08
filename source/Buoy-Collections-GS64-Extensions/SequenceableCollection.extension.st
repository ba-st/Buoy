Extension { #name : #SequenceableCollection }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> isSequenceable [

	^ true
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> writeStream [
	^ WriteStream on: self
]
