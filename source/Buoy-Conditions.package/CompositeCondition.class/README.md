I'm a Condition.
I'm a CompositeCondition

I test that the composed conditions are satisfied, either all or any depending on how i was created.

Example:
CompositeCondition
	satisfying: (ArithmeticCondition toBeGreaterOrEqualThan: 0)
	and: (ArithmeticCondition toBeLessOrEqualThan: 2).