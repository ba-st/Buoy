Instance Creation
withUsedOnlyIn: optionals injectInto: aDyadicBlock

	^ optionals
		ifNotEmpty: [ optionals first withUsedOnlyIn: optionals allButFirst injectInto: aDyadicBlock ]
		ifEmpty: [ self unused ]