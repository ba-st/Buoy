| symbolDictionary |
symbolDictionary := Rowan image 
	symbolDictNamed: 'Buoy'
	ifAbsent: [
			Rowan image symbolList createDictionaryNamed: 'Buoy' at: Rowan image symbolList size + 1.
			Rowan image symbolDictNamed: 'Buoy'
	].

symbolDictionary at: #ArithmeticError ifAbsentPut: [NumericError].
symbolDictionary at: #KeyNotFound ifAbsentPut: [LookupError].
symbolDictionary at: #NotFound ifAbsentPut: [LookupError].
symbolDictionary at: #SubscriptOutOfBounds ifAbsentPut: [OffsetError].
symbolDictionary at: #SmallDictionary ifAbsentPut: [Dictionary].
symbolDictionary at: #Exit ifAbsentPut: [ExitClientError].
symbolDictionary at: #CollectionIsEmpty ifAbsentPut: [ImproperOperation].
"Temporary, it will be fixed in a post load script"
symbolDictionary at: #AssertionFailure ifAbsentPut: [nil].
