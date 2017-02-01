tests
testEnforceOneFactFailingRaisingError

	| explanation |

	explanation := 'A false statement'.
	"For single fact checking any exception can be configured to be raised, but it's not the case when using multiple fact checking"
	self should: [ AssertionChecker enforce: [ false ] because: explanation raising: Error ] raise: Error withExceptionDo: [ :exception | self assert: exception messageText equals: explanation ]