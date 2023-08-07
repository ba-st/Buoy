Extension { #name : #Behavior }

{ #category : #'*Buoy-Metaprogramming-Pharo-Extensions' }
Behavior >> allLeafSubclasses [

	| leafs |

	leafs := OrderedCollection new.
	self allSubclassesDo: [ :class | class subclasses ifEmpty: [ leafs add: class ] ].
	^ leafs
]
