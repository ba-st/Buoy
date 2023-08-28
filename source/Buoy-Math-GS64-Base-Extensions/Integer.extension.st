Extension { #name : #Integer }

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Integer >> asHexStringPaddedTo: minimum [

	^ (self asHexStringWithLength: minimum) asUppercase
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Integer >> atRandom [

	self = 0 ifTrue: [ ^ 0 ].
	^ Random new integerBetween: 1 and: self abs
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Integer >> hashMultiply [
	"No need to do something special in GS64"

	^ self
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Integer >> isInteger [
	"True for all subclasses of Integer."

	^ true
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Integer >> printStringHex [

	^ self asHexString asUppercase
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Integer >> printStringLength: minimum padded: zeroFlag [

	| numberPrintString preffix |
	numberPrintString := self abs printString.
	preffix := self negative then: [ '-' ] otherwise: [ '' ].
	^ String streamContents: [ :stream |
		  | padLength |
		  padLength := minimum - numberPrintString size - preffix size.
		  stream nextPutAll: preffix.
		  padLength strictlyPositive then: [
			  | filler |
			  filler := zeroFlag
				            ifTrue: [ $0 ]
				            ifFalse: [ Character space ].
			  padLength timesRepeat: [ stream nextPut: filler ] ].
		  stream nextPutAll: numberPrintString ]
]

{ #category : #'*Buoy-Math-GS64-Base-Extensions' }
Integer class >> readFrom: aStringOrStream ifFail: aBlock [

	^ [
	  aStringOrStream isString
		  ifTrue: [ self fromString: aStringOrStream ]
		  ifFalse: [ self fromStream: aStringOrStream ] ]
		  on: ImproperOperation
		  do: [ :error | error return: aBlock value ]
]
