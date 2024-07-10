Extension { #name : 'PolyglotNaturalLanguageTranslator' }

{ #category : '*Buoy-Localization-Pharo-Extensions' }
PolyglotNaturalLanguageTranslator >> cleanUp [
	"Just for Pharo compatibility.
	We don't re-initialize, so that any translations installed are kept when preparing the image for deployment."

	
]

{ #category : '*Buoy-Localization-Pharo-Extensions' }
PolyglotNaturalLanguageTranslator >> translate: string [
  "Just for Pharo compatibility"

  ^ string
]

{ #category : '*Buoy-Localization-Pharo-Extensions' }
PolyglotNaturalLanguageTranslator >> translate: string toLocale: localeID [
  "Just for Pharo compatibility"

  ^ self translate: string
]
