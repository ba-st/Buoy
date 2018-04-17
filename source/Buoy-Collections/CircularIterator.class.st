"
I'm a circular iterator allowing to cycle between a number of options.

Implementation Notes:
	To ease the rollover I keep the current index in a zero-based fashion to use module arithmetics to perform the rollover.
"
Class {
	#name : #CircularIterator,
	#superclass : #Object,
	#instVars : [
		'options',
		'currentIndex'
	],
	#category : 'Buoy-Collections'
}

{ #category : #'Instance Creation' }
CircularIterator class >> cyclingOver: aSequentiableCollection [

	AssertionChecker
		enforce: [ aSequentiableCollection notEmpty ]
		because: 'It makes no sense to iterate in a cyclic way an empty collection'
		raising: InstanceCreationFailed.
		
	^ self new initializeCyclingOver: aSequentiableCollection asArray
]

{ #category : #accessing }
CircularIterator >> current [

	^options at: currentIndex + 1
]

{ #category : #Testing }
CircularIterator >> includes: anObject [

	^options includes: anObject  
]

{ #category : #initialization }
CircularIterator >> initializeCyclingOver: anArray [

	options := anArray.
	self reset
]

{ #category : #iterating }
CircularIterator >> next [

	currentIndex := (currentIndex + 1) \\ options size.
	^self current 
]

{ #category : #iterating }
CircularIterator >> reset [

	currentIndex := 0
]
