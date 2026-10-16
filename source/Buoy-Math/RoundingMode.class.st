"
I'm an abstract class for rounding modes: strategies deciding to which integer a number rounds.

Every number that is not an integer lies between two integers: the one obtained truncating it, closer to zero, and the next one away from zero. My subclasses decide which one to choose.

Send me the messages in the `instance creation` category to get a concrete mode, and then `roundToInteger:` or `round:toFractionDigits:` to it. Rounding is exact when the number is exact, like integers, fractions and scaled decimals.
"
Class {
	#name : 'RoundingMode',
	#superclass : 'Object',
	#category : 'Buoy-Math',
	#package : 'Buoy-Math'
}

{ #category : 'instance creation' }
RoundingMode class >> ceil [

  ^ DirectedRoundingMode awayFromZeroForPositives: true andNegatives: false
]

{ #category : 'instance creation' }
RoundingMode class >> expand [

  ^ DirectedRoundingMode awayFromZeroForPositives: true andNegatives: true
]

{ #category : 'instance creation' }
RoundingMode class >> floor [

  ^ DirectedRoundingMode awayFromZeroForPositives: false andNegatives: true
]

{ #category : 'instance creation' }
RoundingMode class >> halfCeil [

  ^ HalfRoundingMode breakingTiesWith: self ceil
]

{ #category : 'instance creation' }
RoundingMode class >> halfEven [

  ^ HalfEvenRoundingMode new
]

{ #category : 'instance creation' }
RoundingMode class >> halfExpand [

  ^ HalfRoundingMode breakingTiesWith: self expand
]

{ #category : 'instance creation' }
RoundingMode class >> halfFloor [

  ^ HalfRoundingMode breakingTiesWith: self floor
]

{ #category : 'instance creation' }
RoundingMode class >> halfTruncate [

  ^ HalfRoundingMode breakingTiesWith: self truncate
]

{ #category : 'testing' }
RoundingMode class >> isAbstract [

  ^ self = RoundingMode
]

{ #category : 'instance creation' }
RoundingMode class >> truncate [

  ^ DirectedRoundingMode awayFromZeroForPositives: false andNegatives: false
]

{ #category : 'rounding' }
RoundingMode >> round: aNumber toFractionDigits: anInteger [

  | scale |
  scale := 10 raisedTo: anInteger.
  ^ ( self roundToInteger: aNumber * scale ) / scale
]

{ #category : 'rounding' }
RoundingMode >> roundToInteger: aNumber [

  | truncated remainder |
  truncated := aNumber truncated.
  remainder := aNumber - truncated.
  remainder isZero ifTrue: [ ^ truncated ].
  ^ ( self shouldRound: aNumber awayFromZeroFrom: truncated leaving: remainder abs )
      ifTrue: [ truncated + aNumber sign ]
      ifFalse: [ truncated ]
]

{ #category : 'private' }
RoundingMode >> shouldRound: aNumber awayFromZeroFrom: truncated leaving: remainder [
  "Answers whether aNumber, which is not an integer, rounds to the integer next to truncated going away from zero.
	remainder is the distance between aNumber and truncated, between 0 and 1 exclusive."

  ^ self subclassResponsibility
]
