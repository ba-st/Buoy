tests-Accessing
testWithContentDoWhenUnused

	| optional expectedExplanation |

	expectedExplanation := 'The identifier is unassigned'.

	optional := Optional unusedBecause: expectedExplanation.

	optional withContentDo: [ :theContent | self fail ]