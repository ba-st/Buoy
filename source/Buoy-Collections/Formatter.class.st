"
I'm an abstract class for formatters.

A formatter is an object that knows how to convert a given object into a string representation.
"
Class {
	#name : 'Formatter',
	#superclass : 'Object',
	#category : 'Buoy-Collections',
	#package : 'Buoy-Collections'
}

{ #category : 'testing' }
Formatter class >> isAbstract [

  ^ self = Formatter
]

{ #category : 'formatting' }
Formatter >> format: aCollection [

	^ String streamContents: [ :stream | self format: aCollection on: stream ]
]

{ #category : 'formatting' }
Formatter >> format: object on: stream [

  self subclassResponsibility
]
