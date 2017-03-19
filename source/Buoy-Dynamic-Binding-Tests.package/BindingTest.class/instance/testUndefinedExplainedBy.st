tests
testUndefinedExplainedBy

	| binding explanation messageObtained |

	explanation := 'Parameter not yet configured'.
	binding := Binding undefinedExplainedBy: explanation.

	self
		should: [ binding content ]
		raise: AssertionFailed
		withExceptionDo: [ :error | messageObtained := error messageText ].

	self assert: messageObtained equals: explanation