# Extensions to the base library

This package include some extensions to base classes with the intention of improving readability.

- `Boolean>>#then:` is the equivalent to `ifTrue:`, except that `nil` is not returned if the condition is false.
- `Boolean>>#then:otherwise:` is the equivalent of `ifTrue:ifFalse:`
- `BlockClosure>>#unless:` evaluates the block unless the condition is met. It's used to emphasize the block action as the usual case. For example:

```smalltalk
[ html
    attributeAt: 'x:num'
    put: (self xnumAmountFormatter format: amount)]
      unless: amount isUndefined
```

- `BlockClosure>>#unless:inWhichCase:` is used when you want to emphasize a positive action, and in the exceptional case that the condition is met, evaluate an exceptional action.
For example:

```smalltalk
[self createLabelFor: aParameter] unless: aParameter isOptional
      inWhichCase: [self createOptionalWidgetsFor: aParameter].
```

## Conditions

A condition is used to test a value against it.

### Arithmetic Conditions

Arithmetic conditions are used to test magnitudes against a provided value.

```smalltalk
| condition |
condition := ArithmeticCondition toBeEqualTo: 1.
condition isSatisfiedBy: 1. "returns true"
condition isSatisfiedBy: 0. "returns false"
```

### Negated Condition

You can easily build the opposite of a condition sending #negated to it.

```smalltalk
| condition |
condition := (ArithmeticCondition toBeEqualTo: 1) negated.
condition isSatisfiedBy: 1. "returns false"
condition isSatisfiedBy: 0. "returns true"
```

### Composite Condition

You can compose conditions using AND or OR as a logic operator. A simple AND composition could be used to test if a number is within an interval.

```smalltalk
| condition |
condition := (ArithmeticCondition  toBeGreaterThan: 0)
    and: (ArithmeticCondition  toBeLessThan: 2).
condition isSatisfiedBy: 0. "returns false"
condition isSatisfiedBy: 1. "returns true"
condition isSatisfiedBy: 2. "returns false"
```

A simple OR composition.

```smalltalk
| condition |
condition :=(ArithmeticCondition  toBeEqualTo: 1)
    or: (ArithmeticCondition  toBeEqualTo: 2).
condition isSatisfiedBy: 1. "returns true"
condition isSatisfiedBy: 2. "returns true"
condition isSatisfiedBy: 0. "returns false"
```

### Regex Condition

RegexCondition could be used to test a string against a regular expression.

```smalltalk
| condition |
condition := RegexCondition matching: 'ab*'.
condition isSatisfiedBy: 'abbb'). "returns true"
condition isSatisfiedBy: 'abab'). "returns false"
```
