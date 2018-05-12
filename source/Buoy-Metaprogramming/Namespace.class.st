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

{ #category : #binding }
Namespace >> bind: aSymbol to: anObject [

	bindings at: aSymbol ifPresent: [ BindingAlreadyInUse signal: ('There''s already an object bound to <1s>' expandMacrosWith: aSymbol) ] ifAbsentPut: anObject
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
