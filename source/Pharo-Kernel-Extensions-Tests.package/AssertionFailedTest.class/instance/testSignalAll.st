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
				assert: exception failures size equals: 2;
				assert: exception failures first equals: firstExplanation;
				assert: exception failures last equals: secondExplanation ]