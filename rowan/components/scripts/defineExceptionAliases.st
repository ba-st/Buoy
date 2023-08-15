| symbolDictionary |
symbolDictionary := Rowan image 
	symbolDictNamed: 'Buoy'
	ifAbsent: [
			Rowan image symbolList createDictionaryNamed: 'Buoy' at: 1.
			Rowan image symbolDictNamed: 'Buoy'
	].

symbolDictionary at: #ArithmeticError put: NumericError.
symbolDictionary at: #KeyNotFound put: LookupError.
symbolDictionary at: #NotFound put: LookupError.
symbolDictionary at: #SubscriptOutOfBounds put: OffsetError.
