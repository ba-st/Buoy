initialization
initialize

	super initialize.
	asserter := Asserter new.
	errorClass := AssertionFailurePolicy defaultError.
	failurePolicyFactory := CollectingAssertionFailuresPolicy