Extension { #name : #Collection }

{ #category : #'*Buoy-Collections' }
Collection >> maxUsing: aBlock [

	^ self maxUsing: aBlock ifEmpty: [ self errorEmptyCollection ]
]

{ #category : #'*Buoy-Collections' }
Collection >> maxUsing: aBlock ifEmpty: ifEmptyBlock [

	^ self ifEmpty: ifEmptyBlock ifNotEmpty: [ self inject: ( aBlock value: self anyOne ) into: [ :max :each | max max: ( aBlock value: each ) ] ]
]

{ #category : #'*Buoy-Collections' }
Collection >> minUsing: aBlock [

	^ self minUsing: aBlock ifEmpty: [ self errorEmptyCollection ]
]

{ #category : #'*Buoy-Collections' }
Collection >> minUsing: aBlock ifEmpty: ifEmptyBlock [

	^ self ifEmpty: ifEmptyBlock ifNotEmpty: [ self inject: ( aBlock value: self anyOne ) into: [ :max :each | max min: ( aBlock value: each ) ] ]
]
