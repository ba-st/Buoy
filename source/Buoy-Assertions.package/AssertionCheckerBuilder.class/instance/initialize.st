initialization
initialize

	super initialize.
	asserter := Asserter new.
	self raising: AssertionFailurePolicy defaultErrorToSignal.
	failurePolicyFactory := CollectingAssertionFailuresPolicy