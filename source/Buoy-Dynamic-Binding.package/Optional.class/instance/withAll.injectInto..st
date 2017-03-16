Combining
withAll: optionals injectInto: aDyadicBlock

	^ optionals inject: self into: [ :combinedOptional :currentOptional | combinedOptional with: currentOptional return: aDyadicBlock ]