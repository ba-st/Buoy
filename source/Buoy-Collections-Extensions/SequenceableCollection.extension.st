Extension { #name : #SequenceableCollection }

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
