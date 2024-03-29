Extension { #name : #Pragma }

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
Pragma >> methodSelector [
	"Answer the selector of the method containing the pragma.
	 Do not confuse this with the selector of the pragma's message pattern."

	^method selector
]
