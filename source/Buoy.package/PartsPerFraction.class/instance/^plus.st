arithmetic
+ aNumber

	^ (aNumber isA: self class)
		ifTrue: [ self class ratio: ratio + aNumber ]
		ifFalse: [ ratio + aNumber ]