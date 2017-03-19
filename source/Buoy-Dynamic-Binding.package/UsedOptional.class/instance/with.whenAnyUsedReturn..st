Combining
with: anOptional whenAnyUsedReturn: aDyadicBlock

	^ anOptional
		withContentDo: [ :foreignContent | self class containing: (aDyadicBlock value: content value: foreignContent) ]
		ifUnused: [ self ]