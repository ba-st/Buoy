"
I'm a rounding mode choosing the integer in a fixed direction, depending only on the sign of the number:

- ceil, toward positive infinity
- floor, toward negative infinity
- expand, away from zero
- truncate, toward zero
"
Class {
	#name : 'DirectedRoundingMode',
	#superclass : 'RoundingMode',
	#instVars : [
		'awayFromZeroForPositives',
		'awayFromZeroForNegatives'
	],
	#category : 'Buoy-Math',
	#package : 'Buoy-Math'
}

{ #category : 'instance creation' }
DirectedRoundingMode class >> awayFromZeroForPositives: aBoolean andNegatives: anotherBoolean [

  ^ self new initializeAwayFromZeroForPositives: aBoolean andNegatives: anotherBoolean
]

{ #category : 'initialization' }
DirectedRoundingMode >> initializeAwayFromZeroForPositives: aBoolean andNegatives: anotherBoolean [

  awayFromZeroForPositives := aBoolean.
  awayFromZeroForNegatives := anotherBoolean
]

{ #category : 'private' }
DirectedRoundingMode >> shouldRound: aNumber awayFromZeroFrom: truncated leaving: remainder [

  ^ aNumber strictlyPositive
      ifTrue: [ awayFromZeroForPositives ]
      ifFalse: [ awayFromZeroForNegatives ]
]
