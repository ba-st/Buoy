Class {
	#name : 'SearchMethodsForLocalizationMessagesRule',
	#superclass : 'RBParseTreeLintRule',
	#instVars : [
		'stringsToTranslate'
	],
	#category : 'Buoy-Development-Tools-Pharo-12',
	#package : 'Buoy-Development-Tools-Pharo-12'
}

{ #category : 'instance creation' }
SearchMethodsForLocalizationMessagesRule class >> collectingTranslationsIn: aCollection [

  ^ self new initializeCollectingTranslationsIn: aCollection
]

{ #category : 'testing' }
SearchMethodsForLocalizationMessagesRule class >> isVisible [

  ^ false
]

{ #category : 'private' }
SearchMethodsForLocalizationMessagesRule >> collectStringIn: aLiteralNode [
  "The pattern matches any literal, numbers included, but only strings are translated"

  aLiteralNode value isString ifTrue: [ stringsToTranslate add: aLiteralNode value ]
]

{ #category : 'initialization' }
SearchMethodsForLocalizationMessagesRule >> initialize [

  super initialize.
  stringsToTranslate := OrderedCollection new.
  matcher
    matches: '`#string localized' do: [ :node :answer | self collectStringIn: node receiver ];
    matches: '`#string localizedWithAll: `@values'
    do: [ :node :answer | self collectStringIn: node receiver ]
]

{ #category : 'initialization' }
SearchMethodsForLocalizationMessagesRule >> initializeCollectingTranslationsIn: aCollection [

  stringsToTranslate := aCollection
]

{ #category : 'accessing' }
SearchMethodsForLocalizationMessagesRule >> name [

  ^ 'Search methods for localization messages'
]
