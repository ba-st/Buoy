tests-Accessing
testWithContentDo

	| optional expectedContent content |

	expectedContent := 2.
	content := 1.
	
	optional := Optional containing: expectedContent.

	optional withContentDo: [ :theContent | content := theContent ].

	self assert: content equals: expectedContent