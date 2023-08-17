Extension { #name : #Collection }

{ #category : #'*Buoy-Collections-Extensions' }
Collection >> asOrderedSet [

	^ self as: OrderedSet
]

{ #category : #'*Buoy-Collections-Extensions' }
Collection >> includesIdenticalTo: anObject [

	self do: [ :each | anObject == each ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #'*Buoy-Collections-Extensions' }
Collection >> maxUsing: aBlock [

	^ self maxUsing: aBlock ifEmpty: [ self errorEmptyCollection ]
]

{ #category : #'*Buoy-Collections-Extensions' }
Collection >> maxUsing: aBlock ifEmpty: ifEmptyBlock [

	^ self ifEmpty: ifEmptyBlock ifNotEmpty: [ self inject: ( aBlock value: self anyOne ) into: [ :max :each | max max: ( aBlock value: each ) ] ]
]

{ #category : #'*Buoy-Collections-Extensions' }
Collection >> minUsing: aBlock [

	^ self minUsing: aBlock ifEmpty: [ self errorEmptyCollection ]
]

{ #category : #'*Buoy-Collections-Extensions' }
Collection >> minUsing: aBlock ifEmpty: ifEmptyBlock [

	^ self ifEmpty: ifEmptyBlock ifNotEmpty: [ self inject: ( aBlock value: self anyOne ) into: [ :max :each | max min: ( aBlock value: each ) ] ]
]
