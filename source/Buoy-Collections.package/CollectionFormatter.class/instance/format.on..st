formatting
format: aCollection on: aStream

	| index size |

	index := 1.
	size := aCollection size.

	aCollection
		do: [ :element | 
			index := index + 1.
			aStream nextPutAll: (elementFormatter value: element) ]
		separatedBy: [ index = size
				ifTrue: [ lastSeparator
						withContentDo: [ :content | self put: content on: aStream ]
						ifUnused: [ self putSeparatorOn: aStream ] ]
				ifFalse: [ self putSeparatorOn: aStream ] ].
			
	^aStream contents