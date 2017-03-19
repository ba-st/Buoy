tests
testTo

	| binding |

	binding := Binding to: 1.

	self assert: binding content equals: 1