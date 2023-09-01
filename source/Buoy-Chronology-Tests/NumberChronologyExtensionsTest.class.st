Class {
	#name : #NumberChronologyExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Chronology-Tests'
}

{ #category : #tests }
NumberChronologyExtensionsTest >> testDays [

	self
		assert: 1 day equals: (Duration days: 1);
		assert: 2 days equals: (Duration days: 2)
]

{ #category : #tests }
NumberChronologyExtensionsTest >> testHours [

	self
		assert: 1 hour equals: (Duration hours: 1);
		assert: 2 hours equals: (Duration hours: 2)
]

{ #category : #tests }
NumberChronologyExtensionsTest >> testMilliSeconds [

	self
		assert: 1000 milliSeconds equals: 1 second;
		assert: 2000 milliSeconds equals: 2 seconds
]

{ #category : #tests }
NumberChronologyExtensionsTest >> testSeconds [

	self
		assert: 1 second equals: (Duration seconds: 1);
		assert: 2 seconds equals: (Duration seconds: 2)
]
