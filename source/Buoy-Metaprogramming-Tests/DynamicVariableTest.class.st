Class {
	#name : #DynamicVariableTest,
	#superclass : #TestCase,
	#category : #'Buoy-Metaprogramming-Tests'
}

{ #category : #tests }
DynamicVariableTest >> testDynamicVariableBlockReturnValue [

	| returnValue |
	returnValue := DynamicVariableForTesting
		               value: 10
		               during: [ DynamicVariableForTesting value + 1 ].
	self assert: returnValue equals: 11
]

{ #category : #tests }
DynamicVariableTest >> testDynamicVariableDefault [

	self
		assert: DynamicVariableForTesting default equals: 3;
		assert: DynamicVariableForTesting value equals: 3
]

{ #category : #tests }
DynamicVariableTest >> testDynamicVariableRemovedAfterUse [

	DynamicVariableForTesting value: 8 during: [  ].

	self
		assert: DynamicVariableForTesting default equals: 3;
		assert: DynamicVariableForTesting value equals: 3
]
