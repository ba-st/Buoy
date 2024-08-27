"
I'm a tool scanning the source code of a project to detect senders of the localization messages to string literals,
so they can be exported and later translated.

Use me with:
```smalltalk
(NaturalLanguageTranslationScanner forProjectNamed: 'ProjectName') export
```
"
Class {
	#name : 'NaturalLanguageTranslationScanner',
	#superclass : 'Object',
	#instVars : [
		'targetRepository',
		'environment'
	],
	#category : 'Buoy-Development-Tools-Pharo-12',
	#package : 'Buoy-Development-Tools-Pharo-12'
}

{ #category : 'instance creation' }
NaturalLanguageTranslationScanner class >> forProjectNamed: aProjectName [

  ^ self new initializeForProjectNamed: aProjectName
]

{ #category : 'exporting' }
NaturalLanguageTranslationScanner >> export [

  ^ self exportTo: targetRepository repositoryDirectory / 'locales' / 'en'
      / ( '<1s>.json' expandMacrosWith: self projectName asLowercase )
]

{ #category : 'exporting' }
NaturalLanguageTranslationScanner >> exportOn: writeStream [

  | stringsToTranslate translator translations |
  stringsToTranslate := SortedCollection new.
  self scanProjectMethodsCollectingTranslationsIn: stringsToTranslate.
  translator := MonoglotNaturalLanguageTranslator for: 'en' asLanguageRange.
  translations := OrderedDictionary new.
  stringsToTranslate do: [ :string |
      translations at: ( translator hashCodeFor: string ) hex put: string ].

  ( NeoJSONWriter on: writeStream )
    prettyPrint: true;
    nextPut: ( OrderedDictionary new
          at: self projectName put: translations;
          yourself ).
  writeStream lf
]

{ #category : 'exporting' }
NaturalLanguageTranslationScanner >> exportTo: targetFileReference [

  targetFileReference
    ensureCreateFile;
    writeStreamDo: [ :stream | self exportOn: stream ]
]

{ #category : 'initialization' }
NaturalLanguageTranslationScanner >> initializeForProjectNamed: aProjectName [

  targetRepository := IceRepository registry
                        detect: [ :repository | repository name = aProjectName ]
                        ifNone: [
                            ObjectNotFound signal:
                              ( 'Missing repository for project named <1s>' expandMacrosWith:
                                  aProjectName )
                          ].
  environment := RBBrowserEnvironment new forPackageNames:
                   ( targetRepository project packageNames select: [ :name |
                         PackageOrganizer default hasPackage: name ] )
]

{ #category : 'accessing' }
NaturalLanguageTranslationScanner >> projectName [

  ^ targetRepository name
]

{ #category : 'private' }
NaturalLanguageTranslationScanner >> scanProjectMethodsCollectingTranslationsIn: stringsToTranslate [

  | searchRule |
  searchRule := RBParseTreeLintRule new.
  searchRule matcher
    matches: '`#string localized'
    do: [ :node :answer | stringsToTranslate add: node receiver value ];
    matches: '`#string localizedWithAll: `@values'
    do: [ :node :answer | stringsToTranslate add: node receiver value ].
  searchRule runOnEnvironment: environment
]
