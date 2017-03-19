Instance Creation
whenAllUsedIn: optionals return: aMonadycBlock

	^ optionals ifNotEmpty: [ optionals first whenAllUsedIn: optionals allButFirst return: aMonadycBlock ] ifEmpty: [ self unused ]