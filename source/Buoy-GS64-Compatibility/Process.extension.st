Extension { #name : #Process }

{ #category : #'*Buoy-GS64-Compatibility' }
Process >> environmentAt: object ifAbsent: block [

	| index |
	index := Process allocatePSKey: object.
	^ (self psValueAt: index) ifNil: block
]

{ #category : #'*Buoy-GS64-Compatibility' }
Process >> environmentAt: object put: anotherObject [

	| index |
	index := Process allocatePSKey: object.
	^ self psValueAt: index put: anotherObject
]
