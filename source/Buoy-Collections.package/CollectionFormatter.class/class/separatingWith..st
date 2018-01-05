instance creation
separatingWith: aSeparator

	^ self
		separatingWith: aSeparator
		andOptionallyLastWith: Optional unused
		applyingToEach: [ :element | element asString ]