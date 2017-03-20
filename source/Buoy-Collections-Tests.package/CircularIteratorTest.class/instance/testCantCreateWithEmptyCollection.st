tests-accessing
testCantCreateWithEmptyCollection

	self
		should: [ CircularIterator cyclingOver: #() ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :error | self assert: error messageText equals: 'It makes no sense to iterate in a cyclic way an empty collection' ]