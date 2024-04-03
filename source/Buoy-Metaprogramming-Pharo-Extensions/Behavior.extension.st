Extension { #name : 'Behavior' }

{ #category : '*Buoy-Metaprogramming-Pharo-Extensions' }
Behavior >> allLeafSubclasses [

	| leafs |

	leafs := OrderedCollection new.
	self allSubclassesDo: [ :class | class subclasses ifEmpty: [ leafs add: class ] ].
	^ leafs
]

{ #category : '*Buoy-Metaprogramming-Pharo-Extensions' }
Behavior >> makeInstancesDbTransient [
	"In GS64 instances of classes that are DbTransient can be committed — that is, there is no error if they are committed — 
	but their instance variables are not written to disk.

	These properties are written later by our version of the TonelWriterV3"

	self propertyAt: #gs_options put: #( 'dbTransient' )
]

{ #category : '*Buoy-Metaprogramming-Pharo-Extensions' }
Behavior >> makeInstancesInvariant [
	"In GS64 instances of this class will be made invariant as soon as they are committed.

	These properties are written later by our version of the TonelWriterV3"

	self propertyAt: #gs_options put: #( 'instancesInvariant' )
]

{ #category : '*Buoy-Metaprogramming-Pharo-Extensions' }
Behavior >> makeInstancesNonPersistent [
	"In GS64 instances of this class cannot be committed, so you cannot include references to
	instances of non-persistent classes within a persistent data structure.

	These properties are written later by our version of the TonelWriterV3"

	self propertyAt: #gs_options put: #( 'instancesNonPersistent' )
]
