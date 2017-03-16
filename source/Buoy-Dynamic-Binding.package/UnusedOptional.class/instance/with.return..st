Combining
with: anOptional return: aBlockClosure

	^ anOptional
		withContentDo: [ :foreignContent | self ]
		ifUnused: [ :foreignExplanations | self class explainedByAll: explanations , foreignExplanations ]