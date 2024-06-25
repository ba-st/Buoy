Class {
	#name : 'CurrentLocale',
	#superclass : 'DynamicVariable',
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'accessing' }
CurrentLocale class >> default [

  ^ 'en' asLanguageTag
]

{ #category : 'configuring' }
CurrentLocale class >> use: languageTagOrString during: aBlock [

  ^ self value: languageTagOrString asLanguageTag during: aBlock
]

{ #category : 'accessing' }
CurrentLocale >> default [

  ^ self class default
]
