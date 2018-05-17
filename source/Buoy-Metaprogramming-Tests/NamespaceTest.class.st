"
I'm a test case for Namespace
"
Class {
	#name : #NamespaceTest,
	#superclass : #TestCase,
	#category : #'Buoy-Metaprogramming-Tests'
}

{ #category : #'tests-accessing' }
NamespaceTest >> testAccessing [

	| namespace |

	namespace := Namespace new.
	namespace
		bind: #Zero to: 0;
		bind: #One to: 1.

	self
		assert: namespace >> #Zero equals: 0;
		assert: namespace >> #One equals: 1
]

{ #category : #'tests-accessing' }
NamespaceTest >> testAccessingUnboundName [

	| namespace |

	namespace := Namespace new.
	namespace
		bind: #Zero to: 0;
		bind: #One to: 1.

	self should: [ namespace >> #MinusOne ] raise: NotFound
]

{ #category : #'tests-accessing' }
NamespaceTest >> testAtIfAbsent [

	| namespace notFound |

	namespace := Namespace new.
	notFound := false.
	namespace at: #Zero ifAbsent: [ notFound := true ].

	self assert: notFound.

	namespace bind: #Zero to: 0.

	self assert: (namespace at: #Zero ifAbsent: [ self fail ]) equals: 0
]

{ #category : #'tests-binding' }
NamespaceTest >> testBindTo [

	| namespace |

	namespace := Namespace new.

	self assert: namespace names isEmpty.

	namespace bind: #Zero to: 0.

	self
		assert: namespace names size equals: 1;
		assert: (namespace names includes: #Zero).

	self assert: namespace >> #Zero equals: 0
]

{ #category : #'tests-binding' }
NamespaceTest >> testCantBindToAlreadyUsedName [

	| namespace |

	namespace := Namespace new.

	namespace bind: #Zero to: 0.

	self should: [ namespace bind: #Zero to: 0.0 ] raise: AssertionFailed 
]

{ #category : #'tests-accessing' }
NamespaceTest >> testEmptyNamespace [

	| emptyNamespace |

	emptyNamespace := Namespace new.

	self assert: emptyNamespace names isEmpty
]

{ #category : #'tests-binding' }
NamespaceTest >> testRebindTo [

	| namespace |

	namespace := Namespace new.

	namespace bind: #Zero to: 0.
	self assert: namespace >> #Zero equals: 0.

	namespace rebind: #Zero to: 'Zero'.
	self assert: namespace >> #Zero equals: 'Zero'.

	namespace rebind: #One to: 1.
	self assert: namespace >> #One equals: 1
]

{ #category : #'tests-binding' }
NamespaceTest >> testRemoveBinding [

	| namespace removed |

	namespace := Namespace new.
	namespace bind: #Zero to: 0.
	removed := namespace removeBindingFor: #Zero.

	self
		assert: namespace names isEmpty;
		assert: removed equals: 0
]

{ #category : #'tests-binding' }
NamespaceTest >> testRemoveBindingForUnknownName [

	| namespace |

	namespace := Namespace new.

	self should: [ namespace removeBindingFor: #Zero ] raise: KeyNotFound
]
