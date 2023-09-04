Extension { #name : #Character }

{ #category : #'*Buoy-Collections-Pharo-Extensions' }
Character class >> esc [
	"Answer the ASCII ESC character"

	^self value: 27
]
