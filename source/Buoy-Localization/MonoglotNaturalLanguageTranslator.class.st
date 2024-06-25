Class {
	#name : 'MonoglotNaturalLanguageTranslator',
	#superclass : 'Object',
	#instVars : [
		'targetLanguageRange',
		'translations'
	],
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'instance creation' }
MonoglotNaturalLanguageTranslator class >> for: aLanguageRange [

  ^ self new initializeFor: aLanguageRange
]

{ #category : 'private' }
MonoglotNaturalLanguageTranslator >> hashCodeFor: string [

  ^ LanguagePlatform current messageDigest: string
]

{ #category : 'initialization' }
MonoglotNaturalLanguageTranslator >> initializeFor: aLanguageRange [

  targetLanguageRange := aLanguageRange.
  translations := Dictionary new
]

{ #category : 'testing' }
MonoglotNaturalLanguageTranslator >> isFor: aLanguageRange [

  ^ targetLanguageRange = aLanguageRange
]

{ #category : 'testing' }
MonoglotNaturalLanguageTranslator >> matches: aLanguageTag [

  ^ targetLanguageRange matches: aLanguageTag
]

{ #category : 'accessing' }
MonoglotNaturalLanguageTranslator >> specificity [
	
	^targetLanguageRange specificity
	
]

{ #category : 'private' }
MonoglotNaturalLanguageTranslator >> translationAt: hash put: translatedString [

  translations at: hash put: translatedString
]

{ #category : 'configuring' }
MonoglotNaturalLanguageTranslator >> translationFor: string is: translatedString [

  ^ self translationAt: ( self hashCodeFor: string unescaped ) put: translatedString unescaped
]

{ #category : 'localization' }
MonoglotNaturalLanguageTranslator >> withTranslationOf: string do: block [

  translations at: ( self hashCodeFor: string ) ifPresent: block
]
