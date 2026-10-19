Extension { #name : 'PerMille' }

{ #category : '*Buoy-Localization' }
PerMille class >> localizedFormatterFor: aLanguageTag configuredBy: aBlock [

  ^ LocalizedNumberFormatter perMillesFor: aLanguageTag configuredBy: aBlock
]
