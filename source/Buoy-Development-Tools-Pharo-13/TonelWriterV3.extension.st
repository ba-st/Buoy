Extension { #name : 'TonelWriterV3' }

{ #category : '*Buoy-Development-Tools-Pharo-13' }
TonelWriterV3 >> typeClassDefinitionOf: aClassDefinition [

	| definition |
	definition := OrderedDictionary new.
	self
		at: #name put: aClassDefinition className in: definition;
		at: #superclass put: aClassDefinition superclassName in: definition.
	aClassDefinition type = #normal ifFalse: [ self at: #type put: aClassDefinition type in: definition ].
	aClassDefinition hasTraitComposition ifTrue: [ definition at: #traits put: aClassDefinition traitCompositionString ].
	aClassDefinition hasClassTraitComposition ifTrue: [ definition at: #classTraits put: aClassDefinition classTraitCompositionString ].
	aClassDefinition instVarNames ifNotEmpty: [ :vars | definition at: #instVars put: vars asArray ].
	(aClassDefinition variables
		 select: #isClassVariable
		 thenCollect: #name) ifNotEmpty: [ :vars | definition at: #classVars put: vars asArray ].
	(aClassDefinition variables
		 select: #isPoolImport
		 thenCollect: #name) ifNotEmpty: [ :vars | definition at: #pools put: vars asArray ].
	aClassDefinition classInstVarNames ifNotEmpty: [ :vars | definition at: #classInstVars put: vars asArray ].
	self setPackageInfoOf: aClassDefinition in: definition.
	"Write gs_options if available as class properties"
	(aClassDefinition actualClass ifNotNil:[:actualClass | (actualClass  propertyAt: #gs_options) ifNotNil: [ :options | definition at: #gs_options put: options ]]).
	^ self toSTON: definition
]
