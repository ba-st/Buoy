instance creation
satisfyingAnyOf: aConditionCollection

	^ self toSatisfyAll: aConditionCollection using: #anySatisfy: