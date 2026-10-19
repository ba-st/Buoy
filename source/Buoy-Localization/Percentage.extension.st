Extension { #name : 'Percentage' }

{ #category : '*Buoy-Localization' }
Percentage class >> localizedFormatterFor: aLanguageTag configuredBy: aBlock [

  ^ LocalizedNumberFormatter percentagesFor: aLanguageTag configuredBy: aBlock
]
