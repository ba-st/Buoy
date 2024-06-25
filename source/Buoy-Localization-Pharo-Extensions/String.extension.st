Extension { #name : 'String' }

{ #category : '*Buoy-Localization-Pharo-Extensions' }
String >> asLanguageRange [

  ^ LanguageRange fromString: self
]

{ #category : '*Buoy-Localization-Pharo-Extensions' }
String >> asLanguageTag [

	^ LanguageTag fromString: self
]

{ #category : '*Buoy-Localization-Pharo-Extensions' }
String >> escaped [

  ^ EscapingAlgorithm new escape: self
]

{ #category : '*Buoy-Localization-Pharo-Extensions' }
String >> localized [

  ^ self localizedWithAll: #(  )
]

{ #category : '*Buoy-Localization-Pharo-Extensions' }
String >> localizedWithAll: collection [

  ^ NaturalLanguageTranslator current localize: self withAll: collection to: CurrentLocale value
]

{ #category : '*Buoy-Localization-Pharo-Extensions' }
String >> unescaped [

  ^ EscapingAlgorithm new unescape: self
]
