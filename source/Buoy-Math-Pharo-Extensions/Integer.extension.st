Extension { #name : 'Integer' }

{ #category : '*Buoy-Math-Pharo-Extensions' }
Integer >> asHexStringPaddedTo: minimum [

	^ String streamContents: [ :s |
		  self
			  printOn: s
			  base: 16
			  length: minimum
			  padded: true ]
]

{ #category : '*Buoy-Math-Pharo-Extensions' }
Integer class >> readFromHex: string ifFail: failBlock [

  ^ ( NumberParser on: string ) nextIntegerBase: 16 ifFail: failBlock
]
