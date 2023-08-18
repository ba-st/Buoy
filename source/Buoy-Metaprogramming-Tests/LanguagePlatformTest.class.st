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
