"
I'm a code formatter implementing the ba-st conventions
"
Class {
	#name : 'BAStFormatter',
	#superclass : 'EFFormatter',
	#category : 'Buoy-Development-Tools',
	#package : 'Buoy-Development-Tools'
}

{ #category : 'class initialization' }
BAStFormatter class >> initialize [

  self initializeGeneralSettings.
  self initializeBlockSettings.
  self initializeCommentSettings.
  self initializeMethodSignatureSettings.
  self initializeKeywordMessageSettings.
  self initializeNewLineSettings.
  self initializeCascadeSettings.
  RBProgramNode formatterClass: self
]

{ #category : 'class initialization' }
BAStFormatter class >> initializeBlockSettings [

  self
    lineUpBlockBrackets: true;
    keepBlockInMessage: true
]

{ #category : 'class initialization' }
BAStFormatter class >> initializeCascadeSettings [

  self
    newLineAfterCascade: true;
    newLineBeforeFirstCascade: true
]

{ #category : 'class initialization' }
BAStFormatter class >> initializeCommentSettings [

  self
    useBasicCommentFormat: true;
    formatCommentCloseToStatements: true
]

{ #category : 'class initialization' }
BAStFormatter class >> initializeGeneralSettings [

  self
    maxLineLength: 100;
    indentStyle: #space;
    numberOfSpacesInIndent: 2;
    indentsForKeywords: 1;
    periodAtEndOfBlock: false;
    periodAtEndOfMethod: false;
    numberOfSpacesAfterCaretSymbolInReturn: 1;
    numberOfSpacesInsideArray: 1;
    numberOfSpacesInsideBlock: 1;
    numberOfSpacesInsideParentheses: 1.
  self defaultPrettyPrintContext numberOfSpacesBeforeDotInDynamicArray: 1
]

{ #category : 'class initialization' }
BAStFormatter class >> initializeKeywordMessageSettings [

  self
    oneLineMessages: '#(#to: #to:do: #to:by: #to:by:do:)';
    multiLineMessages:
      '#(#ifTrue:ifFalse: #ifFalse:ifTrue: #ifTrue: #ifFalse: #on:do: #ensure: #ifCurtailed:)';
    newLineBeforeFirstKeyword: true
]

{ #category : 'class initialization' }
BAStFormatter class >> initializeMethodSignatureSettings [

  self
    methodSignatureOnMultipleLines: true;
    selectorAndArgumentCombinedMaxSize: 80
]

{ #category : 'class initialization' }
BAStFormatter class >> initializeNewLineSettings [

  self
    minimumNewLinesBetweenStatements: 1;
    numberOfArgumentsForMultiLine: 4;
    numberOfNewLinesAfterMethodComment: 2;
    numberOfNewLinesAfterMethodSignature: 2;
    numberOfNewLinesAfterMethodSignatureWithMethodComment: 1;
    numberOfNewLinesAfterTemporaries: 1;
    retainBlankLinesBetweenStatements: true;
    retainBlankLinesBeforeComments: true
]

{ #category : 'priority' }
BAStFormatter class >> priority [

  ^ 20
]

{ #category : 'private - formatting' }
BAStFormatter >> formatArray: anArrayNode [

  codeStream nextPutAll: self spacesInsideArray.
  self indentAround: [ self formatArrayBody: anArrayNode ].
  codeStream nextPutAll: self spacesInsideArray
]

{ #category : 'private - formatting' }
BAStFormatter >> formatArrayBody: aSequenceNode [

  | statements currentStatement |
  statements := aSequenceNode statements.
  statements isEmpty ifTrue: [ ^ self ].
  statements
    do: [ :statement |
      self visitNode: statement.
      self formatStatementCommentsFor: statement.
      currentStatement := statement
      ]
    separatedBy: [
      codeStream
        nextPutAll: self spacesBeforeDotInDynamicArray;
        nextPut: $..
      ( self isLineTooLongWithNode: currentStatement )
        ifTrue: [ self newLine ]
        ifFalse: [ self space ]
      ]
]
