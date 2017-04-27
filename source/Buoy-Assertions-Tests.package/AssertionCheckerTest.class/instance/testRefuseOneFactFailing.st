tests
testRefuseOneFactFailing

	| explanation |

	explanation := 'A false statement'.
	self should: [ AssertionChecker refuse: [ true ] because: explanation ] raise: AssertionFailed withExceptionDo: [ :exception | self assert: exception messageText equals: explanation ]