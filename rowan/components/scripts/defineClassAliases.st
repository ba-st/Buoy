| symbolDictionary |
symbolDictionary := Rowan image 
	symbolDictNamed: 'Buoy'
	ifAbsent: [
			Rowan image symbolList createDictionaryNamed: 'Buoy' at: Rowan image symbolList size + 1.
			Rowan image symbolDictNamed: 'Buoy'
	].

symbolDictionary at: #ArithmeticError put: NumericError.
symbolDictionary at: #KeyNotFound put: LookupError.
symbolDictionary at: #NotFound put: LookupError.
symbolDictionary at: #SubscriptOutOfBounds put: OffsetError.
symbolDictionary at: #SmallDictionary put: Dictionary.
symbolDictionary at: #Exit put: ExitClientError.
symbolDictionary at: #CollectionIsEmpty put: ImproperOperation.
"Temporary, it will be fixed in a post load script"
symbolDictionary at: #AssertionFailure put: nil.
