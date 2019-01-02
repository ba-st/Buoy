Extension { #name : #Behavior }

{ #category : #'*Buoy-Metaprogramming' }
Behavior >> allLeafSubclasses [

	| leafs |

	leafs := OrderedCollection new.
	self
		allSubclassesDo: [ :class | 
			class subclasses isEmpty
				ifTrue: [ leafs add: class ]
			].
	^ leafs
]
