| symbolDictionary |
symbolDictionary := Rowan image 
	symbolDictNamed: 'Buoy'
	ifAbsent: [
    Error sigan: 'Missing Buoy symbol dictionary'  
	].

symbolDictionary at: #AssertionFailure put: AssertionFailed.
