Extension { #name : #CharacterCollection }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> expandMacros [

	^ self expandMacrosWithArguments: #(  )
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> expandMacrosWith: anObject [

	^ self expandMacrosWithArguments: { anObject }
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> expandMacrosWith: anObject with: anotherObject [

	^ self expandMacrosWithArguments:
		  (Array with: anObject with: anotherObject)
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> expandMacrosWith: anObject with: anotherObject with: thirdObject [

	^ self expandMacrosWithArguments:
		  (Array with: anObject with: anotherObject with: thirdObject)
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> expandMacrosWith: anObject with: anotherObject with: thirdObject with: fourthObject [

	^ self expandMacrosWithArguments: (Array
			   with: anObject
			   with: anotherObject
			   with: thirdObject
			   with: fourthObject)
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> expandMacrosWithArguments: anArray [

	| readStream char index |
	^ self species
		new: self size
		streamContents:
			[ :newStream |
			readStream := self readStream.
			[ readStream atEnd ]
				whileFalse:
					[ char := readStream next.
					char == $<
						ifTrue:
							[ | nextChar |
							nextChar := readStream next asUppercase.
							nextChar == $R
								ifTrue: [ newStream cr ].
							nextChar == $L
								ifTrue: [ newStream lf ].
							nextChar == $T
								ifTrue: [ newStream tab ].
							nextChar == $N
								ifTrue: [ newStream lf ].
							nextChar isDigit
								ifTrue:
									[ index := nextChar digitValue.
									[ readStream atEnd or: [ (nextChar := readStream next asUppercase) isDigit not ] ]
										whileFalse: [ index := index * 10 + nextChar digitValue ] ].
							nextChar == $?
								ifTrue:
									[ | trueString falseString |
									trueString := readStream upTo: $:.
									falseString := readStream upTo: $>.
									readStream position: readStream position - 1.
									newStream
										nextPutAll:
											((anArray at: index)
												ifTrue: [ trueString ]
												ifFalse: [ falseString ]) ].
							nextChar == $P
								ifTrue: [ (anArray at: index) printOn: newStream  ].
							nextChar == $S
								ifTrue: [ newStream nextPutAll: (anArray at: index) ].
							readStream skipTo: $> ]
						ifFalse: [ newStream
								nextPut:
									(char == $%
										ifTrue: [ readStream next ]
										ifFalse: [ char ]) ] ] ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> species [

	^ self speciesForConversion
]
