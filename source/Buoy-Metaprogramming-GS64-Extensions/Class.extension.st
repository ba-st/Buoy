Extension { #name : #Class }

{ #category : #'*Buoy-Metaprogramming-GS64-Extensions' }
Class >> allLeafSubclasses [

	| leafs |
	leafs := OrderedCollection new.
	(ClassOrganizer new allSubclassesOf: self) do: [ :class |
		class subclasses ifEmpty: [ leafs add: class ] ].
	^ leafs
]
