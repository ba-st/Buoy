Instance Creation
withUsedOnlyIn: optionals return: aMonadycBlock

	^ optionals
		ifNotEmpty: [ optionals first withUsedOnlyIn: optionals allButFirst return: aMonadycBlock ]
		ifEmpty: [ self unused ]