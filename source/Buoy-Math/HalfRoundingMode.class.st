"
I'm a rounding mode choosing the nearest integer. When the number is exactly halfway between two integers, I break the tie with a directed rounding mode:

- half-ceil breaks ties toward positive infinity
- half-floor breaks ties toward negative infinity
- half-expand breaks ties away from zero
- half-truncate breaks ties toward zero
"
Class {
	#name : 'HalfRoundingMode',
	#superclass : 'RoundingMode',
	#instVars : [
		'tieBreakingMode'
	],
	#category : 'Buoy-Math',
	#package : 'Buoy-Math'
}

{ #category : 'instance creation' }
HalfRoundingMode class >> breakingTiesWith: aRoundingMode [

  ^ self new initializeBreakingTiesWith: aRoundingMode
]

{ #category : 'initialization' }
HalfRoundingMode >> initializeBreakingTiesWith: aRoundingMode [

  tieBreakingMode := aRoundingMode
]

{ #category : 'private' }
HalfRoundingMode >> shouldRound: aNumber awayFromZeroFrom: truncated leaving: remainder [

  remainder = ( 1 / 2 ) ifTrue: [
      ^ self shouldRoundTie: aNumber awayFromZeroFrom: truncated leaving: remainder ].
  ^ remainder > ( 1 / 2 )
]

{ #category : 'private' }
HalfRoundingMode >> shouldRoundTie: aNumber awayFromZeroFrom: truncated leaving: remainder [

  ^ tieBreakingMode shouldRound: aNumber awayFromZeroFrom: truncated leaving: remainder
]
