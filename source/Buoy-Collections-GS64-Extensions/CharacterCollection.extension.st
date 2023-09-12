Extension { #name : #CharacterCollection }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> capitalized [

	self ifEmpty: [ ^ self ].

	^ '<1s><2s>'
		  expandMacrosWith: self first asUppercase asString
		  with: self withoutFirst
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection class >> cr [

	^ self with: Character cr
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection class >> crlf [

	^ self with: Character cr with: Character lf
]

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
CharacterCollection >> findTokens: delimiters [

	| separators |
	separators := delimiters isCharacter
		              ifTrue: [ delimiters asString ]
		              ifFalse: [ delimiters ].
	^ self substrings: separators
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> includesSubstring: substring [

	^ substring isEmpty or: [
		  (self _findString: substring startingAt: 1 ignoreCase: false) ~~ 0 ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> isAllDigits [
	"Return whether the receiver is composed entirely of digits and has at least one digit"

	self ifEmpty: [ ^ false ].
	^ self allSatisfy: #isDigit
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> isAsciiString [

	^ self allSatisfy: [ :each | each codePoint <= 127 ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection class >> lf [

	^ self with: Character lf
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> lines [
	"Answer an array of lines composing this receiver without the line ending delimiters"

	^ Array
		  new: (self size // 60 max: 16)
		  streamContents: [ :lines |
		  self linesDo: [ :aLine | lines nextPut: aLine ] ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> linesDo: aBlock [
	"Execute aBlock with each line in this string. The terminating line delimiters CR, LF or CRLF
	pairs are not included in what is passed to aBlock"

	self lineIndicesDo: [ :start :endWithoutDelimiters :end |
		aBlock value: (self copyFrom: start to: endWithoutDelimiters) ]
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> sorted [

	^ self class withAll: super sorted
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> species [

	^ self speciesForConversion
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection class >> tab [

	^ self with: Character tab
]

{ #category : #'*Buoy-Collections-GS64-Extensions' }
CharacterCollection >> withoutQuoting [
	"Remove the initial and final quote marks (single quote for string, or double quotes for comments),
	if present (and if matches nesting quotes). Have a look at testWithoutQuoting."

	| quote |
	self size < 2 ifTrue: [ ^ self ].
	quote := self first.
	^ (quote = self last and: [ quote = $' or: [ quote = $" ] ])
		  ifTrue: [ self copyFrom: 2 to: self size - 1 ]
		  ifFalse: [ self ]
]
