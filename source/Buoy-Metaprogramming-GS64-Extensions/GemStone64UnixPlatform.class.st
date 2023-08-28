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
GemStone64UnixPlatform >> lineEnding [

	^ String lf
]
