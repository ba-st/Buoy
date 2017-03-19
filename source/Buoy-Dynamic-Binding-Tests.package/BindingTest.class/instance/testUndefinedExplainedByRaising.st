tests
testUndefinedExplainedByRaising

	| binding explanation messageObtained |

	explanation := 'Parameter not yet configured'.
	binding := Binding undefinedExplainedBy: explanation raising: InstanceCreationFailed.

	self
		should: [ binding content ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :error | messageObtained := error messageText ].

	self assert: messageObtained equals: explanation