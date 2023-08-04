Extension { #name : #Collection }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> anyOne [

	"Answer a representative sample of the receiver. It raises an error when the collection is empty. This method can be helpful when needing to preinfer the nature of the contents of semi-homogeneous collections."

	"#(10 20 30) anyOne >>> 10"
	"'hello' anyOne >>> $h"
	"(50 to: 10 by: -5) anyOne >>> 50"

	"
	([#() anyOne] on: SubscriptOutOfBounds do: [ :ex | 'whatever' ]) >>> 'whatever'
	"

	self emptyCheck.
	self do: [ :each | ^ each ]
]
