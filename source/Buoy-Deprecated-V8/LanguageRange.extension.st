Extension { #name : 'LanguageRange' }

{ #category : '*Buoy-Deprecated-V8' }
LanguageRange class >> from: aSubtagCollection [

  self
    deprecated: 'Use composedOf: instead'
    transformWith: '`@receiver from: `@subtags' -> '`@receiver composedOf: `@subtags'.
  ^ self composedOf: aSubtagCollection
]
