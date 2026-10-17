"
I'm an abstract class for rounding modes choosing the nearest integer. When the number is exactly halfway between two integers, my subclasses decide how to break the tie.
"
Class {
	#name : 'HalfRoundingMode',
	#superclass : 'RoundingMode',
	#category : 'Buoy-Math',
	#package : 'Buoy-Math'
}

{ #category : 'testing' }
HalfRoundingMode class >> isAbstract [

  ^ self = HalfRoundingMode
]

{ #category : 'private' }
HalfRoundingMode >> shouldRound: aNumber awayFromZeroFrom: truncated leaving: remainder [

  remainder = ( 1 / 2 ) ifTrue: [
      ^ self shouldRoundTie: aNumber awayFromZeroFrom: truncated leaving: remainder ].
  ^ remainder > ( 1 / 2 )
]

{ #category : 'private' }
HalfRoundingMode >> shouldRoundTie: aNumber awayFromZeroFrom: truncated leaving: remainder [
  "Answers whether aNumber, which is exactly halfway between truncated and the integer next to it going away from zero, rounds away from zero."

  ^ self subclassResponsibility
]
