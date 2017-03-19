tests-Combining
testWithUsedOnlyInInjectIntoWhenEmpty

	| combinedOptional |

	combinedOptional := Optional withUsedOnlyIn: #() injectInto: [ :min :current | self fail ].

	self assert: (combinedOptional withContentDo: [ :x | self fail ] ifUnused: [ 0 ]) isZero