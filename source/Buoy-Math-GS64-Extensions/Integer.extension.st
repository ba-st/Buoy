Extension { #name : #Integer }

{ #category : #'*Buoy-Math-GS64-Extensions' }
Integer >> hashMultiply [
	"No need to do something special in GS64"

	^ self
]

{ #category : #'*Buoy-Math-GS64-Extensions' }
Integer >> isInteger [
	"True for all subclasses of Integer."

	^ true
]
