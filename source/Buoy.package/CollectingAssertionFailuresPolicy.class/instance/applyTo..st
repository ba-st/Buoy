applying
applyTo: anAsserter

	super applyTo: anAsserter.
	failures ifNotEmpty: [ errorClass signalAll: failures ]