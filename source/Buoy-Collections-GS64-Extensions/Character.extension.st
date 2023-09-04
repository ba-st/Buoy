Extension { #name : #Character }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Character class >> escape [
	"Answer the ASCII ESC character"

	^self esc
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Character class >> value: anInteger [

	^self withValue: anInteger 
]
