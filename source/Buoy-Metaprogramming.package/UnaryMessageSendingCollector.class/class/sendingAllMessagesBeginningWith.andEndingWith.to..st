Instance Creation
sendingAllMessagesBeginningWith: aPrefix andEndingWith: aSuffix to: aReceiver

	^ self sendingAllMessagesMatching: [ :selector | (selector beginsWith: aPrefix) and: [ selector endsWith: aSuffix ] ] to: aReceiver