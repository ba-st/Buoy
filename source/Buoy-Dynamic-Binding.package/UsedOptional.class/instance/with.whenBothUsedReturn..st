Combining
with: anOptional whenBothUsedReturn: aDyadicBlock

	^ anOptional
		withContentDo:
			[ :foreignContent | self class containing: (aDyadicBlock value: content value: foreignContent) ]
		ifUnused: [ anOptional ]