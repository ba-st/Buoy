tests
testEnforceOneFactFailing

	| explanation |

	explanation := 'A false statement'.
	self should: [ AssertionChecker enforce: [ false ] because: explanation ] raise: AssertionFailed withExceptionDo: [ :exception | self assert: exception messageText equals: explanation ]