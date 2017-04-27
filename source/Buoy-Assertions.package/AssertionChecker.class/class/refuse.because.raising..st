checking
refuse: aFact because: aStringOrBlockExplanation raising: errorToSignal

	| asserter |

	asserter := Asserter new.
	asserter refuse: aFact because: aStringOrBlockExplanation.

	^ self checkApplyingFailFastPolicyTo: asserter raising: errorToSignal