Extension { #name : 'Number' }

{ #category : '*Buoy-Localization-Pharo-Extensions' }
Number >> localized [

  ^ ( LocalizedNumberFormatter for: CurrentLocale value ) format: self
]

{ #category : '*Buoy-Localization-Pharo-Extensions' }
Number >> localizedWith: aBlock [

  ^ ( LocalizedNumberFormatter for: CurrentLocale value configuredBy: aBlock ) format: self
]
