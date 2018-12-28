Extension { #name : #SequenceableCollection }

{ #category : #'*Buoy-Collections' }
SequenceableCollection >> copyFirst: n [

	^ n = 0
		ifTrue: [ self species new ]
		ifFalse: [ self copyFrom: 1 to: n ]
]

{ #category : #'*Buoy-Collections' }
SequenceableCollection >> copyLast: n [

	^ n = 0
		ifTrue: [ self species new ]
		ifFalse: [ | size |

			size := self size.
			self copyFrom: size - n + 1 to: size
			]
]

{ #category : #'*Buoy-Collections' }
SequenceableCollection >> copyNoMoreThanFirst: n [

	^ self copyFirst: ( self size min: n )
]

{ #category : #'*Buoy-Collections' }
SequenceableCollection >> copyNoMoreThanLast: n [

	^ self copyLast: ( n min: self size )
]
