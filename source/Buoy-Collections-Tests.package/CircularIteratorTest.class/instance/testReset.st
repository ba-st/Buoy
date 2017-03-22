tests-accessing
testReset

	| iterator |

	iterator := CircularIterator cyclingOver: #(1 2 3).

	self assert: iterator current equals: 1.
	iterator next.
	self assert: iterator current equals: 2.
	iterator reset.
	self assert: iterator current equals: 1.
