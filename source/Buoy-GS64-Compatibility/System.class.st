"
In GS64, System is an abstract class that has no instances.  It implements class
methods for object locking and for operations that are usually found in
traditional operating systems.  The data curator may restrict user access to
these messages.

This version is just a placeholder so we can easily create extensions methods to load in GS64 specific
packages.
"
Class {
	#name : 'System',
	#superclass : 'Object',
	#category : 'Buoy-GS64-Compatibility',
	#package : 'Buoy-GS64-Compatibility'
}

{ #category : 'accessing' }
System class >> commandLineArguments [

	| arguments documentPath |
	arguments := OrderedCollection withAll: Smalltalk arguments.
	documentPath := Smalltalk vm documentPath.
	documentPath isEmptyOrNil ifFalse: [
		arguments addFirst: documentPath ].
	^ arguments
]

{ #category : 'accessing' }
System class >> timeGmt [

	^ Time millisecondClockValue
]
