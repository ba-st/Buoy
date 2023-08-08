Extension { #name : #SequenceableCollection }

{ #category : #'*Buoy-Collections-Pharo-Extensions' }
SequenceableCollection >> copyLast: n [

	^ [ self copyFrom: self size - n + 1 to: self size ] unless: n = 0 inWhichCase: [ self species new ]
]
