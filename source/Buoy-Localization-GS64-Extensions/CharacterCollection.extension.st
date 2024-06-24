Extension { #name : 'CharacterCollection' }

{ #category : '*Buoy-Localization-GS64-Extensions' }
CharacterCollection >> asLanguageRange [

  ^ LanguageRange fromString: self
]

{ #category : '*Buoy-Localization-GS64-Extensions' }
CharacterCollection >> asLanguageTag [

	^ LanguageTag fromString: self
]

{ #category : '*Buoy-Localization-GS64-Extensions' }
CharacterCollection >> escaped [

  ^ EscapingAlgorithm new escape: self
]

{ #category : '*Buoy-Localization-GS64-Extensions' }
CharacterCollection >> localized [

  ^ self localizedWithAll: #(  )
]

{ #category : '*Buoy-Localization-GS64-Extensions' }
CharacterCollection >> localizedWithAll: collection [

  ^ NaturalLanguageTranslator current localize: self withAll: collection to: CurrentLocale value
]

{ #category : '*Buoy-Localization-GS64-Extensions' }
CharacterCollection >> unescaped [

  ^ EscapingAlgorithm new unescape: self
]
