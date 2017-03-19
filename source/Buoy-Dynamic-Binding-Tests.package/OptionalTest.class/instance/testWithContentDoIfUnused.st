tests-Accessing
testWithContentDoIfUnused

	| optional expectedContent content |

	expectedContent := 2.

	optional := Optional containing: expectedContent.

	content := optional withContentDo: [ :theContent | theContent ] ifUnused: [ self fail ].

	self assert: content equals: expectedContent