Class {
	#name : 'LanguagePlatformTest',
	#superclass : 'TestCase',
	#instVars : [
		'variableForTesting'
	],
	#category : 'Buoy-Metaprogramming-Tests',
	#package : 'Buoy-Metaprogramming-Tests'
}

{ #category : 'tests' }
LanguagePlatformTest >> testAtInstanceVariableNamedOnPut [

	self assert: variableForTesting isNil.

	LanguagePlatform current atInstanceVariableNamed: 'variableForTesting' on: self put: 8.

	self assert: variableForTesting equals: 8
]

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
LanguagePlatformTest >> testGlobalNamedIfAbsentPut [

  | globalName globalValue sentinel |
  globalName := #TestGlobalNamedIfAbsentPut.
  globalValue := Object new.

  LanguagePlatform current globalNamed: globalName ifAbsentPut: globalValue.

  self
    assert: ( LanguagePlatform current globalNamed: globalName ifAbsent: [ self fail ] )
    identicalTo: globalValue.

  LanguagePlatform current removeGlobalNamed: globalName ifAbsent: [ self fail ].

  sentinel := Object new.
  self
    assert: ( LanguagePlatform current globalNamed: globalName ifAbsent: [ sentinel ] )
    identicalTo: sentinel
]

{ #category : 'tests' }
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

{ #category : 'tests' }
LanguagePlatformTest >> testIncludesGlobalNamed [

	self
		assert:
			(LanguagePlatform current includesGlobalNamed: self class name);
		deny: (LanguagePlatform current includesGlobalNamed:
					 #AnImplausibleGlobalName)
]

{ #category : 'tests' }
LanguagePlatformTest >> testInstanceVariableNamedOn [

  | value |
  LanguagePlatform current atInstanceVariableNamed: 'variableForTesting' on: self put: 8.

  value := LanguagePlatform current instanceVariableNamed: 'variableForTesting' on: self.

  self assert: value equals: 8
]

{ #category : 'tests' }
LanguagePlatformTest >> testMessageDigest [

  self
    assert: ( LanguagePlatform current messageDigest: '' )
    equals:
      #[ 227 176 196 66 152 252 28 20 154 251 244 200 153 111 185 36 39 174 65 228 100 155 147 76 164
         149 153 27 120 82 184 85 ];
    assert:
      ( LanguagePlatform current messageDigest: 'The quick brown fox jumps over the lazy dog' )
    equals:
      #[ 215 168 251 179 7 215 128 148 105 202 154 188 176 8 46 79 141 86 81 228 109 60 219 118 45
         2 208 191 55 201 229 146 ]
]

{ #category : 'tests' }
LanguagePlatformTest >> testNewProcessNamedEvaluatingAt [

  | wasEvaluated semaphore process |
  wasEvaluated := false.
  semaphore := Semaphore new.

  process := LanguagePlatform current
               newProcessNamed: 'Testing LanguagePlatform fork'
               evaluating: [
                   wasEvaluated := true.
                   semaphore signal
                 ]
               at: Processor userBackgroundPriority.

  self
    assert: process name equals: 'Testing LanguagePlatform fork';
    assert: process priority equals: Processor userBackgroundPriority.

  process resume.
  semaphore wait.

  self assert: wasEvaluated
]

{ #category : 'tests' }
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

{ #category : 'tests' }
LanguagePlatformTest >> testOSLineEnding [

	self
		assert: LanguagePlatform current os lineEnding
		equals: '<n>' expandMacros
]

{ #category : 'tests' }
LanguagePlatformTest >> testRemoveGlobalNamedIfAbsent [

  | wasFound |
  wasFound := true.
  LanguagePlatform current
    removeGlobalNamed: #AnImplausibleGlobalName
    ifAbsent: [ wasFound := false ].
  self deny: wasFound
]
