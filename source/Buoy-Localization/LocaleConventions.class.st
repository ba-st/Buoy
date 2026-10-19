"
I hold the conventions that vary between locales, such as the symbols and patterns used to format numbers.

My data is loaded from JSON files where each top-level key is a language range, and each value the properties that range sets:

```json
{
	""*"": { ""decimalSeparator"": ""."", ""groupSeparator"": "","" },
	""es"": { ""decimalSeparator"": "","", ""groupSeparator"": ""."" }
}
```

A property is resolved for a language tag from the most specific matching range down to `*`, one property at a time.

Buoy loads the data in its `locales` folder when it is loaded. Applications can load more files to add locales or override the existing ones.
"
Class {
	#name : 'LocaleConventions',
	#superclass : 'Object',
	#instVars : [
		'numberConventionsByRange'
	],
	#classInstVars : [
		'current'
	],
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'accessing' }
LocaleConventions class >> current [

  ^ current ifNil: [ current := self new ]
]

{ #category : 'accessing' }
LocaleConventions class >> numberPropertyNames [

  ^ #( #decimalSeparator #groupSeparator #minimumGroupingDigits #plusSign #minusSign #percentSign
       #perMilleSign #numberFormat #percentFormat )
]

{ #category : 'private' }
LocaleConventions >> assertIsNumberPropertyName: aSymbol [

  AssertionChecker
    enforce: [ self class numberPropertyNames includes: aSymbol ]
    because: aSymbol asString , ' is not a number formatting convention'
]

{ #category : 'initialization' }
LocaleConventions >> initialize [

  super initialize.
  numberConventionsByRange := Dictionary new
]

{ #category : 'configuring' }
LocaleConventions >> loadJSONNumberConventionsFrom: aFileReference [
  "Merges into the receiver the number conventions in the file, property by property,
	so the ones in the file override the ones already loaded."

  self loadJSONNumberConventionsFromString: aFileReference contents
]

{ #category : 'configuring' }
LocaleConventions >> loadJSONNumberConventionsFromString: aString [
  "Merges into the receiver the number conventions in the JSON string, property by property,
	so the ones in the string override the ones already loaded."

  self mergeNumberConventions: ( STON fromString: aString )
]

{ #category : 'private' }
LocaleConventions >> mergeNumberConventions: propertiesByRange [

  propertiesByRange keysAndValuesDo: [ :rangeString :properties |
      | conventions |
      conventions := numberConventionsByRange
                       at: ( LanguageRange fromString: rangeString )
                       ifAbsentPut: [ Dictionary new ].
      properties keysAndValuesDo: [ :name :value |
          | propertyName |
          propertyName := name asSymbol.
          self assertIsNumberPropertyName: propertyName.
          conventions at: propertyName put: value
        ]
    ]
]

{ #category : 'accessing' }
LocaleConventions >> numberPropertyNamed: aName for: aLanguageTagOrString [

  | propertyName languageTag |
  propertyName := aName asSymbol.
  self assertIsNumberPropertyName: propertyName.
  languageTag := aLanguageTagOrString asLanguageTag.
  ( self rangesMatching: languageTag ) do: [ :range |
      ( numberConventionsByRange at: range ) at: propertyName ifPresent: [ :value | ^ value ] ].
  ^ ObjectNotFound signal:
      'There''s no ' , propertyName asString , ' convention for ' , languageTag asString
]

{ #category : 'private' }
LocaleConventions >> rangesMatching: aLanguageTag [
  "Answers the ranges matching the tag, from the most specific to the least one"

  ^ ( numberConventionsByRange keys select: [ :range | range matches: aLanguageTag ] ) sorted: [ :a :b |
        a specificity >= b specificity ]
]
