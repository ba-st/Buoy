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

{ #category : 'initialization' }
SearchMethodsForLocalizationMessagesRule >> initialize [

  super initialize.
  matcher
    matches: '`#string localized'
    do: [ :node :answer | stringsToTranslate add: node receiver value ];
    matches: '`#string localizedWithAll: `@values'
    do: [ :node :answer | stringsToTranslate add: node receiver value ]
]

{ #category : 'initialization' }
SearchMethodsForLocalizationMessagesRule >> initializeCollectingTranslationsIn: aCollection [

  stringsToTranslate := aCollection
]

{ #category : 'accessing' }
SearchMethodsForLocalizationMessagesRule >> name [

  ^ 'Search methods for localization messages'
]
