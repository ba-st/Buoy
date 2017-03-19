tests
testUndefinedExplainedByAllRaising

	| binding explanations messageObtained |

	explanations := {'Parameter not yet configured' . 'Parameter seems wrong'}.
	binding := Binding undefinedExplainedByAll: explanations raising: InstanceCreationFailed.

	self
		should: [ binding content ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :error | messageObtained := error messageText ].

	self
		assert: messageObtained
		equals: 'Parameter not yet configured. Parameter seems wrong'