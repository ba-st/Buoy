Class {
	#name : #StandardComparisonTest,
	#superclass : #TestCase,
	#category : #'Buoy-Comparison-Tests'
}

{ #category : #tests }
StandardComparisonTest >> testCheckingDifferentObjectsOfTheSameType [

	| comparison |

	comparison :=
		StandardComparison differentiatingThrough: [:oneObject :anotherObject |
			oneObject asArray = anotherObject asArray].

	self deny: (comparison check: (Set with: 11) against: (Set with: 22)).

	comparison := StandardComparison differentiatingSending: #(asArray).

	self deny: (comparison check: (Set with: 11) against: (Set with: 22))
]

{ #category : #tests }
StandardComparisonTest >> testCheckingEquivalentObjects [

	| comparison |

	comparison :=
		StandardComparison differentiatingThrough: [:oneObject :anotherObject |
			oneObject asArray = anotherObject asArray].

	self assert: (comparison check: (Set with: 34) against: (Set with: 34)).

	comparison := StandardComparison differentiatingSending: #(asArray).

	self assert: (comparison check: (Set with: 34) against: (Set with: 34))
]

{ #category : #tests }
StandardComparisonTest >> testCheckingObjectsOfDifferentTypes [

	| comparison |

	comparison :=
		StandardComparison differentiatingThrough: [:oneObject :anotherObject |
			oneObject asArray = anotherObject asArray].

	self deny: (comparison check: (Set with: 34) against: (OrderedCollection with: 34)).

	comparison := StandardComparison differentiatingSending: #(asArray).

	self deny: (comparison check: (Set with: 34) against: (OrderedCollection with: 34))
]

{ #category : #tests }
StandardComparisonTest >> testCheckingOnlyType [

	| comparison |

	comparison := StandardComparison differentiatingType.

	self assert: (comparison check: (Set with: 11) against: (Set with: 22)).
	self deny: (comparison check: Set new against: OrderedCollection new).

	comparison := StandardComparison differentiatingSending: #().

	self assert: (comparison check: (Set with: 11) against: (Set with: 22)).
	self deny: (comparison check: Set new against: OrderedCollection new)
]

{ #category : #tests }
StandardComparisonTest >> testCheckingSameObject [

	| comparison |

	comparison := StandardComparison differentiatingThrough: [ :oneObject :anotherObject | self fail ].

	self assert: ( comparison check: self against: self )
]
