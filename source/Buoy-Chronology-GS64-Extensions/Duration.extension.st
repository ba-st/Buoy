Extension { #name : #Duration }

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration >> asMicroseconds [ 

	^ self asSeconds * 1000000
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration >> asMilliSeconds [

	^ self asSeconds * 1000
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration >> asNanoSeconds [

	^ self asSeconds * 1000000000
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration class >> days: aNumber [

	^ self seconds: aNumber * 86400
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration class >> hours: aNumber [

	^ self seconds: aNumber * 3600
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration >> isZero [

	^ self totalSeconds isZero
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration class >> milliSeconds: aNumber [

	^ self seconds: aNumber / 1000
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration class >> minutes: aNumber [

	^ self seconds: aNumber * 60
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration >> totalSeconds [
	
		^self asSeconds
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration >> wait [

	^ Delay waitForMilliseconds: (self seconds * 1000) rounded
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration >> wholeMicroseconds [

	^ (self asMicroseconds rem: 1000) truncated
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration >> wholeMilliseconds [

	^ (self asMilliSeconds rem: 1000) truncated
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration >> wholeNanoseconds [

	^ (self asNanoSeconds rem: 1000) truncated
]
