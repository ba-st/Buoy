Class {
	#name : 'PharoPlatform',
	#superclass : 'LanguagePlatform',
	#category : 'Buoy-Metaprogramming-Pharo-Extensions',
	#package : 'Buoy-Metaprogramming-Pharo-Extensions'
}

{ #category : 'class initialization' }
PharoPlatform class >> initialize [

	<ignoreForCoverage>
	LanguagePlatform setCurrentTo: self new
]

{ #category : 'reflection' }
PharoPlatform >> atInstanceVariableNamed: name on: object put: value [

	object instVarNamed: name put: value
]

{ #category : 'process scheduling' }
PharoPlatform >> fork: block named: processName at: priority [

	^ block forkAt: priority named: processName
]

{ #category : 'reflection' }
PharoPlatform >> globalNamed: aSymbol ifAbsent: absentBlock [

	^ Smalltalk globals at: aSymbol ifAbsent: absentBlock
]

{ #category : 'reflection' }
PharoPlatform >> globalNamed: symbol ifAbsentPut: block [

  ^ Smalltalk globals at: symbol ifAbsentPut: block
]

{ #category : 'reflection' }
PharoPlatform >> includesGlobalNamed: aSymbol [

	^ Smalltalk globals includesKey: aSymbol
]

{ #category : 'reflection' }
PharoPlatform >> instanceVariableNamed: name on: object [

  ^ object instVarNamed: name
]

{ #category : 'message digest' }
PharoPlatform >> messageDigest: string [

  ^ SHA256 hashMessage: string
]

{ #category : 'process scheduling' }
PharoPlatform >> newProcessNamed: processName evaluating: block at: priority [

  ^ block newProcess
      priority: priority;
      name: processName;
      yourself
]

{ #category : 'accessing' }
PharoPlatform >> os [

	^ OSPlatform current
]

{ #category : 'reflection' }
PharoPlatform >> removeGlobalNamed: aSymbol ifAbsent: absentBlock [

  ^ Smalltalk globals removeKey: aSymbol ifAbsent: absentBlock
]
