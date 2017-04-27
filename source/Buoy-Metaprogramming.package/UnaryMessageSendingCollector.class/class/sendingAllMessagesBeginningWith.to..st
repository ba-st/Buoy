Instance Creation
sendingAllMessagesBeginningWith: aPrefix to: aReceiver

	^ self sendingAllMessagesMatching: [ :selector | selector beginsWith: aPrefix ] to: aReceiver