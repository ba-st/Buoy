"
I'm a test case for Namespace
"
Class {
	#name : #NamespaceTest,
	#superclass : #TestCase,
	#category : #'Buoy-Metaprogramming-Tests'
}

{ #category : #tests }
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

{ #category : #tests }
NamespaceTest >> testAccessingUnboundName [

	| namespace |

	namespace := Namespace new.
	namespace
		bind: #Zero to: 0;
		bind: #One to: 1.

	self should: [ namespace >> #MinusOne ] raise: NotFound
]

{ #category : #tests }
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

{ #category : #tests }
NamespaceTest >> testCantBindToAlreadyUsedName [

	| namespace |

	namespace := Namespace new.

	namespace bind: #Zero to: 0.

	self should: [ namespace bind: #Zero to: 0.0 ] raise: BindingAlreadyInUse
]

{ #category : #tests }
NamespaceTest >> testEmptyNamespace [

	| emptyNamespace |

	emptyNamespace := Namespace new.

	self assert: emptyNamespace names isEmpty
]

{ #category : #tests }
NamespaceTest >> testRemoveBinding [

	| namespace removed |

	namespace := Namespace new.
	namespace bind: #Zero to: 0.
	removed := namespace removeBindingFor: #Zero.

	self
		assert: namespace names isEmpty;
		assert: removed equals: 0
]

{ #category : #tests }
NamespaceTest >> testRemoveBindingForUnknownName [

	| namespace |

	namespace := Namespace new.

	self should: [ namespace removeBindingFor: #Zero ] raise: KeyNotFound
]
