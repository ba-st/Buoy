Class {
	#name : #DurationChronologyExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Chronology-Tests'
}

{ #category : #tests }
DurationChronologyExtensionsTest >> testIsZero [

	self
		assert: 0 seconds isZero;
		deny: 1 second isZero
]

{ #category : #tests }
DurationChronologyExtensionsTest >> testTotalSeconds [

	self assert: 0 seconds totalSeconds equals: 0.
	self assert: 1 second totalSeconds equals: 1.
	self assert: 100 second totalSeconds equals: 100.
	self assert: 500 milliSeconds totalSeconds equals: 1 / 2.
	self assert: 1500 milliSeconds totalSeconds equals: 3 / 2.
	self assert: 2500 milliSeconds totalSeconds equals: 5 / 2.
	self assert: 1 second negated totalSeconds equals: -1
]

{ #category : #tests }
DurationChronologyExtensionsTest >> testWait [

	| ms |

	ms := Time millisecondsToRun: [ 2.1 seconds wait ].
	self assert: ms >= 2100
]

{ #category : #tests }
DurationChronologyExtensionsTest >> testWholeSeconds [

	self
		assert: 1.002003004 seconds wholeMilliseconds equals: 2;
		assert: 1.002003004 seconds wholeMicroseconds equals: 3;
		assert: 1.002003004 seconds wholeNanoseconds equals: 4
]
