instance creation
satisfying: aCondition or: anotherCondition

	^ self satisfyingAnyOf: (Array with: aCondition with: anotherCondition)