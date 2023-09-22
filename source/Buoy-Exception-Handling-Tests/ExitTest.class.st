Class {
	#name : #ExitTest,
	#superclass : #TestCase,
	#category : #'Buoy-Exception-Handling-Tests'
}

{ #category : #tests }
ExitTest >> testFailure [

	self
		should: [ Exit signalFailure ]
		raise: Exit
		withExceptionDo: [ :error | self deny: error isSuccess ];
		should: [ Exit signalFailure: 'Bye bye' ]
		raise: Exit
		withExceptionDo: [ :error |
			self
				deny: error isSuccess;
				assert: error messageText equals: 'Bye bye' ]
]

{ #category : #tests }
ExitTest >> testSuccess [

	self
		should: [ Exit signalSuccess ]
		raise: Exit
		withExceptionDo: [ :error | self assert: error isSuccess ];
		should: [ Exit signalSuccess: 'Bye bye' ]
		raise: Exit
		withExceptionDo: [ :error |
			self
				assert: error isSuccess;
				assert: error messageText equals: 'Bye bye' ]
]
