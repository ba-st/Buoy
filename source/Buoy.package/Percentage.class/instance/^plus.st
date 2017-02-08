arithmetic
+ aNumber

	^ aNumber isPercentage
		ifTrue: [ self class ratio: ratio + aNumber ]
		ifFalse: [ ratio + aNumber ]