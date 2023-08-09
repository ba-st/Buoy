Extension { #name : #Percentage }

{ #category : #'*Buoy-Math-Pharo-Extensions' }
Percentage >> printOn: aStream base: anInteger [

	self value printOn: aStream base: anInteger.
	aStream nextPut: $%
]

{ #category : #'*Buoy-Math-Pharo-Extensions' }
Percentage >> storeOn: aStream base: base [

	self isWellKnown ifTrue: [ self storeOn: aStream ]
		ifFalse: [ 
			aStream
				nextPutAll: self class name asString;
				space;
				nextPutAll: 'of:';
				space.
			self value storeOn: aStream base: base
			]
]
