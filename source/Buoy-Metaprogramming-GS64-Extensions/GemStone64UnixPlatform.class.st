Class {
	#name : #GemStone64UnixPlatform,
	#superclass : #Object,
	#classInstVars : [
		'Current'
	],
	#category : #'Buoy-Metaprogramming-GS64-Extensions'
}

{ #category : #accessing }
GemStone64UnixPlatform class >> current [

	^ Current
]

{ #category : #'class initialization' }
GemStone64UnixPlatform class >> initialize [

	Current := self new
]

{ #category : #accessing }
GemStone64UnixPlatform >> environmentAt: aVariableName ifPresent: aBlock ifAbsent: anAbsentBlock [

	^ (System gemEnvironmentVariable: aVariableName)
		  ifNil: anAbsentBlock
		  ifNotNil: [ :variableValue | aBlock value: variableValue ]
]

{ #category : #accessing }
GemStone64UnixPlatform >> environmentAt: variableName put: value [

	^ System gemEnvironmentVariable: variableName put: value
]

{ #category : #accessing }
GemStone64UnixPlatform >> lineEnding [

	^ String lf
]

{ #category : #accessing }
GemStone64UnixPlatform >> removeEnvironmentKey: variableName [

	^ self environmentAt: variableName put: ''
]
