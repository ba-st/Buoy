Extension { #name : #Duration }

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration class >> days: aNumber [

	^ self seconds: aNumber * 86400
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration class >> hours: aNumber [

	^ self seconds: aNumber * 3600
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration class >> milliSeconds: aNumber [

	^ self seconds: aNumber / 1000
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Duration >> wait [

	^ Delay waitForMilliseconds: self seconds * 1000
]
