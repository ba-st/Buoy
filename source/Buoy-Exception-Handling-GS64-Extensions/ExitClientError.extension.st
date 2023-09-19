Extension { #name : #ExitClientError }

{ #category : #'*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError class >> signalFailure [

	^ self signal: '' status: 1
]

{ #category : #'*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError class >> signalSuccess [ 

	^ self signal: '' status: 0
]
