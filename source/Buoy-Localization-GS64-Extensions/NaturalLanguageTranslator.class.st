"
A NaturalLanguageTranslator is a dummy translator.

The localization framework is found in the gettext package usually 
overriding this class completely. 

As an alternative you can register a translator using
  
   NaturalLanguageTranslator current: myTranslator

If this is done the messages will be dispatched to it
"
Class {
	#name : 'NaturalLanguageTranslator',
	#superclass : 'Object',
	#classVars : [
		'Current'
	],
	#category : 'Buoy-Localization-GS64-Extensions',
	#package : 'Buoy-Localization-GS64-Extensions'
}

{ #category : 'accessing' }
NaturalLanguageTranslator class >> current [
	"Return the currently registered translator"

	^Current
]

{ #category : 'accessing' }
NaturalLanguageTranslator class >> current: aTranslator [
	"Register a translator that should receiver the translation messages"

	Current := aTranslator
]
