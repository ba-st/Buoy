Extension { #name : #Delay }

{ #category : #'*Buoy-Chronology-Pharo-Extensions' }
Delay class >> waitForMilliseconds: aNumber [

	^ (self forMilliseconds: aNumber) wait
]
