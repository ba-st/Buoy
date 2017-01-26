applying
applyTo: anAsserter

	super applyTo: anAsserter.
	failures ifNotEmpty: [ AssertionFailed signalAll: failures ]