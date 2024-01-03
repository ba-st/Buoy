"
Unit test for Test Asserter
"
Class {
	#name : 'TestAsserterBuoyExtensionsTest',
	#superclass : 'TestCase',
	#category : 'Buoy-SUnit-Tests',
	#package : 'Buoy-SUnit-Tests'
}

{ #category : 'tests' }
TestAsserterBuoyExtensionsTest >> testAssertIncludes [

	| asserter |

	asserter := TestAsserter new.
	self shouldnt: [ asserter assert: #(1) includes: 1 ] raise: TestFailure.
	self should: [ asserter assert: #() includes: 1 ] raise: TestFailure.
	self should: [ asserter assert: #(1 2) includes: 3 ] raise: TestFailure
]

{ #category : 'tests' }
TestAsserterBuoyExtensionsTest >> testAssertionFailedInRaiseWithExceptionDo [

	| asserter |

	asserter := TestAsserter new.
	self should: [ asserter should: [ Error signal ] raise: Error withExceptionDo: [ :aSignal | asserter fail ] ] raise: TestFailure
]

{ #category : 'tests' }
TestAsserterBuoyExtensionsTest >> testDenyIncludes [

	| asserter |

	asserter := TestAsserter new.
	self should: [ asserter deny: #(1) includes: 1 ] raise: TestFailure.
	self shouldnt: [ asserter deny: #() includes: 1 ] raise: TestFailure.
	self shouldnt: [ asserter deny: #(1 2) includes: 3 ] raise: TestFailure
]

{ #category : 'tests' }
TestAsserterBuoyExtensionsTest >> testDifferentExceptionInShouldRaiseWithExceptionDo [

	| asserter |

	asserter := TestAsserter new.
	self should: [ asserter should: [ Exception signal ] raise: Error withExceptionDo: [ :aSignal | asserter fail ] ] raise: Exception
]

{ #category : 'tests' }
TestAsserterBuoyExtensionsTest >> testErrorInRaiseWithExceptionDo [

	| asserter |
	asserter := TestAsserter new.
	self
		should:
			[asserter
				should: [Error signal]
				raise: Error
				withExceptionDo: [:aSignal | Error signal: 'A forced error']]
		raise: Error
]

{ #category : 'tests' }
TestAsserterBuoyExtensionsTest >> testFail [

	| asserter |
	asserter := TestAsserter new.
	self
		should: [asserter fail]
		raise: TestFailure
]

{ #category : 'tests' }
TestAsserterBuoyExtensionsTest >> testNoExceptionInShouldRaiseWithExceptionDo [

	| asserter |
	asserter := TestAsserter new.
	self
		should:
			[asserter
				should: []
				raise: Error
				withExceptionDo: [:aSignal | Error signal: 'Should not get here']]
		raise: TestFailure
]

{ #category : 'tests' }
TestAsserterBuoyExtensionsTest >> testShouldNotTakeMoreThanMilliseconds [

	| asserter |

	asserter := TestAsserter new.
	self shouldnt: [ asserter should: [  ] notTakeMoreThanMilliseconds: 500 ] raise: TestFailure.
	self
		should: [ asserter should: [ ( Delay forMilliseconds: 51 ) wait ] notTakeMoreThanMilliseconds: 50 ]
		raise: TestFailure
]

{ #category : 'tests' }
TestAsserterBuoyExtensionsTest >> testShouldRaiseWithExceptionDoTest [

	| asserter |
	asserter := TestAsserter new.
	asserter
		should:
			[Error new
				tag: 1;
				signal]
		raise: Error
		withExceptionDo: [:error | asserter assert: error tag = 1]
]

{ #category : 'tests' }
TestAsserterBuoyExtensionsTest >> testShouldRaiseWithMessageText [

	| asserter |
	asserter := TestAsserter new.
	self
		shouldnt:
			[asserter
				should: [Error signal: 'Error']
				raise: Error
				withMessageText: 'Error']
		raise: TestFailure.
	self
		should:
			[asserter
				should: [Error signal: 'Error']
				raise: Error
				withMessageText: 'Error2']
		raise: TestFailure
]

{ #category : 'tests' }
TestAsserterBuoyExtensionsTest >> testWithTheOnlyOneInDo [

	| asserter |

	asserter := TestAsserter new.

	self
		should: [ asserter withTheOnlyOneIn: #() do: [ :theOne |  ] ] raise: TestFailure;
		should: [ asserter withTheOnlyOneIn: #(1 2) do: [ :theOne |  ] ] raise: TestFailure;
		should: [ asserter withTheOnlyOneIn: #(1) do: [ :theOne | self assert: theOne equals: 2 ] ] raise: TestFailure;
		shouldnt: [ asserter withTheOnlyOneIn: #(1) do: [ :theOne | self assert: theOne equals: 1 ] ] raise: TestFailure
]
