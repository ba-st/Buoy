Extension { #name : #Integer }

{ #category : #'*Buoy-Math-Pharo-Extensions' }
Integer >> asHexStringPaddedTo: minimum [

	^ String streamContents: [ :s |
		  self
			  printOn: s
			  base: 16
			  length: minimum
			  padded: true ]
]
