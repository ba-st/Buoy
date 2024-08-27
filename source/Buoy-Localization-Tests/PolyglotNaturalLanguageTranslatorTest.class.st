"
A PolyglotNaturalLanguageTranslatorTest is a test class for testing the behavior of PolyglotNaturalLanguageTranslator
"
Class {
	#name : 'PolyglotNaturalLanguageTranslatorTest',
	#superclass : 'TestCase',
	#instVars : [
		'translator'
	],
	#category : 'Buoy-Localization-Tests',
	#package : 'Buoy-Localization-Tests'
}

{ #category : 'private' }
PolyglotNaturalLanguageTranslatorTest >> exportSpanishTranslationsIn: location [

  | spanishLocation |
  spanishLocation := location / 'locales' / 'es'.
  spanishLocation ensureCreateDirectory.

  spanishLocation / 'tests.json' writeStreamDo: [ :stream |
      stream nextPutAll:
        '{"Tests":{"6guTfqMXEB7iwmsDpIQ6Gc7O2KK5Zzw89AmnJsorD9g":"Argentina","B_YrAhdx089n4uH68YdpzF5cEZrX1NGEehHhHW1afss":"Brasil","qlqzWpF0wgYrf3aXsz-v5c5ATPX-z2v7vw3Ja6DZAEY":"EEUU"}}'
    ]
]

{ #category : 'running' }
PolyglotNaturalLanguageTranslatorTest >> setUp [

  super setUp.
  translator := PolyglotNaturalLanguageTranslator new
]

{ #category : 'tests' }
PolyglotNaturalLanguageTranslatorTest >> testLoadJSONTranslationFilesIn [

  | tempLocation |
  tempLocation := FileLocator temp / 'Buoy' / self selector asString.
  tempLocation ensureCreateDirectory.
  [
    self exportSpanishTranslationsIn: tempLocation.

    self assert: ( translator localize: 'Brazil' to: 'es' ) equals: 'Brazil'.

    translator loadJSONTranslationFilesIn: tempLocation / 'locales'.
    self assert: ( translator localize: 'Brazil' to: 'es' ) equals: 'Brasil'.
    self assert: ( translator localize: 'USA' to: 'es' ) equals: 'EEUU'
  ] ensure: [tempLocation ensureDeleteAll]
]

{ #category : 'tests' }
PolyglotNaturalLanguageTranslatorTest >> testLocalizedToLanguageWithTranslation [

  translator
    translationFor: 'Happy new year' in: 'es' is: 'Feliz año nuevo';
    translationFor: 'Happy new year! \u{1F389}' in: 'es' is: 'Feliz año nuevo! \u{1F389}';
    translationFor: 'Happy {1} year' in: 'es' is: 'Feliz año {1}';
    translationFor: 'Happy new year! \u{1F389}' in: 'es-AR' is: '¡Feliz año nuevo! \u{1F389}'.

  self
    assert: ( translator localize: 'Happy new year' to: 'es-AR' ) equals: 'Feliz año nuevo';
    assert: ( translator localize: 'Happy new year! \u{1F389}' to: 'es-AR' )
    equals: '¡Feliz año nuevo! 🎉';
    assert: ( translator localize: 'Happy {1} year' withAll: { 2024 } to: 'es-AR' )
    equals: 'Feliz año 2024'.

  self
    assert: ( translator localize: 'Happy new year' to: 'es' ) equals: 'Feliz año nuevo';
    assert: ( translator localize: 'Happy new year! \u{1F389}' to: 'es' )
    equals: 'Feliz año nuevo! 🎉';
    assert: ( translator localize: 'Happy {1} year' withAll: { 2024 } to: 'es' )
    equals: 'Feliz año 2024'.

  self
    assert: ( translator localize: 'Happy new year' to: 'es-ES' ) equals: 'Feliz año nuevo';
    assert: ( translator localize: 'Happy new year! \u{1F389}' to: 'es-ES' )
    equals: 'Feliz año nuevo! 🎉';
    assert: ( translator localize: 'Happy {1} year' withAll: { 2024 } to: 'es-ES' )
    equals: 'Feliz año 2024'
]

{ #category : 'tests' }
PolyglotNaturalLanguageTranslatorTest >> testLocalizedToLanguageWithoutTranslations [

  self
    assert: ( translator localize: 'Happy new year' to: 'es-AR' ) equals: 'Happy new year';
    assert: ( translator localize: 'Happy new year! \u{1F389}' to: 'es-AR' )
    equals: 'Happy new year! 🎉';
    assert: ( translator localize: 'Happy {1} year' withAll: { 2024 } to: 'es-AR' )
    equals: 'Happy 2024 year'
]
