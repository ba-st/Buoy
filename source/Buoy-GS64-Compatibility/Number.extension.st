Extension { #name : 'Number' }

{ #category : '*Buoy-GS64-Compatibility' }
Number class >> fromStream: aStream [

	^ [ ( NumberParser on: aStream ) nextNumber ]
		  on: Error
		  do: [ :error | ImproperOperation signal ]
]
