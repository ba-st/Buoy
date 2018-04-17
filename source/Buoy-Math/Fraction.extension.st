Extension { #name : #Fraction }

{ #category : #'*Buoy-Math' }
Fraction >> adaptToFraction: aFraction andSend: selector [

	^self perform: selector with: aFraction 
]
