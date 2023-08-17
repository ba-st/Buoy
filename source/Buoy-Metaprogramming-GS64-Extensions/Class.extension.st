Extension { #name : #Class }

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
Class >> allLeafSubclasses [

	| leafs |
	leafs := OrderedCollection new.
	(ClassOrganizer new allSubclassesOf: self) do: [ :class |
		class subclasses ifEmpty: [ leafs add: class ] ].
	^ leafs
]

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
Class >> subclassesDo: aBlock [
	"Evaluate the argument, aBlock, for each of the receiver's immediate subclasses."

	self subclasses do: aBlock
]
