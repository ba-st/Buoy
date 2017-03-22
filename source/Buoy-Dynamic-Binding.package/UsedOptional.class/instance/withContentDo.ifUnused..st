Accessing
withContentDo: aBlockClosure ifUnused: aNothingBlock 
	
	^aBlockClosure cull: content 