tests
testRefuseOneFactNotFailing

	self
		shouldnt: [ AssertionChecker refuse: [ false ] because: [ self fail ] ] raise: AssertionFailed;
		shouldnt: [ AssertionChecker refuse: [ false ] because: [ self fail ] raising: InstanceCreationFailed ] raise: InstanceCreationFailed