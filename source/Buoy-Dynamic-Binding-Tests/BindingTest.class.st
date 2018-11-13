"
I'm an unit test for the Behavior of Binding
"
Class {
	#name : #BindingTest,
	#superclass : #TestCase,
	#category : #'Buoy-Dynamic-Binding-Tests'
}

{ #category : #tests }
BindingTest >> testIsDefined [

	self
		assert: (Binding to: 1) isDefined;
		deny: (Binding undefinedExplainedBy: '') isDefined
]

{ #category : #tests }
BindingTest >> testTo [

	| binding |

	binding := Binding to: 1.

	self assert: binding content equals: 1
]

{ #category : #tests }
BindingTest >> testUndefinedExplainedBy [

	| binding explanation messageObtained |

	explanation := 'Parameter not yet configured'.
	binding := Binding undefinedExplainedBy: explanation.

	self
		should: [ binding content ]
		raise: AssertionFailed
		withExceptionDo: [ :error | messageObtained := error messageText ].

	self assert: messageObtained equals: explanation
]

{ #category : #tests }
BindingTest >> testUndefinedExplainedByAllRaising [

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
]

{ #category : #tests }
BindingTest >> testUndefinedExplainedByRaising [

	| binding explanation messageObtained |

	explanation := 'Parameter not yet configured'.
	binding := Binding undefinedExplainedBy: explanation raising: InstanceCreationFailed.

	self
		should: [ binding content ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :error | messageObtained := error messageText ].

	self assert: messageObtained equals: explanation
]
