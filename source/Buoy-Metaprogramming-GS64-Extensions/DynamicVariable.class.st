Class {
	#name : #DynamicVariable,
	#superclass : #Object,
	#category : #'Buoy-Metaprogramming-GS64-Extensions'
}

{ #category : #accessing }
DynamicVariable class >> default [
	"Answer the default value for the variable. The default for the default value is nil."

	^ nil
]

{ #category : #testing }
DynamicVariable class >> isInheritable [

	^ false
]

{ #category : #accessing }
DynamicVariable class >> soleInstance [

	^ self
]

{ #category : #evaluating }
DynamicVariable class >> value [
	"Answer the current value for this variable in the current context."

	^ Processor activeProcess
		  environmentAt: self soleInstance
		  ifAbsent: [ self soleInstance default ]
]

{ #category : #evaluating }
DynamicVariable class >> value: anObject during: aBlock [

	| activeProcess oldValue |
	activeProcess := Processor activeProcess.
	oldValue := activeProcess
		            environmentAt: self soleInstance
		            ifAbsent: [ self soleInstance default ].
	^ [
	  activeProcess environmentAt: self put: anObject.
	  aBlock value ] ensure: [
		  activeProcess environmentAt: self soleInstance put: oldValue ]
]
