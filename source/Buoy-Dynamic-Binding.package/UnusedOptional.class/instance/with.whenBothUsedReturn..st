Combining
with: anOptional whenBothUsedReturn: aBlockClosure

	^ anOptional
		withContentDo: [ :foreignContent | self ]
		ifUnused: [ :foreignExplanations | self class explainedByAll: explanations , foreignExplanations ]