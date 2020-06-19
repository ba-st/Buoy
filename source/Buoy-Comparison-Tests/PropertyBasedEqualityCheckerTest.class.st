"
An #PropertyBasedEqualityCheckerTest is a test class for testing the behavior of #PropertyBasedEqualityChecker
"
Class {
	#name : #PropertyBasedEqualityCheckerTest,
	#superclass : #TestCase,
	#category : #'Buoy-Comparison-Tests'
}

{ #category : #tests }
PropertyBasedEqualityCheckerTest >> testCheckingIdenticalObjects [

	| checker |

	checker := self equalityChecker.
	checker compareWith: [ :a :b | self fail ].

	self assert: ( checker checkAgainst: self )
]

{ #category : #tests }
PropertyBasedEqualityCheckerTest >> testPropertyBlockComparison [

	| checker |

	checker := #(1 2 3 4) equalityChecker.
	checker compare: [ :collection | collection last even ].

	self
		assert: ( checker checkAgainst: #(2) );
		assert: ( checker checkAgainst: #(1 2 3 4) );
		deny: ( checker checkAgainst: #(3) );
		deny: ( checker checkAgainst: #(1 2 3 3) ).

	checker := #(1 2 3 3) equalityChecker.
	checker compare: [ :collection | collection last even ].

	self
		assert: ( checker checkAgainst: #(1) );
		assert: ( checker checkAgainst: #(1 2 3 3) );
		deny: ( checker checkAgainst: #(2) );
		deny: ( checker checkAgainst: #(1 2 3 4) )
]

{ #category : #tests }
PropertyBasedEqualityCheckerTest >> testPropertyComparison [

	| checker |

	checker := #(1 2 3 4) equalityChecker.
	checker compare: #first.

	self
		assert: ( checker checkAgainst: #(1 1 1 1) );
		deny: ( checker checkAgainst: #(2 2 3 4) )
]

{ #category : #tests }
PropertyBasedEqualityCheckerTest >> testSeveralPropertiesComparison [

	| checker |

	checker := #(1 2 3 4) equalityChecker.
	checker compareAll: #(#first #second).

	self
		assert: ( checker checkAgainst: #(1 2 1 2) );
		deny: ( checker checkAgainst: #(1 1 3 4) );
		deny: ( checker checkAgainst: #(2 2 3 4) )
]

{ #category : #tests }
PropertyBasedEqualityCheckerTest >> testTypeComparison [

	| checker |

	checker := self equalityChecker.

	self
		assert: ( checker checkAgainst: self class new );
		deny: ( checker checkAgainst: self class superclass new )
]
