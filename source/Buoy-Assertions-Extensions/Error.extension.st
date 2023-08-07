Extension { #name : #Error }

{ #category : #'*Buoy-Assertions-Extensions' }
Error >> failures [

	^ tag
]

{ #category : #'*Buoy-Assertions-Extensions' }
Error class >> signal: aFailureExplanation [

	^ self new
		tag: {aFailureExplanation};
		signal: aFailureExplanation
]

{ #category : #'*Buoy-Assertions-Extensions' }
Error class >> signalAll: failureExplanations [

	^ self new
		tag: failureExplanations;
		signal: ('. ' join: failureExplanations)
]
