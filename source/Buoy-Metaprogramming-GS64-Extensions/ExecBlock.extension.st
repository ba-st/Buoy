Extension { #name : #ExecBlock }

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
ExecBlock >> argumentNames [

	^ self argsAndTemps copyFirst: self numArgs
]
