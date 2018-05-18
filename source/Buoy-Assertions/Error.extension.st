Extension { #name : #Error }

{ #category : #'*Buoy-Assertions' }
Error >> failures [

	^ tag
]

{ #category : #'*Buoy-Assertions' }
Error class >> signal: aFailureExplanation [

	^ self new
		tag: {aFailureExplanation};
		signal: aFailureExplanation
]

{ #category : #'*Buoy-Assertions' }
Error class >> signalAll: failureExplanations [

	^ self new
		tag: failureExplanations;
		signal: ('. ' join: failureExplanations)
]
