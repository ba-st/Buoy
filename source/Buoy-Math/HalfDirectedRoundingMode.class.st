"
I'm a rounding mode choosing the nearest integer. When the number is exactly halfway between two integers, I break the tie with a directed rounding mode:

- half-ceil breaks ties toward positive infinity
- half-floor breaks ties toward negative infinity
- half-expand breaks ties away from zero
- half-truncate breaks ties toward zero
"
Class {
	#name : 'HalfDirectedRoundingMode',
	#superclass : 'HalfRoundingMode',
	#instVars : [
		'tieBreakingMode'
	],
	#category : 'Buoy-Math',
	#package : 'Buoy-Math'
}

{ #category : 'instance creation' }
HalfDirectedRoundingMode class >> breakingTiesWith: aDirectedRoundingMode [

  ^ self new initializeBreakingTiesWith: aDirectedRoundingMode
]

{ #category : 'initialization' }
HalfDirectedRoundingMode >> initializeBreakingTiesWith: aDirectedRoundingMode [

  tieBreakingMode := aDirectedRoundingMode
]

{ #category : 'private' }
HalfDirectedRoundingMode >> shouldRoundTie: aNumber awayFromZeroFrom: truncated leaving: remainder [

  ^ tieBreakingMode shouldRound: aNumber awayFromZeroFrom: truncated leaving: remainder
]
