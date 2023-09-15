Extension { #name : #Collection }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> , aCollection [
	"Concatenate the receiver with the argument."

	^ self copy
		  addAll: aCollection;
		  yourself
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> anyOne [

	^ self any
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> as: aSimilarClass [
	"Create an object of class aSimilarClass that has similar contents to the receiver if the object is not already an instance of this class."

	aSimilarClass == self class ifTrue: [ ^ self ].

	^ aSimilarClass newFrom: self
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> associationsDo: aBlock [
	"Evaluate aBlock for each of the receiver's elements (key/value
	associations).  If any non-association is within, the error is not caught now,
	but later, when a key or value message is sent to it.
	The point of this method it to do the *right thing* on Dictionaries and related classes."

	self do: aBlock
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> capacity [

	^ self size
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> collect: aBlock as: aClass [
	"Evaluate aBlock with each of the receiver's elements as the argument.
	Collect the resulting values into an instance of aClass. Answer the resulting collection."

	^(aClass new: self size) fillFrom: self with: aBlock
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> count: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.
	Answer the number of elements that answered true."

	| sum |
	sum := 0.
	self do: [ :each | (aBlock value: each) ifTrue: [ sum := sum + 1 ] ].
	^ sum
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> detect: aBlock ifFound: foundBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.
	If some element evaluates aBlock to true, then cull this element into
	foundBlock.
	If no element matches the criteria then do nothing.
	Always returns self to avoid misuse and a potential isNil check on the sender."

	self
		detect: aBlock
		ifFound: foundBlock
		ifNone: [ "Do nothing on purpose" ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> detect: aBlock ifFound: foundBlock ifNone: exceptionBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.
	If some element evaluates aBlock to true, then cull this element into
	foundBlock and answer the result of this evaluation.
	If none evaluate to true, then evaluate exceptionBlock."

	self do: [ :each |
		(aBlock value: each) ifTrue: [ ^ foundBlock cull: each ] ].
	^ exceptionBlock value
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> fillFrom: aCollection with: aBlock [
	"Private.
	Evaluate aBlock with each of aCollections's elements as the argument.
	Collect the resulting values into self. Answer self."

	aCollection do: [ :each |
		self add: (aBlock value: each) ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> groupedBy: aBlock [
	"Answer a dictionary whose keys are the result of evaluating aBlock for all my elements, and the value for each key is the selection of my elements that evaluated to that key. Uses species."

	| groups |
	groups := OrderedDictionary new.
	self do: [ :each |
		(groups at: (aBlock value: each) ifAbsentPut: [ OrderedCollection new ]) add: each ].
	self species ~~ OrderedCollection ifTrue: [
		groups associationsDo: [ :association |
			association value: (self species withAll: association value) ]].
	^ groups
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> ifEmpty: emptyBlock ifNotEmpty: notEmptyBlock [

	^ self isEmpty
		  ifTrue: emptyBlock
		  ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> includesAll: aCollection [
	"Answer whether all the elements of aCollection are in the receiver."

	^ aCollection allSatisfy: [ :elem | self includes: elem ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> isNotEmpty [
	"Answer whether the receiver contains any elements."

	^ self isEmpty not
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> isSequenceable [

	^ false
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection class >> newFrom: aCollection [
	"Answer an instance of me containing the same elements as aCollection."

	| newCollection |
	newCollection := self new: aCollection size.
	newCollection addAll: aCollection.
	^ newCollection
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> noneSatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver. If aBlock returns false for all elements return true. Otherwise return false"

	self do: [ :item | (aBlock value: item) ifTrue: [ ^ false ] ].
	^ true
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> printElementsOn: aStream [
	"List elements betwen () and separated by spaces.
	Is used by printOn: and other related printing methods."

	aStream nextPut: $(.
	self do: [:element | aStream print: element] separatedBy: [aStream space].
	aStream nextPut: $)
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> removeAll [
	"Remove each element from the receiver and leave it empty.
	There are two good reasons why a subclass should override this message:
	1) the subclass does not support being modified while being iterated
	2) the subclass provides a much faster way than iterating through each element"

	self do: [ :each | self remove: each ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> select: selectBlock thenCollect: collectBlock [

	^ (self select: selectBlock) collect: collectBlock
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> sorted [

	^self sortAscending
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
Collection >> sorted: block [

	^ self sortWithBlock: block
]
