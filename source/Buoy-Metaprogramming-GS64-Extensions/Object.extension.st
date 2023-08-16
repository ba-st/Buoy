Extension { #name : #Object }

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
Object >> assert: aBlock [

	aBlock value == true ifFalse: [
		AssertionFailed signal: 'Assertion failed' ]
]

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
Object class >> new [

	^ super new initialize
]
