tests
testBoundObjectWhenBound

	| boundObject |

	boundObject := Binding to: 1.

	self assert: boundObject content equals: 1