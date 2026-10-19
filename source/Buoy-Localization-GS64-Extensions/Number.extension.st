Extension { #name : 'Number' }

{ #category : '*Buoy-Localization-GS64-Extensions' }
Number >> localized [

  ^ ( LocalizedNumberFormatter for: CurrentLocale value ) format: self
]

{ #category : '*Buoy-Localization-GS64-Extensions' }
Number >> localizedWith: aBlock [

  ^ ( LocalizedNumberFormatter for: CurrentLocale value configuredBy: aBlock ) format: self
]
