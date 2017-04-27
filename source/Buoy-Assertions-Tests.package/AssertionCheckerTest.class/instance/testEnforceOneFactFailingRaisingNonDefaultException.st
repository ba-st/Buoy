tests
testEnforceOneFactFailingRaisingNonDefaultException

	| explanation |

	explanation := 'A false statement'.
	
	self
		should: [ AssertionChecker enforce: [ false ] because: explanation raising: InstanceCreationFailed ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: explanation ]