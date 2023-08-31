Extension { #name : #Time }

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Time class >> milliseconds: currentTime since: lastTime [
	"Answer the elapsed time since last recorded in milliseconds.
	Compensate for rollover."

	| delta |
	delta := currentTime - lastTime.
	^ delta < 0
		ifTrue: [SmallInteger maximumValue + delta]
		ifFalse: [delta]
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Time class >> millisecondsSince: lastTime [
 	"Answer the elapsed time since last recorded in milliseconds.
 	Compensate for rollover."

 	^self milliseconds: self millisecondClockValue since: lastTime
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Time class >> millisecondsToRun: timedBlock [

	^ self millisecondsElapsedTime: timedBlock
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
Time class >> totalSeconds [
	"Answer the total seconds ellapsed since the epoch: 1 January 1901 00:00 UTC"

	^ System timeGmt
]
