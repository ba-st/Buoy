tests-Accessing
testWithContentDoIfUnusedWhenUnused

	| optional defaultContent content expectedExplanation |

	defaultContent := 2.
	expectedExplanation := 'The identifier is not configured.'.
	optional := Optional unusedBecause: expectedExplanation.

	content := optional
		withContentDo: [ :theContent | self fail ]
		ifUnused: [ :explanations | 
			self assertCollection: explanations hasSameElements: {expectedExplanation}.
			defaultContent ].

	self assert: content equals: defaultContent