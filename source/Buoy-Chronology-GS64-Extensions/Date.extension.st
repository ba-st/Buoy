Extension { #name : 'Date' }

{ #category : '*Buoy-Chronology-GS64-Extensions' }
Date >> asDateAndTime [

	^ DateAndTime year: self year month: self monthIndex day: self dayOfMonth
]

{ #category : '*Buoy-Chronology-GS64-Extensions' }
Date class >> year: year month: month day: day [

	^ self newDay: day monthNumber: month year: year
]

{ #category : '*Buoy-Chronology-GS64-Extensions' }
Date >> yyyymmdd [
	"Format the date in ISO 8601 standard like '2002-10-22'
	The result is of fixed size 10 characters long."

	^ self asStringUsingFormat: #( 3 2 1 $- 1 1 2 $: false )
]
