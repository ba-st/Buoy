| symbolDictionary |
symbolDictionary := Rowan image 
	symbolDictNamed:'Buoy'
	ifAbsent: [
			Rowan image symbolList createDictionaryNamed: 'Buoy' at: 1.
			Rowan image symbolDictNamed:'Buoy'
	].
symbolDictionary at: #SubscriptOutOfBounds put: OffsetError.
symbolDictionary at: #NotFound put: LookupError.

