instance creation
separatingWith: aSeparator andLastWith: aLastSeparator applyingToEach: anElementFormatter

	^ self
		separatingWith: aSeparator
		andOptionallyLastWith: (Optional containing: aLastSeparator)
		applyingToEach: anElementFormatter