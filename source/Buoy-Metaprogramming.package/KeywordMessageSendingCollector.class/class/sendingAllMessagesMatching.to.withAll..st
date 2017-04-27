Instance Creation
sendingAllMessagesMatching: aFilterBlock to: aReceiver withAll: anArgumentCollection

	^ self new
		initializeSendingAllMessagesMatching: [ :selector | selector argumentCount = anArgumentCollection size and: [ aFilterBlock value: selector ] ]
		to: aReceiver
		withAll: anArgumentCollection asArray