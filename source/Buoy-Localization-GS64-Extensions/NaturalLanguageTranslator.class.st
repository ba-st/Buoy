"
A NaturalLanguageTranslator is a placeholder for a language translator.

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

  Current ifNil: [ self current: PolyglotNaturalLanguageTranslator new ].
  ^ Current
]

{ #category : 'accessing' }
NaturalLanguageTranslator class >> current: aTranslator [
	"Register a translator that should receiver the translation messages"

	Current := aTranslator
]
