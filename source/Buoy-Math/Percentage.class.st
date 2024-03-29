"
A percentage is a number or ratio expressed as a fraction of 100. It is often denoted using the percent sign, ""%"".  A percentage is a dimensionless number 
"
Class {
	#name : #Percentage,
	#superclass : #PartsPerFraction,
	#classInstVars : [
		'zeroPercent',
		'oneHundredPercent'
	],
	#category : #'Buoy-Math'
}

{ #category : #private }
Percentage class >> fraction [

	^ 100
]

{ #category : #initialization }
Percentage class >> initialize [
	<ignoreForCoverage>
	oneHundredPercent := self ratio: 1.
	zeroPercent := self ratio: 0
]

{ #category : #'Instance Creation' }
Percentage class >> oneHundred [

	^ oneHundredPercent
]

{ #category : #'Instance Creation' }
Percentage class >> zero [
	
	^zeroPercent 
]

{ #category : #testing }
Percentage >> isPercentage [

	^true
]

{ #category : #testing }
Percentage >> isWellKnown [

	^ #( 0 1 ) includes: ratio
]

{ #category : #printing }
Percentage >> storeOn: aStream [

	ratio isZero ifTrue: [
		^ aStream
			  nextPutAll: self class name asString;
			  space;
			  nextPutAll: 'zero' ].
	ratio = 1 ifTrue: [
		^ aStream
			  nextPutAll: self class name asString;
			  space;
			  nextPutAll: 'oneHundred' ].
	self storeValueOn: aStream.
	aStream
		space;
		nextPutAll: 'percent'
]
