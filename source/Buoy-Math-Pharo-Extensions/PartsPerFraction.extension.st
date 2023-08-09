Extension { #name : #PartsPerFraction }

{ #category : #'*Buoy-Math-Pharo-Extensions' }
PartsPerFraction >> adaptToFraction: aFraction andSend: selector [

	^ aFraction adaptToFraction: ratio andSend: selector
]

{ #category : #'*Buoy-Math-Pharo-Extensions' }
PartsPerFraction >> adaptToInteger: anInteger andSend: aSymbol [
	
	^anInteger adaptToInteger: ratio  andSend: aSymbol 
]

{ #category : #'*Buoy-Math-Pharo-Extensions' }
PartsPerFraction >> storeValueOn: aStream [

	self value storeOn: aStream
]
