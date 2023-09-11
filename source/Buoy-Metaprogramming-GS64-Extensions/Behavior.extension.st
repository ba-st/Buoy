Extension { #name : #Behavior }

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
Behavior >> >> selector [
	"Answer the compiled method associated with the argument, selector (a
	Symbol), a message selector in the receiver's method dictionary. If the
	selector is not in the dictionary, create an error notification."

	^self compiledMethodAt: selector
]
