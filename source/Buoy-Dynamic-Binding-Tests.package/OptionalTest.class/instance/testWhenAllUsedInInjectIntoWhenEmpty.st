tests-Combining
testWhenAllUsedInInjectIntoWhenEmpty

	| combinedOptional |

	combinedOptional := Optional whenAllUsedIn: #() injectInto: [ :min :current | self fail ].

	self assert: (combinedOptional withContentDo: [ :x | self fail ] ifUnused: [ 0 ]) isZero