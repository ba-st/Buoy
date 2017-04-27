tests-evaluating
testValueWithSuffix

	(UnaryMessageSendingCollector sendingAllMessagesEndingWith: 'Test2' to: self) value.

	self
		assert: messagesSent size equals: 2;
		assert: (messagesSent includes: #zzzTest2);
		assert: (messagesSent includes: #zzTest2)