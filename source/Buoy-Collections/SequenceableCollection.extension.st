Extension { #name : #SequenceableCollection }

{ #category : #'*Buoy-Collections' }
SequenceableCollection >> copyFirst: n [

	^ [ self copyFrom: 1 to: n ] unless: n = 0 inSuchCase: [ self species new ]
]

{ #category : #'*Buoy-Collections' }
SequenceableCollection >> copyLast: n [

	^ [ self copyFrom: self size - n + 1 to: self size ] unless: n = 0 inSuchCase: [ self species new ]
]

{ #category : #'*Buoy-Collections' }
SequenceableCollection >> copyNoMoreThanFirst: n [

	^ self copyFirst: ( self size min: n )
]

{ #category : #'*Buoy-Collections' }
SequenceableCollection >> copyNoMoreThanLast: n [

	^ self copyLast: ( n min: self size )
]
