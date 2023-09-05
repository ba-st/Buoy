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
"Temporary, it will be fixed in a post load script"
symbolDictionary at: #AssertionFailure put: nil.

"Patch bug in UUID class"
UUID compileMethod:
'asString36
	"Encode the UUID as a base 36 string using 0-9 and lowercase a-z.
	This is the shortest representation still being able to work as
	filenames etc since it does not depend on case nor characters
	that might cause problems, and it fits into short filenames like on
	the old MacOS HFS filesystem. The check for 36r is to make this code
	work in versions before Squeak 3.8."

	| num candidate |
	num := 0.
	1 to: self size do: [:i | num := num + ((256 raisedTo: i - 1) * (self at: i))].
	candidate := num printStringRadix:  36.
	^((candidate beginsWith: ''36r'')
			ifTrue: [candidate copyFrom: 4 to: candidate size]
			ifFalse: [candidate]) asLowercase'
 dictionaries: GsCurrentSession currentSession symbolList
 category: 'converting'
