| symbolDictionary |
symbolDictionary := Rowan image 
	symbolDictNamed: 'Buoy'
	ifAbsent: [
    Error signal: 'Missing Buoy symbol dictionary'  
	].

symbolDictionary at: #AssertionFailure put: AssertionFailed.
