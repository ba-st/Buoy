tests-Accessing
testFailures

	| explanation |

	explanation := 'Testing failures'.
	self
		should: [ AssertionFailed signal: explanation ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: explanation;
				assert: exception failures size equals: 1;
				assert: exception failures first equals: explanation ]