Extension { #name : #SequenceableCollection }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> copyAfter: anElement [
	"Answer a copy of the receiver from after the first occurrence
	of anElement up to the end. If no such element exists, answer
	an empty copy."

	^ self allButFirst: (self indexOf: anElement ifAbsent: [^ self copyEmpty])
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> isSequenceable [

	^ true
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
SequenceableCollection >> writeStream [
	^ WriteStream on: self
]
