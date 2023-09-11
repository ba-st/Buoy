Extension { #name : #Object }

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
Object >> assert: aBlock [

	self assert: aBlock description: 'Assertion failed'
]

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
Object >> assert: aBlock description: aBlockOrString [

	aBlock value == true ifFalse: [
		AssertionFailed signal: aBlockOrString value ]
]

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
Object >> isNotNil [

	^ self notNil
]

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
Object class >> new [

	^ super new initialize
]
