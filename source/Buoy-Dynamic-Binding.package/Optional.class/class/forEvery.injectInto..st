Instance Creation
forEvery: optionals injectInto: aDyadicBlock

	^ optionals ifNotEmpty: [ optionals first withAll: optionals allButFirst injectInto: aDyadicBlock ] ifEmpty: [ self unused ]