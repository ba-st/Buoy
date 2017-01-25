initialization
initialize

	super initialize.
	asserter := Asserter new.
	failurePolicyFactory := CollectingAssertionFailuresPolicy