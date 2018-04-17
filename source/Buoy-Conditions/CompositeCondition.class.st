"
I'm a Condition.
I'm a CompositeCondition

I test that the conditions involved are satisfied, either all or any depending on how I was created.

Example:
CompositeCondition
	satisfying: (ArithmeticCondition toBeGreaterOrEqualThan: 0)
	and: (ArithmeticCondition toBeLessOrEqualThan: 2).

"
Class {
	#name : #CompositeCondition,
	#superclass : #Condition,
	#instVars : [
		'conditions',
		'compositionPolicy'
	],
	#category : 'Buoy-Conditions'
}

{ #category : #'instance creation' }
CompositeCondition class >> satisfying: aCondition and: anotherCondition [

	^ self satisfyingAll: (Array with: aCondition with: anotherCondition)
]

{ #category : #'instance creation' }
CompositeCondition class >> satisfying: aCondition or: anotherCondition [

	^ self satisfyingAnyOf: (Array with: aCondition with: anotherCondition)
]

{ #category : #'instance creation' }
CompositeCondition class >> satisfyingAll: aConditionCollection [

	^ self toSatisfyAll: aConditionCollection using: #allSatisfy:
]

{ #category : #'instance creation' }
CompositeCondition class >> satisfyingAnyOf: aConditionCollection [

	^ self toSatisfyAll: aConditionCollection using: #anySatisfy:
]

{ #category : #'private-instance creation' }
CompositeCondition class >> toSatisfyAll: aConditionCollection using: aCompositionPolicy [

	^ self new
		initializeToSastifyAll: aConditionCollection
		using: aCompositionPolicy
]

{ #category : #'initialize-release' }
CompositeCondition >> initializeToSastifyAll: aConditionCollection using: aCompositionPolicy [

	compositionPolicy := aCompositionPolicy.
	conditions := aConditionCollection
]

{ #category : #testing }
CompositeCondition >> isSatisfiedBy: aValue [

	^ conditions perform: compositionPolicy with: [ :condition | condition isSatisfiedBy: aValue ]
]
