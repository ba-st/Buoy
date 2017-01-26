instance creation
justCheck: aFact because: aStringOrBlockExplanation

	^ (self
		applying: RaiseOnFirstAssertionFailurePolicy new
		to:
			(Asserter new
				enforce: aFact because: aStringOrBlockExplanation;
				yourself)) check