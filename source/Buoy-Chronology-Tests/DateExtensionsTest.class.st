Class {
	#name : #DateExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Chronology-Tests'
}

{ #category : #tests }
DateExtensionsTest >> testCreation [

	| date |
	date := Date newDay: 5 monthNumber: 4 year: 2023.

	self assert: date yyyymmdd equals: '2023-04-05'
]
