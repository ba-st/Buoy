Instance Creation
withAll: optionals return: aMonadycBlock

	^ optionals ifNotEmpty: [ optionals first withAll: optionals allButFirst return: aMonadycBlock ] ifEmpty: [ self unused ]