| symbolDictionary assignmentCommand |
symbolDictionary := Rowan image 
	symbolDictNamed: 'Buoy'
	ifAbsent: [
    Error signal: 'Missing Buoy symbol dictionary'  
	].
assignmentCommand := [ :key :contentBlock |
                         symbolDictionary
                           at: key
                           ifPresent: [ :current |
                             current ifNil: [ symbolDictionary at: key put: contentBlock value ] ]
                           ifAbsentPut: contentBlock
                       ].
					   
assignmentCommand value: #AssertionFailure value: [AssertionFailed].
