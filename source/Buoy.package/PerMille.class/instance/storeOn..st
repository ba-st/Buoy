printing
storeOn: aStream

	self value storeOn: aStream.
	aStream
		space;
		nextPutAll: 'perMille'