Class {
	#name : #GemStone64Platform,
	#superclass : #LanguagePlatform,
	#category : #'Buoy-Metaprogramming-GS64-Extensions'
}

{ #category : #'class initialization' }
GemStone64Platform class >> initialize [

	LanguagePlatform setCurrentTo: self new
]

{ #category : #reflection }
GemStone64Platform >> atInstanceVariableNamed: name on: object put: value [

	| index |
	index := (object class allInstVarNames collect: #asSymbol)
		indexOf: name asSymbol
		ifAbsent: [ self error: ('<1s> not found in <2p>' expandMacrosWith: name asString with: object) ].
	object instVarAt: index put: value

]

{ #category : #'process scheduling' }
GemStone64Platform >> fork: block named: processName at: priority [

	| process |
	process := block newProcess.
	process
		beForked;
		name: processName;
		priority: priority.
	process resume.
	Processor yield.
	^process
]

{ #category : #reflection }
GemStone64Platform >> globalNamed: aSymbol ifAbsent: absentBlock [

	^ (GsCurrentSession currentSession symbolList objectNamed: aSymbol)
		  ifNil: absentBlock
]

{ #category : #reflection }
GemStone64Platform >> includesGlobalNamed: aSymbol [

	^ (GsCurrentSession currentSession symbolList objectNamed: aSymbol)
		  notNil
]

{ #category : #accessing }
GemStone64Platform >> os [

	^ GemStone64UnixPlatform current
]
