"
I'm a namespace, my responsibility is to bind a set of symbols to objects of various kinds, so that these objects may be referred to by name.
"
Class {
	#name : #Namespace,
	#superclass : #Object,
	#instVars : [
		'bindings'
	],
	#category : #'Buoy-Metaprogramming'
}

{ #category : #accessing }
Namespace >> >> aName [

	^ self at: aName
]

{ #category : #accessing }
Namespace >> at: aName [

	^ self at: aName ifAbsent: [ self signalNotFoundFor: aName ]
]

{ #category : #accessing }
Namespace >> at: aName ifAbsent: aBlock [

	^ bindings at: aName ifAbsent: aBlock
]

{ #category : #binding }
Namespace >> bind: aSymbol to: anObject [

	bindings
		at: aSymbol
		ifPresent: [ ConflictingObjectFound signal: ('<1s> is already bound to some object.' expandMacrosWith: aSymbol) ]
		ifAbsentPut: anObject
]

{ #category : #initialization }
Namespace >> initialize [

	super initialize.
	bindings := IdentityDictionary new
]

{ #category : #accessing }
Namespace >> names [

	^ bindings keys
]

{ #category : #binding }
Namespace >> rebind: aSymbol to: anObject [

	bindings at: aSymbol put: anObject
]

{ #category : #binding }
Namespace >> removeBindingFor: aSymbol [

	^ bindings removeKey: aSymbol ifAbsent: [ self signalNotFoundFor: aSymbol ]
]

{ #category : #'private - signaling' }
Namespace >> signalNotFoundFor: aName [

	^ ObjectNotFound signal: ('There''s no object bound to <1s>' expandMacrosWith: aName)
]
