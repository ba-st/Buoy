evaluating
value

	^ self matchingSelectorsCollect: [ :selector | receiver perform: selector ]