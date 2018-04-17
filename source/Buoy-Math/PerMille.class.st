"
A per mille is a number or ratio expressed as a fraction of 1000. It is often denoted using the per mille sign, ""‰"".  A per mille is a dimensionless number 
"
Class {
	#name : #PerMille,
	#superclass : #PartsPerFraction,
	#category : 'Buoy-Math'
}

{ #category : #private }
PerMille class >> fraction [

	^ 1000
]

{ #category : #printing }
PerMille >> printOn: aStream base: anInteger [

	self value printOn: aStream base: anInteger.
	aStream nextPut: $‰
]

{ #category : #printing }
PerMille >> storeOn: aStream [

	self value storeOn: aStream.
	aStream
		space;
		nextPutAll: 'perMille'
]
