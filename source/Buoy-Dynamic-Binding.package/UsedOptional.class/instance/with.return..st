Combining
with: anOptional return: aDyadicBlock

	^ anOptional
		withContentDo: [ :foreignContent | self class containing: (aDyadicBlock value: content value: foreignContent) ]
		ifUnused: [ anOptional ]