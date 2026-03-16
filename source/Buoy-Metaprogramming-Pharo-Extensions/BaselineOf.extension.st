Extension { #name : 'BaselineOf' }

{ #category : '*Buoy-Metaprogramming-Pharo-Extensions' }
BaselineOf >> withSourceDirectoryReferenceDo: aBlock [
  "Attempts to identify the local source directory.
   This approach works across several Pharo versions and supports different loading mechanisms"

  self class environment at: #IceRepository ifPresent: [ :icebergRepository |
      | sources |
      sources := icebergRepository registry
                   detect: [ :repository | repository includesPackageNamed: self class name ]
                   ifFound: [ :repository | repository project sourceDirectoryReference ]
                   ifNone: [
                       | repositoriesSpec repositorySpec |
                       repositoriesSpec := self project projectPackage repositories.
                       repositorySpec := repositoriesSpec detect: [ :spec | true ].
                       ( repositorySpec description withoutPrefix: 'tonel://' ) asFileReference
                     ].
      aBlock value: sources
    ]
]
