Extension { #name : #Integer }

{ #category : #'*Buoy-Math' }
Integer >> adaptToInteger: anInteger andSend: selector [

	^ self perform: selector with: anInteger
]
