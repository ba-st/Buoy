formatting
format: aCollection

	| index size |

	index := 1.
	size := aCollection size.

	^ String
		streamContents: [ :stream | 
			aCollection
				do: [ :element | 
					index := index + 1.
					stream nextPutAll: (elementFormatter value: element) ]
				separatedBy: [ index = size
						ifTrue: [ lastSeparator
								withContentDo: [ :content | self put: content on: stream ]
								ifUnused: [ self putSeparatorOn: stream ] ]
						ifFalse: [ self putSeparatorOn: stream ] ] ]