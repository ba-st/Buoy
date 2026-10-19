Extension { #name : 'ScaledDecimal' }

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
ScaledDecimal >> exactQuotientByPowerOfTen: aPowerOfTen [
  "Dividing a ScaledDecimal rounds the quotient to the receiver's scale: answer it with the scale widened only as much as needed to keep it exact"

  | quotient exactScale |
  quotient := self asFraction / aPowerOfTen.
  exactScale := self scale.
  [ ( quotient * ( 10 raisedTo: exactScale ) ) isInteger ] whileFalse: [
      exactScale := exactScale + 1 ].
  ^ ScaledDecimal for: quotient scale: exactScale
]
