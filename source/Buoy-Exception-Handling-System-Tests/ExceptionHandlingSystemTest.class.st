"
I'm a test case for the exception handling system.
"
Class {
	#name : #ExceptionHandlingSystemTest,
	#superclass : #TestCase,
	#category : #'Buoy-Exception-Handling-System-Tests'
}

{ #category : #private }
ExceptionHandlingSystemTest >> doANonLocalReturnAddingOneElementInTheIfCurtailedBlockTo: aCollection [

	[ ^ 1 ]
		ifCurtailed: [ aCollection add: 2 ].
	self fail
]

{ #category : #private }
ExceptionHandlingSystemTest >> handleZeroDivideAndReturnWithCaret [

	| result |

	result := [ 1 / 0.
	0
	]
		on: ZeroDivide
		do: [ :exception | ^ 3 ].

	^ result + 1
]

{ #category : #'tests - exception sets' }
ExceptionHandlingSystemTest >> testCatchingSetsOfExceptions [

	| result |

	result := [ 1 / 0 + Warning signal ]
		on: Warning , ZeroDivide
		do: [ :ex | ex resume: 1 ].
		
	self assert: result equals: 2
]

{ #category : #'tests - exception sets' }
ExceptionHandlingSystemTest >> testCatchingSetsOfExceptionsWithHierarchy [

	| result |

	result := [ 1 / 0 + Warning signal ]
		on: Notification , Error
		do: [ :ex | ex resume: 1 ].
		
	self assert: result equals: 2
]

{ #category : #'tests - ensure' }
ExceptionHandlingSystemTest >> testEnsureSemanticsWhenExceptionRaised [

	| ensureWasExecuted |

	ensureWasExecuted := false.

	self
		should: [ [ 1 / 0 ]
				ensure: [ ensureWasExecuted := true ]
			]
		raise: ZeroDivide.

	self assert: ensureWasExecuted
]

{ #category : #'tests - ensure' }
ExceptionHandlingSystemTest >> testEnsureSemanticsWhenNoException [

	| ensureWasExecuted |

	ensureWasExecuted := false.

	[ 1 ]
		ensure: [ ensureWasExecuted := true ].

	self assert: ensureWasExecuted
]

{ #category : #'tests - exception sets' }
ExceptionHandlingSystemTest >> testExceptionSetsConcatenation [

	| result |

	result := [ 1 / 0 + Warning signal ]
		on: Warning , ZeroDivide , ( MessageNotUnderstood , Error )
		do: [ :ex | ex resume: 1 ].

	self assert: result equals: 2.

	result := [ 1 / 0 + Warning signal ]
		on: MessageNotUnderstood , Error , ( Warning , ZeroDivide )
		do: [ :ex | ex resume: 1 ].

	self assert: result equals: 2
]

{ #category : #'tests - exception sets' }
ExceptionHandlingSystemTest >> testExceptionSetsConcatenationHandling [

	| set |

	set := Warning , ZeroDivide , ( MessageNotUnderstood , Error ).
	self
		assert: ( set handles: Warning new );
		assert: ( set handles: ZeroDivide new );
		assert: ( set handles: MessageNotUnderstood new );
		assert: ( set handles: Error new )
]

{ #category : #tests }
ExceptionHandlingSystemTest >> testHandles [

	self
		assert: ( Warning handles: Warning new );
		assert: ( Notification handles: Warning new );
		deny: ( Error handles: Warning new ).

	self
		assert: ( Warning , Error handles: Warning new );
		assert: ( Notification , Error handles: Warning new );
		assert: ( Notification , Error , Warning handles: ZeroDivide new )
]

{ #category : #'tests - ifCurtailed' }
ExceptionHandlingSystemTest >> testIfCurtailedSemanticsWhenExceptionRaised [

	| ifCurtailedWasExecuted |

	ifCurtailedWasExecuted := false.

	self
		should: [ [ 1 / 0 ]
				ifCurtailed: [ ifCurtailedWasExecuted := true ]
			]
		raise: ZeroDivide.

	self assert: ifCurtailedWasExecuted
]

{ #category : #'tests - ifCurtailed' }
ExceptionHandlingSystemTest >> testIfCurtailedSemanticsWhenNoExceptionRaised [

	[ 1 ]
		ifCurtailed: [ self fail ]
]

{ #category : #'tests - ifCurtailed' }
ExceptionHandlingSystemTest >> testIfCurtailedSemanticsWhenNonLocalReturn [

	| result |

	result := OrderedCollection new.
	self doANonLocalReturnAddingOneElementInTheIfCurtailedBlockTo: result.
	self assert: result size equals: 1
]

{ #category : #'tests - nested handlers' }
ExceptionHandlingSystemTest >> testNestedHandlers [

	| wasHandled wasHandledInTheSecondLevel |

	wasHandled := false.
	wasHandledInTheSecondLevel := false.

	[ [ 1 / 0 ]
		on: ZeroDivide
		do: [ :exception | 
			wasHandled := true.
			exception signal
			]
	]
		on: Error
		do: [ :exception | 
			wasHandledInTheSecondLevel := true.
			exception return
			].

	self
		assert: wasHandled;
		assert: wasHandledInTheSecondLevel
]

{ #category : #'tests - nested handlers' }
ExceptionHandlingSystemTest >> testNestedHandlersWhenFirstNotApplies [

	| wasHandled wasHandledInTheSecondLevel |

	wasHandled := false.
	wasHandledInTheSecondLevel := false.

	[ [ 1 / 0 ]
		on: Notification
		do: [ :exception | 
			wasHandled := true.
			exception signal
			]
	]
		on: Error
		do: [ :exception | 
			wasHandledInTheSecondLevel := true.
			exception return
			].

	self
		deny: wasHandled;
		assert: wasHandledInTheSecondLevel
]

{ #category : #'tests - on do' }
ExceptionHandlingSystemTest >> testOnDoSemanticsWhenRaisingAnotherException [

	| wasHandled |

	wasHandled := false.

	self
		should: [ [ 1 / 0 ]
				on: ZeroDivide
				do: [ :exception | 
					wasHandled := true.
					Notification signal: 'Ouch!'
					]
			]
		raise: Notification.

	self assert: wasHandled
]

{ #category : #'tests - on do' }
ExceptionHandlingSystemTest >> testOnDoSemanticsWhenRaisingAnotherExceptionAndReturn [

	| wasHandled result |

	wasHandled := false.
	result := [ [ 1 / 0 ]
		on: ZeroDivide
		do: [ :exception | 
			wasHandled := true.
			Notification signal: 'Ouch!'
			]
	]
		on: Notification
		do: [ :notification | notification return: 3 ].
	self
		assert: wasHandled;
		assert: result equals: 3
]

{ #category : #'tests - on do' }
ExceptionHandlingSystemTest >> testOnDoSemanticsWithResume [

	| wasHandled result |

	wasHandled := false.
	result := [ self assert: ( Warning signal: 'A' ) isNil.
	2
	]
		on: Warning
		do: [ :exception | 
			wasHandled := true.
			exception resume
			].
	self
		assert: wasHandled;
		assert: result equals: 2
]

{ #category : #'tests - on do' }
ExceptionHandlingSystemTest >> testOnDoSemanticsWithResumeValue [

	| wasHandled result |

	wasHandled := false.
	result := [ self assert: ( Warning signal: 'A' ) equals: 3.
	2
	]
		on: Warning
		do: [ :exception | 
			wasHandled := true.
			exception resume: 3
			].
	self
		assert: wasHandled;
		assert: result equals: 2
]

{ #category : #'tests - on do' }
ExceptionHandlingSystemTest >> testOnDoSemanticsWithRetry [

	| wasHandled result theMeaningOfLife |

	wasHandled := false.
	theMeaningOfLife := nil.
	result := [ theMeaningOfLife * 7 ]
		on: MessageNotUnderstood
		do: [ :ex | 
			wasHandled := true.
			theMeaningOfLife := 6.
			ex retry
			].
	self
		assert: wasHandled;
		assert: result equals: 42
]

{ #category : #'tests - on do' }
ExceptionHandlingSystemTest >> testOnDoSemanticsWithReturn [

	| wasHandled result |

	wasHandled := false.

	result := [ 1 / 0.
	2
	]
		on: ZeroDivide
		do: [ :exception | 
			wasHandled := true.
			exception return
			].

	self
		assert: wasHandled;
		assert: result isNil
]

{ #category : #'tests - on do' }
ExceptionHandlingSystemTest >> testOnDoSemanticsWithReturnValue [

	| wasHandled result |

	wasHandled := false.
	result := [ 1 / 0.
	2
	]
		on: ZeroDivide
		do: [ :exception | 
			wasHandled := true.
			exception return: 3
			].
	self
		assert: wasHandled;
		assert: result equals: 3
]

{ #category : #'tests - on do' }
ExceptionHandlingSystemTest >> testOnDoSemanticsWithReturnValueAndExit [

	self assert: self handleZeroDivideAndReturnWithCaret equals: 3
]

{ #category : #'tests - on do' }
ExceptionHandlingSystemTest >> testOnDoSemanticsWithSignal [

	| wasHandled |

	wasHandled := false.

	self
		should: [ [ Error signal: 'A' ]
				on: Error
				do: [ :exception | 
					wasHandled := true.
					exception signal
					]
			]
		raise: Error.

	self assert: wasHandled
]

{ #category : #'tests - on do' }
ExceptionHandlingSystemTest >> testOnDoSemanticsWithoutReturn [

	| wasHandled result |

	wasHandled := false.
	result := [ 1 / 0.
	2
	]
		on: ZeroDivide
		do: [ :exception | 
			wasHandled := true.
			3
			].
	self
		assert: wasHandled;
		assert: result equals: 3
]

{ #category : #'tests - on do' }
ExceptionHandlingSystemTest >> testOnDoSemanticsWithoutReturnAndPass [

	| wasHandled wasHandledAgain |

	wasHandled := false.
	wasHandledAgain := false.
	[ [ Warning signal: 'A' ]
		on: Warning
		do: [ :exception | 
			wasHandled := true.
			exception pass
			]
	]
		on: Notification
		do: [ :exception | 
			wasHandledAgain := true.
			exception return
			].

	self
		assert: wasHandled;
		assert: wasHandledAgain
]

{ #category : #'tests - on do extensions' }
ExceptionHandlingSystemTest >> testOnExceptDo [

	| wasHandled result |

	wasHandled := false.
	result := 2.
	self
		should: [ [ 1 / 0.
			2
			]
				on: Error
				except: ZeroDivide
				do: [ :exception | 
					wasHandled := true.
					exception return
					]
			]
		raise: ZeroDivide.

	self
		deny: wasHandled;
		assert: result equals: 2
]

{ #category : #'tests - on do extensions' }
ExceptionHandlingSystemTest >> testOnExceptDoHandling [

	| wasHandled result |

	wasHandled := false.

	result := [ 1 / 0.
	2
	]
		on: Error
		except: MessageNotUnderstood
		do: [ :exception | 
			wasHandled := true.
			exception return
			].

	self
		assert: wasHandled;
		assert: result isNil
]

{ #category : #'tests - on do extensions' }
ExceptionHandlingSystemTest >> testOnExceptDoHandlingWithExceptionSets [

	| wasHandled result |

	wasHandled := false.

	result := [ 1 / 0.
	2
	]
		on: Error
		except: MessageNotUnderstood , Warning
		do: [ :exception | 
			wasHandled := true.
			exception return
			].

	self
		assert: wasHandled;
		assert: result isNil
]

{ #category : #'tests - on do extensions' }
ExceptionHandlingSystemTest >> testOnExceptDoWithExceptionSets [

	| wasHandled result |

	wasHandled := false.
	result := 2.
	self
		should: [ [ 1 / 0.
			2
			]
				on: Error
				except: Warning , ZeroDivide
				do: [ :exception | 
					wasHandled := true.
					exception return
					]
			]
		raise: ZeroDivide.

	self
		deny: wasHandled;
		assert: result equals: 2
]
