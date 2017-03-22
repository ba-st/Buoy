tests-accessing
testIncludes

	| iterator |

	iterator := CircularIterator cyclingOver: #(1 2 3).

	self
		assert: (iterator includes: 1);
		assert: (iterator includes: 2);
		assert: (iterator includes: 3);
		deny: (iterator includes: 4)