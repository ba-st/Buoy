Combining
withAll: optionals return: aMonadycBlock

	| combined |

	combined := (self class containing: (OrderedCollection with: content))
		withAll: optionals
		injectInto: [ :contents :currentContent | 
			contents
				add: currentContent;
				yourself ].

	^ combined withContentDo: [ :contents | self class containing: (aMonadycBlock value: contents) ] ifUnused: [ combined ]