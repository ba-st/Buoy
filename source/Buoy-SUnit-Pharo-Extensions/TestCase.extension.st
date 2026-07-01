Extension { #name : 'TestCase' }

{ #category : '*Buoy-SUnit-Pharo-Extensions' }
TestCase >> assert: actual equals: expected [

  "Equality must comply with the symmetric property: If one value equals a second value,
	then the second value equals the first.
	So we automatically assert both facts."

  super assert: actual equals: expected.
  super assert: expected equals: actual.
  "If the objects are not equal the previous statement will signal a failure exception,
	so we can assume that at this point the objects are equal; and in that case the hash
	of the objects must be also equal"
  self assert: actual hash = expected hash description: 'Hash of equal objects must be equal too'
]

{ #category : '*Buoy-SUnit-Pharo-Extensions' }
TestCase >> deny: actual equals: expected [
  "Inequality must comply with the symmetric property: If one value is distinct to a second value,
	then the second value is distinct to the first.
	So we automatically assert both facts."

  super deny: actual equals: expected.
  super deny: expected equals: actual
]

{ #category : '*Buoy-SUnit-Pharo-Extensions' }
TestCase >> runOnlyInGemStone64: aBlock [

]

{ #category : '*Buoy-SUnit-Pharo-Extensions' }
TestCase >> runOnlyInPharo: aBlock [

	aBlock value
]

{ #category : '*Buoy-SUnit-Pharo-Extensions' }
TestCase >> runOnlyInVAST: aBlock [

	
]
