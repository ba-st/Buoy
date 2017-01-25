configuring
affirm: aFact because: anExplanationStringOrBlock onSuccess: aSuccessAction

	conditions add: (AssertionCheck checking: aFact onSuccess: [ :policy | self value: aSuccessAction applying: policy ] onFailure: anExplanationStringOrBlock)