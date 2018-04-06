"
I'm a Condition.
I'm an ArithmeticCondition

I test arithmetic operations ( =, ~=, <, <=, >, >= ) against a provided value.

Example:
ArithmeticCondition toBeEqualTo: 1.
"
Class {
	#name : #ArithmeticCondition,
	#superclass : #Condition,
	#instVars : [
		'value',
		'arithmeticOperator'
	],
	#category : 'Buoy-Conditions'
}

{ #category : #'private-instance creation' }
ArithmeticCondition class >> comparingAgainst: aValue using: anArithmeticOperator [

	^ self new initializeComparingAgainst: aValue using: anArithmeticOperator
]

{ #category : #'instance creation' }
ArithmeticCondition class >> toBeDifferentTo: aValue [

	^ self comparingAgainst: aValue using: #~=
]

{ #category : #'instance creation' }
ArithmeticCondition class >> toBeEqualTo: aValue [

	^ self comparingAgainst: aValue using: #=
]

{ #category : #'instance creation' }
ArithmeticCondition class >> toBeGreaterOrEqualThan: aValue [

	^ self comparingAgainst: aValue using: #>=
]

{ #category : #'instance creation' }
ArithmeticCondition class >> toBeGreaterThan: aValue [

	^ self comparingAgainst: aValue using: #>
]

{ #category : #'instance creation' }
ArithmeticCondition class >> toBeLessOrEqualThan: aValue [

	^ self comparingAgainst: aValue using: #<=
]

{ #category : #'instance creation' }
ArithmeticCondition class >> toBeLessThan: aValue [

	^ self comparingAgainst: aValue using: #<
]

{ #category : #'initialize-release' }
ArithmeticCondition >> initializeComparingAgainst: aValue using: anArithmeticOperator [

	value := aValue.
	arithmeticOperator := anArithmeticOperator
]

{ #category : #testing }
ArithmeticCondition >> isSatisfiedBy: aValue [

	^ aValue perform: arithmeticOperator with: value
]
