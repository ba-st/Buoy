Extension { #name : #OrderedSet }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
OrderedSet class >> with: firstObject with: secondObject [

	^ self new
		  add: firstObject;
		  add: secondObject;
		  yourself
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
OrderedSet class >> with: firstObject with: secondObject with: thirdObject [

	^ self new
		  add: firstObject;
		  add: secondObject;
		  add: thirdObject;
		  yourself
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
OrderedSet class >> with: firstObject with: secondObject with: thirdObject with: fourthObject [

	^ self new
		  add: firstObject;
		  add: secondObject;
		  add: thirdObject;
		  add: fourthObject;
		  yourself
]
