Class {
	#name : #DateAndTimeExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Chronology-Tests'
}

{ #category : #tests }
DateAndTimeExtensionsTest >> testPrintHMS [

	| dateAndTime |
	dateAndTime := DateAndTime
		               year: 2023
		               month: 2
		               day: 1
		               hour: 4
		               minute: 6
		               second: 1.

	self
		assert: (String streamContents: [ :s | dateAndTime printHMSOn: s ])
		equals: '04:06:01'
]

{ #category : #tests }
DateAndTimeExtensionsTest >> testPrintYMD [

	| dateAndTime |
	dateAndTime := DateAndTime
		               year: 2023
		               month: 2
		               day: 1
		               hour: 4
		               minute: 6
		               second: 1.

	self
		assert: (String streamContents: [ :s | dateAndTime printYMDOn: s ])
		equals: '2023-02-01'
]
