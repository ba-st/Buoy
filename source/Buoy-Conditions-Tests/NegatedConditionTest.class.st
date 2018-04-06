Class {
	#name : #NegatedConditionTest,
	#superclass : #TestCase,
	#category : 'Buoy-Conditions-Tests'
}

{ #category : #tests }
NegatedConditionTest >> testIsSatisfied [

	| condition |

	condition := NegatedCondition with: (ArithmeticCondition toBeEqualTo: 10).

	self
		assert: (condition isSatisfiedBy: 8);
		deny: (condition isSatisfiedBy: 10)
]

{ #category : #tests }
NegatedConditionTest >> testShortcut [

	| condition |

	condition := (ArithmeticCondition toBeEqualTo: 10) negated.

	self
		assert: (condition isSatisfiedBy: 8);
		deny: (condition isSatisfiedBy: 10)
]
