Class {
	#name : #DateExtensionsTest,
	#superclass : #TestCase,
	#category : 'Buoy-Chronology-Tests'
}

{ #category : #tests }
DateExtensionsTest >> testAsDateAndTime [

	| date dateAndTime |
	date := Date newDay: 5 monthNumber: 4 year: 2023.
	dateAndTime := date asDateAndTime.

	self
		assert: date year equals: dateAndTime year;
		assert: date monthIndex equals: dateAndTime monthIndex;
		assert: date dayOfMonth equals: dateAndTime dayOfMonth;
		assert: dateAndTime hour isZero;
		assert: dateAndTime minute isZero;
		assert: dateAndTime second isZero
]

{ #category : #tests }
DateExtensionsTest >> testCreation [

	| date |
	date := Date newDay: 5 monthNumber: 4 year: 2023.

	self assert: date yyyymmdd equals: '2023-04-05'
]
