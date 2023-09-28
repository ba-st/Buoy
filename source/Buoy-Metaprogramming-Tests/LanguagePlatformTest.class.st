Class {
	#name : #LanguagePlatformTest,
	#superclass : #TestCase,
	#instVars : [
		'variableForTesting'
	],
	#category : #'Buoy-Metaprogramming-Tests'
}

{ #category : #tests }
LanguagePlatformTest >> testAtInstanceVariableNamedOnPut [

	self assert: variableForTesting isNil.

	LanguagePlatform current atInstanceVariableNamed: 'variableForTesting' on: self put: 8.

	self assert: variableForTesting equals: 8
]

{ #category : #tests }
LanguagePlatformTest >> testForkNamedAt [

	| wasEvaluated semaphore |
	wasEvaluated := false.
	semaphore := Semaphore new.

	LanguagePlatform current
		fork: [
			wasEvaluated := true.
			semaphore signal ]
		named: 'Testing LanguagePlatform fork'
		at: Processor userBackgroundPriority.
	semaphore wait.

	self assert: wasEvaluated
]

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
LanguagePlatformTest >> testOSEnvironment [

	| os variableName isAbsent |
	os := LanguagePlatform current os.
	variableName := 'ZZZ_PHARO_TEST_ENV'.
	os environmentAt: variableName put: 'good'.

	isAbsent := true.
	os
		environmentAt: variableName
		ifPresent: [ :value |
			isAbsent := false.
			self assert: value equals: 'good' ]
		ifAbsent: [ self fail ].
	self deny: isAbsent.

	os removeEnvironmentKey: variableName.

	isAbsent := false.
	self assert: (os
			 environmentAt: variableName
			 ifPresent: [ :value | self fail ]
			 ifAbsent: [ isAbsent := true ]).

	self assert: isAbsent
]

{ #category : #tests }
LanguagePlatformTest >> testOSLineEnding [

	self
		assert: LanguagePlatform current os lineEnding
		equals: '<n>' expandMacros
]
