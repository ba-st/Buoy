"
An EqualityCheckerTest is a test class for testing the behavior of EqualityChecker
"
Class {
	#name : #PropertyBasedEqualityCheckerTest,
	#superclass : #TestCase,
	#category : #'Buoy-Comparison-Tests'
}

{ #category : #tests }
PropertyBasedEqualityCheckerTest >> testCheckingIdenticalObjects [

	| checker |

	checker := PropertyBasedEqualityChecker on: self.
	checker compareWith: [ :a :b | self fail ].

	self assert: ( checker checkAgainst: self )
]

{ #category : #tests }
PropertyBasedEqualityCheckerTest >> testPropertyBlockComparison [

	| checker |

	checker := PropertyBasedEqualityChecker on: #(1 2 3 4).
	checker compare: [ :collection | collection last even ].

	self
		assert: ( checker checkAgainst: #(2) );
		assert: ( checker checkAgainst: #(1 2 3 4) );
		deny: ( checker checkAgainst: #(3) );
		deny: ( checker checkAgainst: #(1 2 3 3) )
]

{ #category : #tests }
PropertyBasedEqualityCheckerTest >> testPropertyComparison [

	| checker |

	checker := PropertyBasedEqualityChecker on: #(1 2 3 4).
	checker compare: #first.

	self
		assert: ( checker checkAgainst: #(1 1 1 1) );
		deny: ( checker checkAgainst: #(2 2 3 4) )
]

{ #category : #tests }
PropertyBasedEqualityCheckerTest >> testSeveralPropertiesComparison [

	| checker |

	checker := PropertyBasedEqualityChecker on: #(1 2 3 4).
	checker compareAll: #(#first #second).

	self
		assert: ( checker checkAgainst: #(1 2 1 2) );
		deny: ( checker checkAgainst: #(1 1 3 4) );
		deny: ( checker checkAgainst: #(2 2 3 4) )
]

{ #category : #tests }
PropertyBasedEqualityCheckerTest >> testTypeComparison [

	| checker |

	checker := PropertyBasedEqualityChecker on: self.

	self
		assert: ( checker checkAgainst: self class new );
		deny: ( checker checkAgainst: self class superclass new )
]
