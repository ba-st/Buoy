tests-Combining
testForEveryInjectIntoWhenEmpty

	| combinedOptional |

	combinedOptional := Optional forEvery: #() injectInto: [ :min :current | self fail ].

	self assert: (combinedOptional withContentDo: [ :x | self fail ] ifUnused: [ 0 ]) isZero