tests
testUnbound

	| unbound explanation |

	explanation := 'Parameter not yet configured'.
	unbound := Binding unboundBecause: explanation.

	self
		should: [ unbound content ]
		raise: AssertionFailed
		withExceptionDo: [ :error | self assert: error messageText equals: explanation ]