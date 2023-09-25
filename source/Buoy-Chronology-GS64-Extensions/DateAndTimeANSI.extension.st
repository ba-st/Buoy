Extension { #name : #DateAndTimeANSI }

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
DateAndTimeANSI >> monthIndex [

	^ self month
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
DateAndTimeANSI >> printHMSOn: aStream [

	aStream
		nextPutAll: (self hour printStringLength: 2 padded: true);
		nextPut: $:;
		nextPutAll: (self minute printStringLength: 2 padded: true);
		nextPut: $:;
		nextPutAll: (self second asInteger printStringLength: 2 padded: true)
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
DateAndTimeANSI >> printYMDOn: aStream [

	aStream
		nextPutAll: (self year printStringLength: 4 padded: true);
		nextPut: $-;
		nextPutAll: (self monthIndex printStringLength: 2 padded: true);
		nextPut: $-;
		nextPutAll: (self dayOfMonth printStringLength: 2 padded: true)
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
DateAndTimeANSI class >> unixEpoch [

	^ self posixSeconds: 0 offset: Duration zero
]

{ #category : #'*Buoy-Chronology-GS64-Extensions' }
DateAndTimeANSI class >> year: year month: month day: day [
	"Return a DateAndTime, midnight local time"

	^ self
		  year: year
		  month: month
		  day: day
		  hour: 0
		  minute: 0
		  second: 0
]
