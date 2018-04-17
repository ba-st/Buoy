"
AsssertionFailed is the default exception signaled when AssertionChecker fails to verifiy at least a condition.
"
Class {
	#name : #AssertionFailed,
	#superclass : #Error,
	#category : 'Buoy-Assertions'
}

{ #category : #signaling }
AssertionFailed class >> signal: aFailureExplanation [

	^ self new
		tag: {aFailureExplanation};
		signal: aFailureExplanation
]

{ #category : #signaling }
AssertionFailed class >> signalAll: failureExplanations [

	^ self new
		tag: failureExplanations;
		signal: ('. ' join: failureExplanations)
]

{ #category : #Accessing }
AssertionFailed >> failures [
	
	^tag 
]
