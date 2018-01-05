instance creation
separatingWith: aSeparator andLastWith: aLastSeparator

	^ self
		separatingWith: aSeparator
		andOptionallyLastWith: (Optional containing: aLastSeparator)
		applyingToEach: [ :element | element asString ]