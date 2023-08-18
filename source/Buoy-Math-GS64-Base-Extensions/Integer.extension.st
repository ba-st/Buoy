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
