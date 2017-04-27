printing
storeOn: aStream

	ratio isZero
		ifTrue: [ ^ aStream
				nextPutAll: self class name asString;
				space;
				nextPutAll: 'zero' ].
	ratio = 1
		ifTrue: [ ^ aStream
				nextPutAll: self class name asString;
				space;
				nextPutAll: 'oneHundred' ].
	aStream
		nextPutAll: self class name asString;
		space;
		nextPutAll: 'of:';
		space.
	self value storeOn: aStream