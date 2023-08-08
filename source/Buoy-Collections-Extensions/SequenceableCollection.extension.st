Extension { #name : #SequenceableCollection }

{ #category : #'*Buoy-Collections-Extensions' }
SequenceableCollection >> copyFirst: n [

	^ [ self copyFrom: 1 to: n ] unless: n = 0 inWhichCase: [ self species new ]
]

{ #category : #'*Buoy-Collections-Extensions' }
SequenceableCollection >> copyNoMoreThanFirst: n [

	^ self copyFirst: ( self size min: n )
]

{ #category : #'*Buoy-Collections-Extensions' }
SequenceableCollection >> copyNoMoreThanLast: n [

	^ self copyLast: ( n min: self size )
]

{ #category : #'*Buoy-Collections-Extensions' }
SequenceableCollection >> equalityChecker [

	^ SequenceableCollectionEqualityChecker new
]

{ #category : #'*Buoy-Collections-Extensions' }
SequenceableCollection >> withoutFirst [

	^self withoutFirst: 1
]

{ #category : #'*Buoy-Collections-Extensions' }
SequenceableCollection >> withoutFirst: n [

	(self size <= n) ifTrue: [^self species new].
	^self copyFrom: n + 1 to: self size
]
