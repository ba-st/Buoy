checking
enforce: aFact because: aStringOrBlockExplanation raising: errorClass

	^ (self
		applying: (RaiseOnFirstAssertionFailurePolicy raising: errorClass)
		to:
			(Asserter new
				enforce: aFact because: aStringOrBlockExplanation;
				yourself)) check