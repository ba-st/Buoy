"
A CircularIteratorTest is a test class for testing the behavior of CircularIterator
"
Class {
	#name : 'CircularIteratorTest',
	#superclass : 'TestCase',
	#category : 'Buoy-Collections-Tests',
	#package : 'Buoy-Collections-Tests'
}

{ #category : 'tests-accessing' }
CircularIteratorTest >> testCantCreateWithEmptyCollection [

	self
		should: [ CircularIterator cyclingOver: #() ]
		raise: InstanceCreationFailed
		withMessageText: 'It makes no sense to iterate in a cyclic way an empty collection'
]

{ #category : 'tests-accessing' }
CircularIteratorTest >> testCurrent [

	| iterator |

	iterator := CircularIterator cyclingOver: #(1 2 3).

	self assert: iterator current equals: 1.
	iterator next.
	self assert: iterator current equals: 2.
	iterator next.
	self assert: iterator current equals: 3.
	iterator next.
	self assert: iterator current equals: 1.
	iterator next.
	self assert: iterator current equals: 2
]

{ #category : 'tests-accessing' }
CircularIteratorTest >> testIncludes [

	| iterator |

	iterator := CircularIterator cyclingOver: #(1 2 3).
	self
		assert: iterator includes: 1;
		assert: iterator includes: 2;
		assert: iterator includes: 3;
		deny: iterator includes: 4
]

{ #category : 'tests-accessing' }
CircularIteratorTest >> testReset [

	| iterator |

	iterator := CircularIterator cyclingOver: #(1 2 3).

	self assert: iterator current equals: 1.
	iterator next.
	self assert: iterator current equals: 2.
	iterator reset.
	self assert: iterator current equals: 1.

]
