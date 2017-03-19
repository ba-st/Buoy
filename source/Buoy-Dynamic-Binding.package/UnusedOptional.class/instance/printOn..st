printing
printOn: aStream

	explanations
		do: [ :explanation | aStream nextPutAll: explanation ]
		separatedBy: [ aStream
				nextPut: $.;
				space ]