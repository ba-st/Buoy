Checking
checkApplying: anAssertionFailurePolicy

	factToCheck value
		ifTrue: [ successAction value: anAssertionFailurePolicy ]
		ifFalse: [ anAssertionFailurePolicy assertionFailedBecause: self explanation ]