Instance Creation
sendingAllMessagesBeginningWith: aPrefix andEndingWith: aSuffix to: aReceiver with: anArgument

	^ self
		sendingAllMessagesMatching: [ :selector | (selector beginsWith: aPrefix) and: [ selector endsWith: aSuffix ] ]
		to: aReceiver
		withAll: {anArgument}