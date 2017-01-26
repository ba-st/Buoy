instance creation
justCheck: aFact because: aStringOrBlockExplanation

	^ (self
		applying: RaiseOnFirstAssertionFailurePolicy new
		to:
			(Asserter new
				affirm: aFact because: aStringOrBlockExplanation;
				yourself)) check