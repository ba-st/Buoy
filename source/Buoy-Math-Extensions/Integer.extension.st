Extension { #name : #Integer }

{ #category : #'*Buoy-Math-Extensions' }
Integer >> adaptToInteger: anInteger andSend: selector [

	^ self perform: selector with: anInteger
]
