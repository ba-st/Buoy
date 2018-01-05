formatting
putSeparatorOn: aStream

	^ aStream
		nextPut: separator;
		nextPut: Character space