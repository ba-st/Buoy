initialization
initializeSeparatingEachWith: aSeparator andOptionallyLastWith: anOptional applyingToEach: aBlock

	separator := aSeparator.
	lastSeparator := anOptional.
	elementFormatter := aBlock