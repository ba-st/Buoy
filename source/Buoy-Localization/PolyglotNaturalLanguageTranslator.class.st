Class {
	#name : 'PolyglotNaturalLanguageTranslator',
	#superclass : 'Object',
	#instVars : [
		'translators'
	],
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'class initialization' }
PolyglotNaturalLanguageTranslator class >> initialize [

  <ignoreForCoverage>
  NaturalLanguageTranslator current: self new
]

{ #category : 'initialization' }
PolyglotNaturalLanguageTranslator >> cleanUp [

	self initialize
]

{ #category : 'initialization' }
PolyglotNaturalLanguageTranslator >> initialize [

  super initialize.
  translators := SortedCollection sortBlock: [ :a :b | a specificity > b specificity ]
]

{ #category : 'localization' }
PolyglotNaturalLanguageTranslator >> localize: string to: stringOrLanguageTag [

  ^ self localize: string withAll: #(  ) to: stringOrLanguageTag
]

{ #category : 'localization' }
PolyglotNaturalLanguageTranslator >> localize: string withAll: collection to: stringOrLanguageTag [

  | languageTag stringToTranslate |
  languageTag := stringOrLanguageTag asLanguageTag.
  stringToTranslate := string unescaped.
  translators do: [ :translator |
      ( translator matches: languageTag ) then: [
          translator
            withTranslationOf: stringToTranslate
            do: [ :translatedString | ^ translatedString format: collection ]
        ]
    ].
  ^ stringToTranslate format: collection
]

{ #category : 'configuring' }
PolyglotNaturalLanguageTranslator >> translationFor: string in: targetLanguageRange is: translatedString [

  ^ ( self translatorFor: targetLanguageRange ) translationFor: string is: translatedString
]

{ #category : 'private' }
PolyglotNaturalLanguageTranslator >> translatorFor: stringOrLanguageRange [

  | range |
  range := stringOrLanguageRange asLanguageRange.

  ^ translators
      detect: [ :translator | translator isFor: range ]
      ifNone: [ translators add: ( MonoglotNaturalLanguageTranslator for: range ) ]
]
