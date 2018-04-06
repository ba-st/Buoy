Extension { #name : #Object }

{ #category : #'*Buoy-Metaprogramming' }
Object >> isA: aClass [

	^self isKindOf: aClass
]

{ #category : #'*Buoy-Metaprogramming' }
Object >> isAn: aClass [

	^self isA: aClass
]
