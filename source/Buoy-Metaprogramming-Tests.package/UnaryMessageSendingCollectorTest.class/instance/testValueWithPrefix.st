tests-evaluating
testValueWithPrefix

	(UnaryMessageSendingCollector sendingAllMessagesBeginningWith: 'zzzTest' to: self) value.

	self
		assert: messagesSent size equals: 2;
		assert: (messagesSent includes: #zzzTest);
		assert: (messagesSent includes: #zzzTest2)