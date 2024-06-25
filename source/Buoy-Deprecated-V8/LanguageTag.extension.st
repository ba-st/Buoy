Extension { #name : 'LanguageTag' }

{ #category : '*Buoy-Deprecated-V8' }
LanguageTag class >> from: aSubtagCollection [

  self
    deprecated: 'Use composedOf: instead'
    transformWith: '`@receiver from: `@subtags' -> '`@receiver composedOf: `@subtags'.

  ^ self composedOf: aSubtagCollection
]
