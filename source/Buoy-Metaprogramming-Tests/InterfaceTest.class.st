"
An InterfaceTest is a test class for testing the behavior of Interface
"
Class {
	#name : #InterfaceTest,
	#superclass : #TestCase,
	#category : #'Buoy-Metaprogramming-Tests'
}

{ #category : #tests }
InterfaceTest >> testCantDeclareAnEmptyInterface [

	self should: [ Interface named: 'Empty' declaring: #() ] raise: InstanceCreationFailed
]

{ #category : #tests }
InterfaceTest >> testIsImplementedBy [

	| assertable |

	assertable := Interface named: 'Assertable' declaring: #(#assert: #deny:).

	self
		assert: (assertable isImplementedBy: self);
		deny: (assertable isImplementedBy: assertable)
]

{ #category : #tests }
InterfaceTest >> testIsImplementedByInstancesOf [

	| assertable |

	assertable := Interface named: 'Assertable' declaring: #(#assert: #deny:).

	self
		assert: (assertable isImplementedByInstancesOf: self class);
		assert: (assertable isImplementedByInstancesOf: TestCase);
		assert: (assertable isImplementedByInstancesOf: TestAsserter);
		deny: (assertable isImplementedByInstancesOf: Object)
]

{ #category : #tests }
InterfaceTest >> testPrintOn [

	| assertable |

	assertable := Interface named: 'Assertable' declaring: #(#assert: #deny:).

	self assert: assertable printString equals: 'Assertable'
]
