Extension { #name : #LookupError }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
LookupError class >> signalFor: key [

	^ self new
		  key: key;
		  signal: ('Key <1p> not found.' expandMacrosWith: key)
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
LookupError class >> signalFor: key in: collection [

	^ self new
		  key: key;
		  signal: ('Key <1p> not found in <2p>.'
				   expandMacrosWith: key
				   with: collection class)
]
