Extension { #name : 'ExitClientError' }

{ #category : '*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError classSide >> failure [

	^ self status: 1
]

{ #category : '*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError >> isSuccess [

	^ self status = 0
]

{ #category : '*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError classSide >> signalFailure [

	^ self failure signal
]

{ #category : '*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError classSide >> signalFailure: aMessage [

	^ self failure signal: aMessage
]

{ #category : '*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError classSide >> signalSuccess [ 

	^ self success signal
]

{ #category : '*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError classSide >> signalSuccess: aMessage [

	^ self success signal: aMessage
]

{ #category : '*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError classSide >> status: status [

	^ self new
		  _resumable: true;
		  status: status;
		  yourself
]

{ #category : '*Buoy-Exception-Handling-GS64-Extensions' }
ExitClientError classSide >> success [ 

	^ self status: 0
]
