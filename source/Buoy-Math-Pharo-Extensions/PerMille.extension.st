Extension { #name : #PerMille }

{ #category : #'*Buoy-Math-Pharo-Extensions' }
PerMille >> printOn: aStream base: anInteger [

	self value printOn: aStream base: anInteger.
	aStream nextPut: $‰
]

{ #category : #'*Buoy-Math-Pharo-Extensions' }
PerMille >> storeOn: aStream base: base [

	self value storeOn: aStream base: base.
	aStream
		space;
		nextPutAll: 'perMille'
]
