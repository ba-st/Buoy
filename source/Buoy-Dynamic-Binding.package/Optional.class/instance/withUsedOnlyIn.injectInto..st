Combining
withUsedOnlyIn: optionals injectInto: aDyadicBlock

	^ optionals
		inject: self
		into:
			[ :combinedOptional :currentOptional | combinedOptional with: currentOptional whenAnyUsedReturn: aDyadicBlock ]