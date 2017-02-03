tests
testEnforceOneFactNotFailing

	self
		shouldnt: [ AssertionChecker enforce: [ true ] because: [ self fail ] ] raise: AssertionFailed;
		shouldnt: [ AssertionChecker enforce: [ true ] because: [ self fail ] raising: InstanceCreationFailed ] raise: InstanceCreationFailed