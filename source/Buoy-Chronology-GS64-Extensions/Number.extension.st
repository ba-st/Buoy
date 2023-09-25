Extension { #name : #Number }

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Number >> asDuration [

 	^ Duration seconds: self asInteger
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Number >> second [
	"1 second printString >>> '0:00:00:01'"
	"(1 minute + 1 second) printString >>> '0:00:01:01'"

 	^ self seconds
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Number >> seconds [

	^ Duration seconds: self
]
