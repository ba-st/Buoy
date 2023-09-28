Extension { #name : #ExitClientError }

{ #category : #'*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError class >> failure [

	^ self status: 1
]

{ #category : #'*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError >> isSuccess [

	^ self status = 0
]

{ #category : #'*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError class >> signalFailure [

	^ self failure signal
]

{ #category : #'*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError class >> signalFailure: aMessage [

	^ self failure signal: aMessage
]

{ #category : #'*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError class >> signalSuccess [ 

	^ self success signal
]

{ #category : #'*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError class >> signalSuccess: aMessage [

	^ self success signal: aMessage
]

{ #category : #'*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError class >> status: status [

	^ self new
		  _resumable: true;
		  status: status;
		  yourself
]

{ #category : #'*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError class >> success [ 

	^ self status: 0
]
