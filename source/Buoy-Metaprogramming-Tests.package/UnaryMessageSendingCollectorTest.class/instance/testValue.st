tests-evaluating
testValue

	(UnaryMessageSendingCollector sendingAllMessagesBeginningWith: 'zzzTest' andEndingWith: 'Test' to: self) value.

	self
		assert: messagesSent size equals: 1;
		assert: (messagesSent includes: #zzzTest)