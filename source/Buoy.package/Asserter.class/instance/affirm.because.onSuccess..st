configuring
affirm: aFact because: anExplanationStringOrBlock onSuccess: aSuccessAction

	checks add: (AssertionCheck checking: aFact onSuccess: [ :policy | self value: aSuccessAction applying: policy ] onFailure: anExplanationStringOrBlock)