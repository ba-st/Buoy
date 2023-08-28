Class {
	#name : #LanguagePlatformTest,
	#superclass : #TestCase,
	#category : #'Buoy-Metaprogramming-Tests'
}

{ #category : #tests }
LanguagePlatformTest >> testGlobalNamedIfAbsent [

	| sentinel |
	self
		assert: (LanguagePlatform current
				 globalNamed: self class name
				 ifAbsent: [ self fail ])
		equals: self class.

	sentinel := Object new.
	self
		assert: (LanguagePlatform current
				 globalNamed: #AnImplausibleGlobalName
				 ifAbsent: [ sentinel ])
		identicalTo: sentinel
]

{ #category : #tests }
LanguagePlatformTest >> testGlobalNamedIfPresentIfAbsent [

	| sentinel |
	self
		assert: (LanguagePlatform current
				 globalNamed: self class name
				 ifPresent: [ :global |
					 self assert: global equals: self class.
					 global ]
				 ifAbsent: [ self fail ])
		equals: self class.

	sentinel := Object new.
	self
		assert: (LanguagePlatform current
				 globalNamed: #AnImplausibleGlobalName
				 ifPresent: [ self fail ]
				 ifAbsent: [ sentinel ])
		identicalTo: sentinel
]

{ #category : #tests }
LanguagePlatformTest >> testIncludesGlobalNamed [

	self
		assert:
			(LanguagePlatform current includesGlobalNamed: self class name);
		deny: (LanguagePlatform current includesGlobalNamed:
					 #AnImplausibleGlobalName)
]

{ #category : #tests }
LanguagePlatformTest >> testOSLineEnding [

	self
		assert: LanguagePlatform current os lineEnding
		equals: '<n>' expandMacros
]
