Class {
	#name : 'CurrentLocale',
	#superclass : 'DynamicVariable',
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'configuring' }
CurrentLocale class >> use: languageTagOrString during: aBlock [

  ^ self value: languageTagOrString asLanguageTag during: aBlock
]

{ #category : 'accessing' }
CurrentLocale >> default [

  ^ 'en' asLanguageTag
]
