applying
applyTo: anAsserter

	super applyTo: anAsserter.
	failures isEmpty or: [ AssertionFailed signalAll: failures ]