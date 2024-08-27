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
PolyglotNaturalLanguageTranslator >> initialize [

  super initialize.
  translators := SortedCollection sortBlock: [ :a :b | a specificity > b specificity ]
]

{ #category : 'configuring' }
PolyglotNaturalLanguageTranslator >> loadJSONTranslationFilesIn: aLocaleFileReference [
  "Loads in the language translator the translation files in the location.
	It expectes a directory for each language tag containing any number of JSON
	files. "

  aLocaleFileReference directories do: [ :localeDirectory |
      self loadJSONTranslationsFor: localeDirectory basename asLanguageRange in: localeDirectory ]
]

{ #category : 'private' }
PolyglotNaturalLanguageTranslator >> loadJSONTranslationsFor: languageRange in: localeDirectory [
  "Each file has the following structure: a first key level with a group,
	and a second level where the key is the translation key and the value is the
	translated string."

  | monoglotTranslator |
  monoglotTranslator := self translatorFor: languageRange.

  ^ localeDirectory files select: [ :file | file extension = 'json' ] thenDo: [ :file |
        | groupedTranslations |
        groupedTranslations := STON fromString: file contents.
        groupedTranslations keysAndValuesDo: [ :group :translations |
            translations keysAndValuesDo: [ :translationKey :translation |
                monoglotTranslator
                  translationAt: ( ByteArray readHexFrom: translationKey )
                  put: translation ]
          ]
      ]
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
