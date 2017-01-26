tests
testJustCheckOneFactNotFailing

	self shouldnt: [ AssertionChecker justCheck: [ true ] because: [ self fail ] ] raise: AssertionFailed