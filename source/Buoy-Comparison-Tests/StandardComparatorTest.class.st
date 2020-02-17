Class {
	#name : #StandardComparatorTest,
	#superclass : #TestCase,
	#category : #'Buoy-Comparison-Tests'
}

{ #category : #tests }
StandardComparatorTest >> testCheckingDifferentObjectsOfTheSameType [

	| comparator |

	comparator :=
		StandardComparator differentiatingThrough: [:oneObject :anotherObject |
			oneObject asArray = anotherObject asArray].

	self deny: (comparator check: (Set with: 11) against: (Set with: 22)).

	comparator := StandardComparator differentiatingSending: #(asArray).

	self deny: (comparator check: (Set with: 11) against: (Set with: 22))
]

{ #category : #tests }
StandardComparatorTest >> testCheckingEquivalentObjects [

	| comparator |

	comparator :=
		StandardComparator differentiatingThrough: [:oneObject :anotherObject |
			oneObject asArray = anotherObject asArray].

	self assert: (comparator check: (Set with: 34) against: (Set with: 34)).

	comparator := StandardComparator differentiatingSending: #(asArray).

	self assert: (comparator check: (Set with: 34) against: (Set with: 34))
]

{ #category : #tests }
StandardComparatorTest >> testCheckingObjectsOfDifferentTypes [

	| comparator |

	comparator :=
		StandardComparator differentiatingThrough: [:oneObject :anotherObject |
			oneObject asArray = anotherObject asArray].

	self deny: (comparator check: (Set with: 34) against: (OrderedCollection with: 34)).

	comparator := StandardComparator differentiatingSending: #(asArray).

	self deny: (comparator check: (Set with: 34) against: (OrderedCollection with: 34))
]

{ #category : #tests }
StandardComparatorTest >> testCheckingOnlyType [

	| comparator |

	comparator := StandardComparator differentiatingType.

	self assert: (comparator check: (Set with: 11) against: (Set with: 22)).
	self deny: (comparator check: Set new against: OrderedCollection new).

	comparator := StandardComparator differentiatingSending: #().

	self assert: (comparator check: (Set with: 11) against: (Set with: 22)).
	self deny: (comparator check: Set new against: OrderedCollection new)
]

{ #category : #tests }
StandardComparatorTest >> testCheckingSameObject [

	| comparator |

	comparator := StandardComparator differentiatingThrough: [ :oneObject :anotherObject | self fail ].

	self assert: ( comparator check: self against: self )
]
