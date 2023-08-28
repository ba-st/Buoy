Extension { #name : #Date }

{ #category : #'*Buoy-GS64-Compatibility' }
Date >> asStringUsingFormat: format [

	^ self printFormat: format
]

{ #category : #'*Buoy-GS64-Compatibility' }
Date class >> newDay: day month: month year: year [

	^ self starting: (DateAndTime year: year month: month day: day)
]
