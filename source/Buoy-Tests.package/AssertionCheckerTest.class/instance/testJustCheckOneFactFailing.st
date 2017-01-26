tests
testJustCheckOneFactFailing

	| explanation |

	explanation := 'A false statement'.
	self should: [ AssertionChecker justCheck: [ false ] because: explanation ] raise: AssertionFailed withExceptionDo: [ :exception | self assert: exception messageText equals: explanation ]