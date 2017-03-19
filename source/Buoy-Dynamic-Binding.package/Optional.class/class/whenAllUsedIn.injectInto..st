Instance Creation
whenAllUsedIn: optionals injectInto: aDyadicBlock

	^ optionals ifNotEmpty: [ optionals first whenAllUsedIn: optionals allButFirst injectInto: aDyadicBlock ] ifEmpty: [ self unused ]