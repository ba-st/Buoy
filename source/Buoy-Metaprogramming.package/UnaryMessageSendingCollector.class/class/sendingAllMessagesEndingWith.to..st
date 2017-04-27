Instance Creation
sendingAllMessagesEndingWith: aSuffix to: aReceiver

	^ self sendingAllMessagesMatching: [ :selector | selector endsWith: aSuffix ] to: aReceiver