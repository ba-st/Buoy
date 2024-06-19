"
A StringEscapingRuleTest is a test class for testing the behavior of StringEscapingRule
"
Class {
	#name : 'StringEscapingRuleTest',
	#superclass : 'TestCase',
	#category : 'Buoy-Localization-Tests',
	#package : 'Buoy-Localization-Tests'
}

{ #category : 'tests' }
StringEscapingRuleTest >> testIsAbstract [

  self assert: StringEscapingRule isAbstract
]

{ #category : 'tests' }
StringEscapingRuleTest >> testPriority [

  self
    assert: ReverseSolidusEscapingRule new priority > ControlCharactersEscapingRule new priority;
    assert: ControlCharactersEscapingRule new priority > UnicodeCharacterEscapingRule new priority
]
