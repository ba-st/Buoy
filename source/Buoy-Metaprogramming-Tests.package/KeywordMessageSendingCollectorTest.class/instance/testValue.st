tests-evaluating
testValue

	(KeywordMessageSendingCollector sendingAllMessagesBeginningWith: 'zzzTest' andEndingWith: 'Add:' to: self with: 1) value.

	self
		assert: arguments size equals: 1;
		assert: (arguments includes: 1)