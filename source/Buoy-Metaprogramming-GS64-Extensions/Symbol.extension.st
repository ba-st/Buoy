Extension { #name : #Symbol }

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
Symbol >> value: anObject [

	^ anObject perform: self
]
