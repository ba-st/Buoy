Extension { #name : #Object }

{ #category : #'*Buoy-Metaprogramming-Extensions' }
Object >> isA: aClass [

	^self isKindOf: aClass
]

{ #category : #'*Buoy-Metaprogramming-Extensions' }
Object >> isAn: aClass [

	^self isA: aClass
]
