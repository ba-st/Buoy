I'm a Condition.
I'm a CompositeCondition

I test that the conditions involved are satisfied, either all or any depending on how I was created.

Example:
CompositeCondition
	satisfying: (ArithmeticCondition toBeGreaterOrEqualThan: 0)
	and: (ArithmeticCondition toBeLessOrEqualThan: 2).
