tests-accessing
testCurrent

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