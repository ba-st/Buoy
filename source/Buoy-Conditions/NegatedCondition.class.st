"
I'm a Condition.
I'm a NegatedCondition

I test the opposite of the condition I was created with.

Example:
(ArithmeticCondition toBeEqualTo: 1) negated.

Behaves like:
(ArithmeticCondition toBeDifferentTo: 1)

"
Class {
	#name : #NegatedCondition,
	#superclass : #Condition,
	#instVars : [
		'condition'
	],
	#category : 'Buoy-Conditions'
}

{ #category : #'instance creation' }
NegatedCondition class >> with: aCondition [

	^ self new initializeWith: aCondition 
]

{ #category : #'initialize-release' }
NegatedCondition >> initializeWith: aCondition [

	condition := aCondition
]

{ #category : #testing }
NegatedCondition >> isSatisfiedBy: aValue [
	
	^ (condition isSatisfiedBy: aValue) not
]
