Class {
  #name : 'GemStone64Platform',
  #superclass : 'LanguagePlatform',
  #category : 'Buoy-Metaprogramming-GS64-Extensions',
  #package : 'Buoy-Metaprogramming-GS64-Extensions'
}

{ #category : 'class initialization' }
GemStone64Platform class >> initialize [

  LanguagePlatform setCurrentTo: self new
]

{ #category : 'reflection' }
GemStone64Platform >> atInstanceVariableNamed: name on: object put: value [

  | index |
  index := (object class allInstVarNames collect: #asSymbol)
    indexOf: name asSymbol
    ifAbsent: [ self error: ('<1s> not found in <2p>' expandMacrosWith: name asString with: object) ].
  object instVarAt: index put: value

]

{ #category : 'process scheduling' }
GemStone64Platform >> fork: block named: processName at: priority [

  | process |
  process := self newProcessNamed: processName evaluating: block at: priority.
  process resume.
  Processor yield.
  ^process
]

{ #category : 'process scheduling' }
GemStone64Platform >> newProcessNamed: processName evaluating: block at: priority [

  ^ block newProcess
      beForked;
      priority: priority;
      name: processName;
      yourself
]

{ #category : 'reflection' }
GemStone64Platform >> globalNamed: aSymbol ifAbsent: absentBlock [

  ^ (GsCurrentSession currentSession objectNamed: aSymbol)
      ifNil: absentBlock
]

{ #category : 'reflection' }
GemStone64Platform >> globalNamed: symbol ifAbsentPut: block [

  ^ (GsCurrentSession currentSession objectNamed: symbol)
      ifNil: [
        | object |
        object := block value.
        (GsCurrentSession currentSession objectNamed: #Globals)
          at: symbol put: object.
        object
      ]
]

{ #category : 'reflection' }
GemStone64Platform >> includesGlobalNamed: aSymbol [

  ^ (GsCurrentSession currentSession objectNamed: aSymbol)
      notNil
]

{ #category : 'reflection' }
GemStone64Platform >> instanceVariableNamed: name on: object [

  | index |
  index := (object class allInstVarNames collect: #asSymbol)
    indexOf: name asSymbol
    ifAbsent: [ self error: ('<1s> not found in <2p>' expandMacrosWith: name asString with: object) ].
  ^ object instVarAt: index

]

{ #category : 'message digest' }
GemStone64Platform >> messageDigest: string [

  ^ string sha256SumBytes
]

{ #category : 'accessing' }
GemStone64Platform >> os [

  ^ GemStone64UnixPlatform current
]

{ #category : 'reflection' }
GemStone64Platform >> removeGlobalNamed: aSymbol ifAbsent: absentBlock [

  | globals |
  globals := GsCurrentSession currentSession objectNamed: #Globals.
  ^ globals removeKey: aSymbol ifAbsent: absentBlock
]
