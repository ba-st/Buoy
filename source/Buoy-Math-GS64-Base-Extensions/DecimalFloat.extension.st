Extension { #name : 'DecimalFloat' }

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
DecimalFloat >> isFinite [

  ^ #( #normal #subnormal #zero ) includes: self kind
]

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
DecimalFloat >> isFloat [

  ^ true
]

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
DecimalFloat >> isInfinite [

  ^ self kind = #infinity
]

{ #category : '*Buoy-Math-GS64-Base-Extensions' }
DecimalFloat >> isNaN [

  ^ #( #quietNaN #signalingNaN ) includes: self kind
]
