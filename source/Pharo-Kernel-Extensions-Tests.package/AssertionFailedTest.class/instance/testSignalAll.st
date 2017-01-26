tests-Accessing
testSignalAll

	| firstExplanation secondExplanation |

	firstExplanation := 'Testing failures'.
	secondExplanation := 'More failures'.
	self
		should: [ AssertionFailed
				signalAll:
					{firstExplanation.
					secondExplanation} ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText equals: ('<1s>. <2s>' expandMacrosWith: firstExplanation with: secondExplanation);
				assertCollection: exception failures
					hasSameElements:
					{firstExplanation.
					secondExplanation} ]