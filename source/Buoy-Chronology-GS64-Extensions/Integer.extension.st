Extension { #name : #Integer }

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Integer >> day [

 	^ self days
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Integer >> days [

 	^ Duration days: self
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Integer >> hour [

 	^ self hours
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Integer >> hours [

 	^ Duration hours: self
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Integer >> milliSecond [

	^ self milliSeconds
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Integer >> milliSeconds [

 	^ Duration milliSeconds: self
]
