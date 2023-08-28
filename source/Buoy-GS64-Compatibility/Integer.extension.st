Extension { #name : #Integer }

{ #category : #'*Buoy-GS64-Compatibility' }
Integer class >> fromStream: aStream [

	^ (NumberParser on: aStream)
		  nextIntegerBase: 10
		  ifFail: [ ImproperOperation signal ]
]

{ #category : #'*Buoy-GS64-Compatibility' }
Integer class >> fromString: aString [

	^ (NumberParser on: aString)
		  nextIntegerBase: 10
		  ifFail: [ ImproperOperation signal ]
]
