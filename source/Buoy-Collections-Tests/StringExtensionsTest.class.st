Class {
	#name : #StringExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Collections-Tests'
}

{ #category : #tests }
StringExtensionsTest >> testCr [

	self
		assert: String cr
		equals: (String streamContents: [ :stream | stream cr ])
]

{ #category : #tests }
StringExtensionsTest >> testCrlf [

	self assert: String crlf equals: (String streamContents: [ :stream |
			 stream
				 cr;
				 lf ])
]

{ #category : #tests }
StringExtensionsTest >> testExpandMacros [

	self
		assert: '<t><r><l>' expandMacros
		equals: (String streamContents: [ :stream |
				 stream
					 tab;
					 cr;
					 lf ])
]

{ #category : #tests }
StringExtensionsTest >> testExpandMacrosSkip [

	self assert: '%<' expandMacros equals: '<'
]

{ #category : #tests }
StringExtensionsTest >> testExpandMacrosTernary [

	self
		assert: ('<1?success:error>' expandMacrosWith: true)
		equals: 'success';
		assert: ('<1?success:error>' expandMacrosWith: false)
		equals: 'error'
]

{ #category : #tests }
StringExtensionsTest >> testExpandMacrosWithArguments [

	self
		assert: ('<1s>' expandMacrosWithArguments: { 'str''ing' })
		equals: 'str''ing';
		assert: ('<1p>' expandMacrosWithArguments: { 'str''ing' })
		equals: '''str''''ing''';
		assert: ('<1p>: <2p>' expandMacrosWith: 'Number' with: 5)
		equals: '''Number'': 5'
]

{ #category : #tests }
StringExtensionsTest >> testLf [

	self
		assert: String lf
		equals: (String streamContents: [ :stream | stream lf ])
]
