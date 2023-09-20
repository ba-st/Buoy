Class {
	#name : #StringExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Collections-Tests'
}

{ #category : #tests }
StringExtensionsTest >> testCapitalized [ 

	self
		assert: 'mElViN' capitalized
		equals: 'MElViN'
]

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
StringExtensionsTest >> testFindTokens [

	self
		assert: ('find tokens' findTokens: #( $a $f $n ))
		hasTheSameElementsInTheSameOrderThat: #( 'i' 'd toke' 's' );
		
		assert: ('éèàôüößäóñíá' findTokens: $á)
		hasTheSameElementsInTheSameOrderThat: #( 'éèàôüößäóñí' );
		
		assert: ('' substrings: '')
		hasTheSameElementsInTheSameOrderThat: #(  );
		
		assert: ('test this' substrings: 't')
		hasTheSameElementsInTheSameOrderThat: #( 'es' ' ' 'his' )
]

{ #category : #tests }
StringExtensionsTest >> testIncludesSubstring [

	self
		assert: ('testing this string' includesSubstring: 'ring');
		assert: ('éèàôüößäóñíá' includesSubstring: '');
		assert: ('' includesSubstring: '');
		deny: ('éèàôüößäóñíá' includesSubstring: 'a');
		assert: ('éèàôüößäóñíá' includesSubstring: 'ßä');
		deny: ('kjdsnlksjdf' includesSubstring: 'K')
]

{ #category : #tests }
StringExtensionsTest >> testIsAllDigits [

	self
		assert: '2345' isAllDigits;
		assert: '0002345' isAllDigits;
		deny: '2345.88' isAllDigits;
		deny: '' isAllDigits
]

{ #category : #tests }
StringExtensionsTest >> testIsAsciiString [

	self
		assert: '' isAsciiString;
		assert: 'abcdefGHIJKL 98765,./@#%$' isAsciiString;
		deny: 'éÀ' isAsciiString
]

{ #category : #tests }
StringExtensionsTest >> testLf [

	self
		assert: String lf
		equals: (String streamContents: [ :stream | stream lf ])
]

{ #category : #tests }
StringExtensionsTest >> testLines [

	| string |
	string := '1<r>2<l>3<r><l>4<n>5' expandMacros.

	self assert: string lines equals: #( '1' '2' '3' '4' '5' )
]

{ #category : #tests }
StringExtensionsTest >> testSubstrings [

	self
		assert: '2345' substrings equals: #( '2345' );
		assert: '000 234 5' substrings equals: #( '000' '234' '5' )
]

{ #category : #tests }
StringExtensionsTest >> testTab [

	self
		assert: String tab
		equals: (String streamContents: [ :stream | stream tab ])
]

{ #category : #tests }
StringExtensionsTest >> testWithoutQuoting [

	#( '"foo"' 'foo' '''foo''' 'foo' '"foo''' '"foo''' '''foo"' '''foo"'
	   '"foo' '"foo' 'foo"' 'foo"' 'foo' 'foo' ) pairsDo: [ :before :after |
		self assert: before withoutQuoting equals: after ]
]
