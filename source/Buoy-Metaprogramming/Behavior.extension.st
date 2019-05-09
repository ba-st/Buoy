Extension { #name : #Behavior }

{ #category : #'*Buoy-Metaprogramming' }
Behavior >> allLeafSubclasses [

	| leafs |

	leafs := OrderedCollection new.
	self allSubclassesDo: [ :class | class subclasses ifEmpty: [ leafs add: class ] ].
	^ leafs
]
