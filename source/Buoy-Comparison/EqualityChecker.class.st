"
I'm an abstract class defining the interface for equality checking. 
My intent is to provide a way of compare two objects.
"
Class {
	#name : #EqualityChecker,
	#superclass : #Object,
	#category : #'Buoy-Comparison'
}

{ #category : #testing }
EqualityChecker >> check: aBaseObject against: aTargetObject [

	^ self subclassResponsibility
]

{ #category : #testing }
EqualityChecker >> is: aBaseObject identicalTo: aTargetObject [

	^ aBaseObject == aTargetObject
]
