Extension { #name : 'Integer' }

{ #category : '*Buoy-GS64-Compatibility' }
Integer >> asHexString [ 

	^ self printStringBase: 16
]

{ #category : '*Buoy-GS64-Compatibility' }
Integer >> asHexStringWithLength: minimum [

	^ String streamContents: [ :s |
		  self
			  printOn: s
			  base: 16
			  length: minimum
			  padded: true ]
]

{ #category : '*Buoy-GS64-Compatibility' }
Integer class >> fromStream: aStream [

	^ (NumberParser on: aStream)
		  nextIntegerBase: 10
		  ifFail: [ ImproperOperation signal ]
]

{ #category : '*Buoy-GS64-Compatibility' }
Integer class >> fromString: aString [

	^ (NumberParser on: aString)
		  nextIntegerBase: 10
		  ifFail: [ ImproperOperation signal ]
]
