Combining
whenAllUsedIn: optionals injectInto: aDyadicBlock

	^ optionals inject: self into: [ :combinedOptional :currentOptional | combinedOptional with: currentOptional whenBothUsedReturn: aDyadicBlock ]