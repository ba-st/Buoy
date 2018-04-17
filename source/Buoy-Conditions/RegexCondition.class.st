"
I'm a Condition.
I'm a RegexCondition

I test a regex pattern against a provided string.

Example:
RegexCondition matching: 'I...'

For more examples, besides the provided test, check Regular expressions framework documentation on Pharo help.
"
Class {
	#name : #RegexCondition,
	#superclass : #Condition,
	#instVars : [
		'pattern'
	],
	#category : 'Buoy-Conditions'
}

{ #category : #'instance creation' }
RegexCondition class >> matching: aPattern [

	^ self new initializeMatching: aPattern
]

{ #category : #initialization }
RegexCondition >> initializeMatching: aPattern [
	
	pattern := aPattern
]

{ #category : #testing }
RegexCondition >> isSatisfiedBy: aString [ 

	^ aString matchesRegex: pattern
]
