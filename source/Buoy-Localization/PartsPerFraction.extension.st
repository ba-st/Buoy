Extension { #name : 'PartsPerFraction' }

{ #category : '*Buoy-Localization' }
PartsPerFraction class >> localizedFormatterFor: aLanguageTag configuredBy: aBlock [

  ^ self subclassResponsibility
]

{ #category : '*Buoy-Localization' }
PartsPerFraction >> localized [

  ^ self localizedWith: [ :options |  ]
]

{ #category : '*Buoy-Localization' }
PartsPerFraction >> localizedWith: aBlock [

  ^ ( self class localizedFormatterFor: CurrentLocale value configuredBy: aBlock ) format:
      self value
]
