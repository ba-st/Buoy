Extension { #name : #Fraction }

{ #category : #'*Buoy-Math-Extensions' }
Fraction >> adaptToFraction: aFraction andSend: selector [

	^self perform: selector with: aFraction 
]
