Class {
	#name : 'LanguagePlatform',
	#superclass : 'Object',
	#classInstVars : [
		'Current'
	],
	#category : 'Buoy-Metaprogramming-Extensions',
	#package : 'Buoy-Metaprogramming-Extensions'
}

{ #category : 'accessing' }
LanguagePlatform class >> current [

	Current ifNil: [ self setCurrentTo: self allLeafSubclasses any new ].
	^ Current
]

{ #category : 'accessing' }
LanguagePlatform class >> setCurrentTo: aLanguagePlatform [

	<ignoreForCoverage>
	Current := aLanguagePlatform.
	^ Current
]

{ #category : 'reflection' }
LanguagePlatform >> atInstanceVariableNamed: name on: object put: value [

	self subclassResponsibility
]

{ #category : 'process scheduling' }
LanguagePlatform >> fork: block named: processName at: priority [

	self subclassResponsibility
]

{ #category : 'reflection' }
LanguagePlatform >> globalNamed: aSymbol ifAbsent: absentBlock [

	^ self subclassResponsibility
]

{ #category : 'reflection' }
LanguagePlatform >> globalNamed: symbol ifAbsentPut: block [

  ^ self subclassResponsibility
]

{ #category : 'reflection' }
LanguagePlatform >> globalNamed: aSymbol ifPresent: presentBlock ifAbsent: absentBlock [

	| global |
	global := self globalNamed: aSymbol ifAbsent: [ ^ absentBlock value ].
	^ presentBlock cull: global
]

{ #category : 'reflection' }
LanguagePlatform >> includesGlobalNamed: aSymbol [

	^ self subclassResponsibility
]

{ #category : 'reflection' }
LanguagePlatform >> instanceVariableNamed: name on: object [

  ^ self subclassResponsibility
]

{ #category : 'message digest' }
LanguagePlatform >> messageDigest: string [
  "Returns a message digest for the given string, the hashing algorithm can be platform specific.
	The resulting digest mut be a byte array"

  ^ self subclassResponsibility
]

{ #category : 'process scheduling' }
LanguagePlatform >> newProcessNamed: processName evaluating: block at: priority [

  self subclassResponsibility
]

{ #category : 'accessing' }
LanguagePlatform >> os [
	"Returns the underlying operating system abstraction"

	^ self subclassResponsibility
]

{ #category : 'reflection' }
LanguagePlatform >> removeGlobalNamed: aSymbol ifAbsent: absentBlock [

	^ self subclassResponsibility
]
