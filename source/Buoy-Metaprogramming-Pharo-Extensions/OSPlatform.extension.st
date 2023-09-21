Extension { #name : #OSPlatform }

{ #category : #'*Buoy-Metaprogramming-Pharo-Extensions' }
OSPlatform >> environmentAt: aVariableName ifPresent: aBlock ifAbsent: anAbsentBlock [

	^ self environment
		  at: aVariableName
		  ifPresent: aBlock
		  ifAbsent: anAbsentBlock
]

{ #category : #'*Buoy-Metaprogramming-Pharo-Extensions' }
OSPlatform >> environmentAt: variableName put: value [

	self environment at: variableName put: value
]

{ #category : #'*Buoy-Metaprogramming-Pharo-Extensions' }
OSPlatform >> removeEnvironmentKey: variableName [

	self environment removeKey: variableName
]
