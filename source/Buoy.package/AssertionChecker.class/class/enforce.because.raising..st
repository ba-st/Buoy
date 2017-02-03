checking
enforce: aFact because: aStringOrBlockExplanation raising: errorToSignal

	| asserter |

	asserter := Asserter new.
	asserter enforce: aFact because: aStringOrBlockExplanation.
	
	^ self checkApplyingFailFastPolicyTo: asserter raising: errorToSignal