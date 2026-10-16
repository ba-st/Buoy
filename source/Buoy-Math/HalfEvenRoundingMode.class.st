"
I'm a rounding mode choosing the nearest integer, breaking ties toward the even one. It's also known as banker's rounding, and avoids the bias of always breaking ties in the same direction when adding up rounded values.
"
Class {
	#name : 'HalfEvenRoundingMode',
	#superclass : 'HalfRoundingMode',
	#category : 'Buoy-Math',
	#package : 'Buoy-Math'
}

{ #category : 'private' }
HalfEvenRoundingMode >> shouldRoundTie: aNumber awayFromZeroFrom: truncated leaving: remainder [

  ^ truncated odd
]
