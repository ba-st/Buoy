formatting
put: aSeparator on: aStream

	^ aStream
		nextPut: Character space;
		nextPut: aSeparator;
		nextPut: Character space