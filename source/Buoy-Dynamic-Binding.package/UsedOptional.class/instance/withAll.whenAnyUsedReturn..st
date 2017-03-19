Combining
withAll: optionals whenAnyUsedReturn: aMonadycBlock

	| combined |

	combined := (self class containing: (OrderedCollection with: content))
		whenAllUsedIn: optionals
		injectInto: [ :contents :currentContent | 
			contents
				add: currentContent;
				yourself ].

	^ combined withContentDo: [ :contents | self class containing: (aMonadycBlock value: contents) ] ifUnused: [ combined ]