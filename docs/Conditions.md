---
title: Conditions
---

A condition is used to test a value against it.

## Arithmetic Conditions

Arithmetic conditions are used to test magnitudes against a provided value. 

```smalltalk
| condition | 
condition := ArithmeticCondition toBeEqualTo: 1.
condition isSatisfiedBy: 1. "returns true"
condition isSatisfiedBy: 0. "returns false"
```

## Negated Condition

You can easily build the opposite of a condition sending #negated to it.

```smalltalk
| condition | 
condition := (ArithmeticCondition toBeEqualTo: 1) negated.
condition isSatisfiedBy: 1. "returns false"
condition isSatisfiedBy: 0. "returns true"
```

## Composite Condition

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

## Regex Condition

RegexCondition could be used to test a string against a regular expression.

```smalltalk
| condition |
condition := RegexCondition matching: 'ab*'.
condition isSatisfiedBy: 'abbb'). "returns true"
condition isSatisfiedBy: 'abab'). "returns false"
```
