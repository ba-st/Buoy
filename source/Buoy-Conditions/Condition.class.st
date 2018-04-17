"
I'm a Condition.
I'm an abstract class.

I test if a provided value is valid against me.

"
Class {
	#name : #Condition,
	#superclass : #Object,
	#category : 'Buoy-Conditions'
}

{ #category : #composing }
Condition >> and: aCondition [

	^ CompositeCondition satisfying: self and: aCondition
]

{ #category : #testing }
Condition >> isSatisfiedBy: aValue [
	
	self subclassResponsibility 
]

{ #category : #negating }
Condition >> negated [
	
	^ NegatedCondition with: self.
]

{ #category : #composing }
Condition >> or: aCondition [

	^ CompositeCondition satisfying: self or: aCondition
]
