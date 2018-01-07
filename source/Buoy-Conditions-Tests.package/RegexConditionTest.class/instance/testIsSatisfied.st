tests
testIsSatisfied

	| condition |

	condition := RegexCondition matching: 'ab*'.

	self
		assert: (condition isSatisfiedBy: 'abbb');
		deny: (condition isSatisfiedBy: 'abab').
		
	condition := RegexCondition matching: '(ab)*'.
	
	self
		assert: (condition isSatisfiedBy: 'abab');
		deny: (condition isSatisfiedBy: 'abcab').
		
	condition := RegexCondition matching: '[01]'.
	
	self
		assert: (condition isSatisfiedBy: '0');
		deny: (condition isSatisfiedBy: '3');
		deny: (condition isSatisfiedBy: '11').		

	condition := RegexCondition matching: '[01]+'.
	
	self
		assert: (condition isSatisfiedBy: '10010100');
		deny: (condition isSatisfiedBy: '10001210')