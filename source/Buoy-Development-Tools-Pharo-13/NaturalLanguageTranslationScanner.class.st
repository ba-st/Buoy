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
	#category : 'Buoy-Development-Tools-Pharo-13',
	#package : 'Buoy-Development-Tools-Pharo-13'
}

{ #category : 'examples' }
NaturalLanguageTranslationScanner class >> example [

  <ignoreForCoverage>
  <example>
  ^ ( self forProjectNamed: 'Buoy' ) export
]

{ #category : 'instance creation' }
NaturalLanguageTranslationScanner class >> forProjectNamed: aProjectName [

  ^ self new initializeForProjectNamed: aProjectName
]

{ #category : 'exporting' }
NaturalLanguageTranslationScanner >> export [

  ^ self exportTo:
      self repositoryLocalesDirectory
      / ( '<1s>.json' expandMacrosWith: self projectName asLowercase )
]

{ #category : 'exporting' }
NaturalLanguageTranslationScanner >> export: stringsToTranslateByCategory on: writeStream [

  | translator output |
  translator := MonoglotNaturalLanguageTranslator for: 'en' asLanguageRange.
  output := OrderedDictionary new.
  stringsToTranslateByCategory keysAndValuesDo: [ :category :stringsToTranslate |
      | translations |
      translations := OrderedDictionary new.
      stringsToTranslate do: [ :string |
          translations at: ( translator hashCodeFor: string ) hex put: string ].
      output at: category put: translations
    ].
  STONJSON put: output onStreamPretty: writeStream.
  writeStream lf
]

{ #category : 'exporting' }
NaturalLanguageTranslationScanner >> exportOn: writeStream [

  | stringsToTranslate |
  stringsToTranslate := SortedCollection new.
  self scanProjectMethodsCollectingTranslationsIn: stringsToTranslate.
  self
    export: ( OrderedDictionary new
          at: self projectName put: stringsToTranslate;
          yourself )
    on: writeStream
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

{ #category : 'accessing' }
NaturalLanguageTranslationScanner >> repositoryLocalesDirectory [

  ^ targetRepository repositoryDirectory / 'locales' / 'en'
]

{ #category : 'private' }
NaturalLanguageTranslationScanner >> scanProjectMethodsCollectingTranslationsIn: stringsToTranslate [

  ( SearchMethodsForLocalizationMessagesRule collectingTranslationsIn: stringsToTranslate )
    runOnEnvironment: environment
]
