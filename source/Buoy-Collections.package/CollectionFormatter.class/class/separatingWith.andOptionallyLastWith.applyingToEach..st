instance creation
separatingWith: aSeparator andOptionallyLastWith: anOptionalSeparator applyingToEach: anElementFormatter

	^ self new
		initializeSeparatingEachWith: aSeparator
		andOptionallyLastWith: anOptionalSeparator
		applyingToEach: anElementFormatter