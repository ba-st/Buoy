Class {
	#name : #DynamicVariableForTesting,
	#superclass : #DynamicVariable,
	#category : #'Buoy-Metaprogramming-Tests'
}

{ #category : #accessing }
DynamicVariableForTesting class >> default [

	^ 3
]

{ #category : #accessing }
DynamicVariableForTesting >> default [

	^ self class default
]
