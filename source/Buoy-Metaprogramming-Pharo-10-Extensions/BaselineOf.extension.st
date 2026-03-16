Extension { #name : 'BaselineOf' }

{ #category : '*Buoy-Metaprogramming-Pharo-10-Extensions' }
BaselineOf >> classNamed: aSymbol [

	^ self class environment at: aSymbol asSymbol
]

{ #category : '*Buoy-Metaprogramming-Pharo-10-Extensions' }
BaselineOf >> classNamed: aSymbol ifPresent: aBlock [

	^ self class environment at: aSymbol asSymbol ifPresent: aBlock
]

{ #category : '*Buoy-Metaprogramming-Pharo-10-Extensions' }
BaselineOf >> classNamed: aSymbol ifPresent: aBlock ifAbsent: absentBlock [

	^ self class environment at: aSymbol asSymbol ifPresent: aBlock ifAbsent: absentBlock
]
