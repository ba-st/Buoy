"
I'm a code formatter implementing the ba-st conventions
"
Class {
	#name : 'BuenosAiresSmalltalkFormatter',
	#superclass : 'EFFormatter',
	#category : 'Buoy-Development-Tools',
	#package : 'Buoy-Development-Tools'
}

{ #category : 'class initialization' }
BuenosAiresSmalltalkFormatter class >> initialize [

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
BuenosAiresSmalltalkFormatter class >> initializeBlockSettings [

  self
    lineUpBlockBrackets: true;
    keepBlockInMessage: true
]

{ #category : 'class initialization' }
BuenosAiresSmalltalkFormatter class >> initializeCascadeSettings [

  self
    newLineAfterCascade: true;
    newLineBeforeFirstCascade: true
]

{ #category : 'class initialization' }
BuenosAiresSmalltalkFormatter class >> initializeCommentSettings [

  self
    useBasicCommentFormat: true;
    formatCommentCloseToStatements: true
]

{ #category : 'class initialization' }
BuenosAiresSmalltalkFormatter class >> initializeGeneralSettings [

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
BuenosAiresSmalltalkFormatter class >> initializeKeywordMessageSettings [

  self
    oneLineMessages: '#(#to: #to:do: #to:by: #to:by:do:)';
    multiLineMessages:
      '#(#ifTrue:ifFalse: #ifFalse:ifTrue: #ifTrue: #ifFalse: #on:do: #ensure: #ifCurtailed:)';
    newLineBeforeFirstKeyword: true
]

{ #category : 'class initialization' }
BuenosAiresSmalltalkFormatter class >> initializeMethodSignatureSettings [

  self
    methodSignatureOnMultipleLines: true;
    selectorAndArgumentCombinedMaxSize: 80
]

{ #category : 'class initialization' }
BuenosAiresSmalltalkFormatter class >> initializeNewLineSettings [

  self
    minimumNewLinesBetweenStatements: 1;
    numberOfArgumentsForMultiLine: 4;
    numberOfNewLinesAfterMethodComment: 2;
    numberOfNewLinesAfterMethodSignature: 2;
    numberOfNewLinesAfterTemporaries: 1;
    retainBlankLinesBetweenStatements: true;
    retainBlankLinesBeforeComments: true.
  "Older Pharo versions don't support this setting"
  ( self respondsTo: #numberOfNewLinesAfterMethodSignatureWithMethodComment: ) ifTrue: [
      self numberOfNewLinesAfterMethodSignatureWithMethodComment: 1 ]
]

{ #category : 'priority' }
BuenosAiresSmalltalkFormatter class >> priority [

  ^ 20
]

{ #category : 'private - formatting' }
BuenosAiresSmalltalkFormatter >> formatArray: anArrayNode [

  codeStream nextPutAll: self spacesInsideArray.
  self indentAround: [ self formatArrayBody: anArrayNode ].
  codeStream nextPutAll: self spacesInsideArray
]

{ #category : 'private - formatting' }
BuenosAiresSmalltalkFormatter >> formatArrayBody: aSequenceNode [

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

{ #category : 'private - formatting' }
BuenosAiresSmalltalkFormatter >> formatBlock: aBlockNode [

  | isMultiline isBodyTooLong |
  isMultiline := self willBeMultiline: aBlockNode body.

  codeStream nextPutAll: self spacesInsideBlocksString.

  self formatBlockArgumentsFor: aBlockNode.
  self formatBlockCommentFor: aBlockNode.

  isBodyTooLong := self isLineTooLongWithNode: aBlockNode body.

  ( isMultiline or: [ isBodyTooLong ] )
    ifTrue: [
        self indentAround: [
            ( self shouldPassNewLineAfterHeadOfBlock: aBlockNode ) ifTrue: [ self newLine ].
            self visitSequenceNode: aBlockNode body
          ]
      ]
    ifFalse: [ self visitSequenceNode: aBlockNode body ].

  ( self lineUpBlockBrackets and: [ isMultiline ] )
    ifTrue: [ self newLine ]
    ifFalse: [ codeStream nextPutAll: self spacesInsideBlocksString ]
]

{ #category : 'private' }
BuenosAiresSmalltalkFormatter >> needsParenthesisFor: aNode [

  | parent |
  aNode ifNil: [ ^ false ].
  aNode isValue ifFalse: [ ^ false ].
  aNode isParseError ifTrue: [ ^ aNode hasParentheses ].
  parent := aNode parent ifNil: [ ^ false ].
  ^ parent isDynamicArray
      ifTrue: [ false ]
      ifFalse: [ super needsParenthesisFor: aNode ]
]
