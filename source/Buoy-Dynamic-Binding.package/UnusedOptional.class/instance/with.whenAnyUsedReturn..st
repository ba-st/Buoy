Combining
with: anOptional whenAnyUsedReturn: aBlockClosure

	^ anOptional
		withContentDo: [ :foreignContent | anOptional ]
		ifUnused: [ :foreignExplanations | self class explainedByAll: explanations , foreignExplanations ]