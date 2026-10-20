"
I hold the conventions that vary between locales, such as the symbols and patterns used to format numbers.

My conventions are grouped in categories, each with its own set of property names. Buoy registers `#numbers`; other projects can register their own with `registerCategory:withPropertiesNamed:`.

The conventions of a category are loaded from JSON files where each top-level key is a language range, and each value the properties that range sets:

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
		'conventionsByCategory',
		'propertyNamesByCategory'
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

{ #category : 'class initialization' }
LocaleConventions class >> initialize [
  "Discard the current conventions, so they are created again with the current shape of the class.
	The data shipped in the repository is loaded again after loading the code."

  <ignoreForCoverage>
  current := nil
]

{ #category : 'accessing' }
LocaleConventions class >> numberPropertyNames [

  ^ #( #decimalSeparator #groupSeparator #minimumGroupingDigits #plusSign #minusSign #percentSign
       #perMilleSign #numberFormat #percentFormat )
]

{ #category : 'private' }
LocaleConventions >> assertIs: aPropertyName propertyOf: aCategory [

  self assertIsRegisteredCategory: aCategory.
  AssertionChecker
    enforce: [ ( propertyNamesByCategory at: aCategory ) includes: aPropertyName ]
    because:
    aPropertyName asString , ' is not a convention of the ' , aCategory asString , ' category'
]

{ #category : 'private' }
LocaleConventions >> assertIsRegisteredCategory: aCategory [

  AssertionChecker
    enforce: [ propertyNamesByCategory includesKey: aCategory ]
    because: aCategory asString , ' is not a registered category of conventions'
]

{ #category : 'initialization' }
LocaleConventions >> initialize [

  super initialize.
  conventionsByCategory := Dictionary new.
  propertyNamesByCategory := Dictionary new.
  self registerCategory: #numbers withPropertiesNamed: self class numberPropertyNames
]

{ #category : 'configuring' }
LocaleConventions >> loadJSONConventionsOf: aCategory from: aFileReference [
  "Merges into the receiver the conventions of the category in the file, property by property,
	so the ones in the file override the ones already loaded."

  self loadJSONConventionsOf: aCategory fromString: aFileReference contents
]

{ #category : 'configuring' }
LocaleConventions >> loadJSONConventionsOf: aCategory fromString: aString [
  "Merges into the receiver the conventions of the category in the JSON string, property by property,
	so the ones in the string override the ones already loaded."

  self merge: ( STON fromString: aString ) intoConventionsOf: aCategory asSymbol
]

{ #category : 'configuring' }
LocaleConventions >> loadJSONNumberConventionsFrom: aFileReference [
  "Merges into the receiver the number conventions in the file, property by property,
	so the ones in the file override the ones already loaded."

  self loadJSONConventionsOf: #numbers from: aFileReference
]

{ #category : 'configuring' }
LocaleConventions >> loadJSONNumberConventionsFromString: aString [
  "Merges into the receiver the number conventions in the JSON string, property by property,
	so the ones in the string override the ones already loaded."

  self loadJSONConventionsOf: #numbers fromString: aString
]

{ #category : 'private' }
LocaleConventions >> merge: propertiesByRange intoConventionsOf: aCategory [

  | conventionsByRange |
  self assertIsRegisteredCategory: aCategory.
  conventionsByRange := conventionsByCategory at: aCategory.
  propertiesByRange keysAndValuesDo: [ :rangeString :properties |
      | conventions |
      conventions := conventionsByRange
                       at: ( LanguageRange fromString: rangeString )
                       ifAbsentPut: [ Dictionary new ].
      properties keysAndValuesDo: [ :name :value |
          | propertyName |
          propertyName := name asSymbol.
          self assertIs: propertyName propertyOf: aCategory.
          conventions at: propertyName put: value
        ]
    ]
]

{ #category : 'accessing' }
LocaleConventions >> numberPropertyNamed: aName for: aLanguageTagOrString [

  ^ self propertyNamed: aName of: #numbers for: aLanguageTagOrString
]

{ #category : 'accessing' }
LocaleConventions >> propertyNamed: aName of: aCategory for: aLanguageTagOrString [

  | category propertyName languageTag conventionsByRange |
  category := aCategory asSymbol.
  propertyName := aName asSymbol.
  self assertIs: propertyName propertyOf: category.
  languageTag := aLanguageTagOrString asLanguageTag.
  conventionsByRange := conventionsByCategory at: category.
  ( self rangesIn: conventionsByRange matching: languageTag ) do: [ :range |
      ( conventionsByRange at: range ) at: propertyName ifPresent: [ :value | ^ value ] ].
  ^ ObjectNotFound signal:
      'There''s no ' , propertyName asString , ' convention for ' , languageTag asString
]

{ #category : 'private' }
LocaleConventions >> rangesIn: conventionsByRange matching: aLanguageTag [
  "Answers the ranges matching the tag, from the most specific to the least one"

  ^ ( conventionsByRange keys select: [ :range | range matches: aLanguageTag ] ) sorted: [ :a :b |
        a specificity >= b specificity ]
]

{ #category : 'configuring' }
LocaleConventions >> registerCategory: aCategory withPropertiesNamed: aCollection [
  "Registering a category again replaces its property names, keeping the conventions already loaded"

  | category |
  category := aCategory asSymbol.
  propertyNamesByCategory
    at: category
    put: ( aCollection collect: [ :name | name asSymbol ] ) asArray.
  conventionsByCategory at: category ifAbsentPut: [ Dictionary new ]
]
