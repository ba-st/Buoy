Extension { #name : #GsNMethod }

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
GsNMethod >> argumentNames [

	^ self argsAndTemps copyFirst: self numArgs
]
