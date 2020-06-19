"
A SequenceableCollectionEqualityCheckerTest is a test class for testing the behavior of SequenceableCollectionEqualityChecker
"
Class {
	#name : #SequenceableCollectionEqualityCheckerTest,
	#superclass : #TestCase,
	#category : #'Buoy-Comparison-Tests'
}

{ #category : #tests }
SequenceableCollectionEqualityCheckerTest >> testCheckAgainst [

	| checker base |

	base := #(1 2 3 4).
	checker := SequenceableCollectionEqualityChecker new.

	self
		assert: ( checker check: base against: #(1 2 3 4) );
		assert: ( checker check: base against: #(1 2 3 4) asOrderedCollection );
		deny: ( checker check: base against: #(1 2 3) );
		deny: ( checker check: base against: #(0 2 3 4) );
		deny: ( checker check: base against: #(1 0 3 4) );
		deny: ( checker check: base against: #(1 2 0 4) );
		deny: ( checker check: base against: #(1 2 3 0) )
]
