"
An OptionalTest is a test class for testing the behavior of Optional
"
Class {
	#name : #OptionalTest,
	#superclass : #TestCase,
	#category : 'Buoy-Dynamic-Binding-Tests'
}

{ #category : #'tests-Printing' }
OptionalTest >> testPrintingUnusedOptional [

	self assert: (Optional unusedBecause: 'This feature is disabled.') printString equals: 'This feature is disabled.'
]

{ #category : #'tests-Printing' }
OptionalTest >> testPrintingUsedOptional [

	self assert: (Optional containing: 1) printString equals: '1'
]

{ #category : #'tests-Combining' }
OptionalTest >> testReturn [

	((Optional containing: 0) return: [ :number | number + 1 ]) withContentDo: [ :number | self assert: number equals: 1 ] ifUnused: [ self fail ].

	(Optional unused return: [ :number | number + 1 ]) withContentDo: [ self fail ]
]

{ #category : #'tests-Combining' }
OptionalTest >> testWhenAllUsedInInjectInto [

	| firstOptional secondOptional thirdOptional combinedOptional |

	firstOptional := Optional containing: 1.
	secondOptional := Optional containing: 0.
	thirdOptional := Optional containing: 3.

	combinedOptional := Optional
		whenAllUsedIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :min :current | min min: current ].

	combinedOptional withContentDo: [ :min | self assert: min equals: 0 ] ifUnused: [ self fail ].

	combinedOptional := Optional
		whenAllUsedIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :sum :current | sum + current ].

	combinedOptional withContentDo: [ :sum | self assert: sum equals: 4 ] ifUnused: [ self fail ]
]

{ #category : #'tests-Combining' }
OptionalTest >> testWhenAllUsedInInjectIntoWhenEmpty [

	| combinedOptional |

	combinedOptional := Optional whenAllUsedIn: #() injectInto: [ :min :current | self fail ].

	self assert: (combinedOptional withContentDo: [ :x | self fail ] ifUnused: [ 0 ]) isZero
]

{ #category : #'tests-Combining' }
OptionalTest >> testWhenAllUsedInInjectIntoWhenFirstUnused [

	| firstOptional secondOptional thirdOptional combinedOptional |

	firstOptional := Optional unused.
	secondOptional := Optional containing: 1.
	thirdOptional := Optional containing: 3.

	combinedOptional := Optional
		whenAllUsedIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :min :current | min min: current ].

	self assert: (combinedOptional withContentDo: [ :min | self fail ] ifUnused: [ 0 ]) isZero
]

{ #category : #'tests-Combining' }
OptionalTest >> testWhenAllUsedInInjectIntoWhenSomeUnused [

	| firstOptional secondOptional thirdOptional combinedOptional |

	firstOptional := Optional containing: 1.
	secondOptional := Optional unused.
	thirdOptional := Optional containing: 3.

	combinedOptional := Optional
		whenAllUsedIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :min :current | min min: current ].

	self assert: (combinedOptional withContentDo: [ :min | self fail ] ifUnused: [ 0 ]) isZero
]

{ #category : #'tests-Combining' }
OptionalTest >> testWhenAllUsedInReturn [

	| firstOptional secondOptional thirdOptional combinedOptional result |

	firstOptional := Optional containing: 0.
	secondOptional := Optional containing: 2.
	thirdOptional := Optional containing: 3.

	combinedOptional := firstOptional
		whenAllUsedIn:
			{secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 5.

	combinedOptional := Optional
		whenAllUsedIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 5
]

{ #category : #'tests-Combining' }
OptionalTest >> testWhenAllUsedInReturnWhenEmpty [

	| combinedOptional |

	combinedOptional := Optional whenAllUsedIn: #() return: [ :addends | addends sum ].

	combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ :explanations | self assert: explanations isEmpty ]
]

{ #category : #'tests-Combining' }
OptionalTest >> testWhenAllUsedInReturnWhenFirstIsUnused [

	| firstOptional secondOptional thirdOptional combinedOptional |

	firstOptional := Optional unusedBecause: 'This is expected.'.
	secondOptional := Optional unusedBecause: 'This is also expected.'.
	thirdOptional := Optional containing: 3.

	combinedOptional := firstOptional
		whenAllUsedIn:
			{secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ :explanations | self assert: explanations equals: #('This is expected.' 'This is also expected.') ].

	combinedOptional := Optional
		whenAllUsedIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].
		
	combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ :explanations | self assert: explanations equals: #('This is expected.' 'This is also expected.') ]
]

{ #category : #'tests-Combining' }
OptionalTest >> testWhenAllUsedInReturnWhenSomeAreUnused [

	| firstOptional secondOptional thirdOptional combinedOptional |

	firstOptional := Optional containing: 0.
	secondOptional := Optional unused.
	thirdOptional := Optional containing: 3.

	combinedOptional := firstOptional
		whenAllUsedIn:
			{secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ :explanations | self assert: explanations isEmpty ].

	combinedOptional := Optional
		whenAllUsedIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ :explanations | self assert: explanations isEmpty ]
]

{ #category : #'tests-Accessing' }
OptionalTest >> testWithContentDo [

	| optional expectedContent content |

	expectedContent := 2.
	content := 1.
	
	optional := Optional containing: expectedContent.

	optional withContentDo: [ :theContent | content := theContent ].

	self assert: content equals: expectedContent
]

{ #category : #'tests-Accessing' }
OptionalTest >> testWithContentDoIfUnused [

	| optional expectedContent content |

	expectedContent := 2.

	optional := Optional containing: expectedContent.

	content := optional withContentDo: [ :theContent | theContent ] ifUnused: [ self fail ].

	self assert: content equals: expectedContent
]

{ #category : #'tests-Accessing' }
OptionalTest >> testWithContentDoIfUnusedWhenUnused [

	| optional defaultContent content expectedExplanation |

	defaultContent := 2.
	expectedExplanation := 'The identifier is not configured.'.
	optional := Optional unusedBecause: expectedExplanation.

	content := optional
		withContentDo: [ :theContent | self fail ]
		ifUnused: [ :explanations | 
			self assertCollection: explanations hasSameElements: {expectedExplanation}.
			defaultContent ].

	self assert: content equals: defaultContent
]

{ #category : #'tests-Accessing' }
OptionalTest >> testWithContentDoWhenUnused [

	| optional expectedExplanation |

	expectedExplanation := 'The identifier is unassigned'.

	optional := Optional unusedBecause: expectedExplanation.

	optional withContentDo: [ :theContent | self fail ]
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithUsedOnlyInInjectInto [

	| firstOptional secondOptional thirdOptional combinedOptional result |

	firstOptional := Optional containing: 1.
	secondOptional := Optional containing: 2.
	thirdOptional := Optional containing: 3.

	combinedOptional := Optional
		withUsedOnlyIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :sum :current | sum + current ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 6.

	combinedOptional := Optional
		withUsedOnlyIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :sum :current | sum + current ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 6
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithUsedOnlyInInjectIntoWhenEmpty [

	| combinedOptional |

	combinedOptional := Optional withUsedOnlyIn: #() injectInto: [ :min :current | self fail ].

	self assert: (combinedOptional withContentDo: [ :x | self fail ] ifUnused: [ 0 ]) isZero
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithUsedOnlyInInjectIntoWhenFirstUnused [

	| firstOptional secondOptional thirdOptional combinedOptional result |

	firstOptional := Optional unused.
	secondOptional := Optional containing: 1.
	thirdOptional := Optional containing: 3.

	combinedOptional := Optional
		withUsedOnlyIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :sum :current | sum + current ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 4
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithUsedOnlyInInjectIntoWhenSomeUnused [

	| firstOptional secondOptional thirdOptional combinedOptional result |

	firstOptional := Optional containing: 2.
	secondOptional := Optional unused.
	thirdOptional := Optional containing: 3.

	combinedOptional := Optional
		withUsedOnlyIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		injectInto: [ :sum :current | sum + current ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 5
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithUsedOnlyInReturn [

	| firstOptional secondOptional thirdOptional combinedOptional result |

	firstOptional := Optional containing: 0.
	secondOptional := Optional containing: 2.
	thirdOptional := Optional containing: 3.

	combinedOptional := firstOptional
		whenAllUsedIn:
			{secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 5.

	combinedOptional := Optional
		whenAllUsedIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 5
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithUsedOnlyInReturnWhenEmpty [

	| combinedOptional explanations |

	combinedOptional := Optional withUsedOnlyIn: #() return: [ :addends | addends sum ].

	explanations := 'something'.
	combinedOptional
		withContentDo: [ :sum | self fail ]
		ifUnused: [ :optionalExplanations | explanations := optionalExplanations ].
	self assert: explanations isEmpty
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithUsedOnlyInReturnWhenFirstIsUnused [

	| firstOptional secondOptional thirdOptional combinedOptional result |

	firstOptional := Optional unusedBecause: 'This is expected.'.
	secondOptional := Optional unusedBecause: 'This is also expected.'.
	thirdOptional := Optional containing: 3.

	combinedOptional := firstOptional
		withUsedOnlyIn:
			{secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	result := 0.
	combinedOptional
		withContentDo: [ :sum | result := sum ]
		ifUnused: [ :explanations | self fail ].
	self assert: result equals: 3.

	combinedOptional := Optional
		withUsedOnlyIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	result := 0.
	combinedOptional
		withContentDo: [ :sum | result := sum ]
		ifUnused: [ :explanations | self fail ].
	self assert: result equals: 3
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithUsedOnlyInReturnWhenSomeAreUnused [

	| firstOptional secondOptional thirdOptional combinedOptional result |

	firstOptional := Optional containing: 1.
	secondOptional := Optional unused.
	thirdOptional := Optional containing: 3.

	combinedOptional := firstOptional
		withUsedOnlyIn:
			{secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	result := 0.
	combinedOptional
		withContentDo: [ :sum | result := sum ]
		ifUnused: [ :explanations | self fail ].
	self assert: result equals: 4.

	combinedOptional := Optional
		withUsedOnlyIn:
			{firstOptional.
			secondOptional.
			thirdOptional}
		return: [ :addends | addends sum ].

	result := 0.
	combinedOptional
		withContentDo: [ :sum | result := sum ]
		ifUnused: [ :explanations | self fail ].
	self assert: result equals: 4
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithWhenAnyUsedReturn [

	| firstOptional secondOptional combinedOptional result |

	firstOptional := Optional containing: 1.
	secondOptional := Optional containing: 2.

	combinedOptional := firstOptional
		with: secondOptional
		whenAnyUsedReturn: [ :x :y | x + y ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 3
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithWhenAnyUsedReturnWhenBothAreUnused [

	| firstOptional secondOptional combinedOptional |

	firstOptional := Optional unused.
	secondOptional := Optional unused.

	combinedOptional := firstOptional with: secondOptional whenAnyUsedReturn: [ :x :y | self fail ].

	self
		assert:
			(combinedOptional
				withContentDo: [ :sum | self fail ]
				ifUnused: [ :explanations | 
					self assert: explanations isEmpty.
					0 ]) isZero
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithWhenAnyUsedReturnWhenFirstIsUnused [

	| firstOptional secondOptional combinedOptional result |

	firstOptional := Optional unused.
	secondOptional := Optional containing: 2.

	combinedOptional := firstOptional
		with: secondOptional
		whenAnyUsedReturn: [ :x :y | x + y ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 2
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithWhenAnyUsedReturnWhenSecondIsUnused [

	| firstOptional secondOptional combinedOptional result |

	firstOptional := Optional containing: 2.
	secondOptional := Optional unused.

	combinedOptional := firstOptional
		with: secondOptional
		whenAnyUsedReturn: [ :x :y | x + y ].

	result := 0.
	combinedOptional withContentDo: [ :sum | result := sum ] ifUnused: [ self fail ].
	self assert: result equals: 2
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithWhenBothUsedReturn [

	| firstOptional secondOptional combinedOptional |

	firstOptional := Optional containing: 1.
	secondOptional := Optional containing: 2.

	combinedOptional := firstOptional with: secondOptional whenBothUsedReturn: [ :x :y | x + y ].

	combinedOptional withContentDo: [ :sum | self assert: sum equals: 3 ] ifUnused: [ self fail ]
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithWhenBothUsedReturnWhenBothAreUnused [

	| firstOptional secondOptional combinedOptional |

	firstOptional := Optional unused.
	secondOptional := Optional unused.

	combinedOptional := firstOptional with: secondOptional whenBothUsedReturn: [ :x :y | self fail ].

	self
		assert:
			(combinedOptional
				withContentDo: [ :sum | self fail ]
				ifUnused: [ :explanations | 
					self assert: explanations isEmpty.
					0 ]) isZero
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithWhenBothUsedReturnWhenFirstIsUnused [

	| firstOptional secondOptional combinedOptional |

	firstOptional := Optional unused.
	secondOptional := Optional containing: 2.

	combinedOptional := firstOptional with: secondOptional whenBothUsedReturn: [ :x :y | self fail ].

	self assert: (combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ 0 ]) isZero
]

{ #category : #'tests-Combining' }
OptionalTest >> testWithWhenBothUsedReturnWhenSecondIsUnused [

	| firstOptional secondOptional combinedOptional |

	firstOptional := Optional containing: 2.
	secondOptional := Optional unused.

	combinedOptional := firstOptional with: secondOptional whenBothUsedReturn: [ :x :y | self fail ].

	self assert: (combinedOptional withContentDo: [ :sum | self fail ] ifUnused: [ 0 ]) isZero
]
