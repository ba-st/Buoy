# Assertions Tutorial

For this tutorial we will use a simple model: ISO 3166-1 Alpha-2 codes. These
codes are two-letter country codes defined in the corresponding [ISO standard](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2).

## Single Conditions

So let's start with the most basic condition this kind of code must respect: a
valid code consists of exactly two letters.

Open a playground and `Do it` this:

```smalltalk
| code |

code := 'AR'.

AssertionChecker
  enforce: [ code size = 2 ]
  because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters'
```

Now change `code` to something failing the condition like `'ARG'` and `Do it`
again, you should get a Debugger with an `AssertionFailed` exception raised.

So, to enforce a single condition we can send the message `enforce:because:` to
`AssertionChecker` and if the condition is not met an `AssertionFailed`
exception is raised including the provided explanation.

## Multiple Conditions

Now in the previous example we missed some requirements of the standard:
a valid code consists only of letters. So let's rewrite our example:

```smalltalk
| code |

code := 'AR'.

AssertionChecker
  check: [ :asserter |
    asserter
      enforce: [ code size = 2 ]
      because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters';
      enforce: [ code allSatisfy: #isLetter ]
      because: 'ISO 3166-1 Alpha-2 codes must only contain letters'
    ]
```

Note that in this case we are configuring all the conditions to enforce. Let's
try now replacing `code` with `'AR3'` and `Do it` again. By default, all the
conditions to enforce are checked, so you should get an error message combining
both explanations, and if you handle the raised exception you can get all the
failures by sending it the message `failures`.

If you want the more usual behavior of stopping after the first failure you can
configure it to fail fast:

```smalltalk
| code |

code := 'AR3'.

AssertionChecker
  check: [ :asserter |
    asserter
      enforce: [ code size = 2 ]
      because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters';
      enforce: [ code allSatisfy: #isLetter ]
      because: 'ISO 3166-1 Alpha-2 codes must only contain letters'
    ]
  configuredBy: [ :checker | checker failFast ]
```

If you `Do it` you will get only the first failure, the next conditions won't
even be checked.

## Conditional Checking

Sometimes you want to check a condition but only after other conditions are met.
So let's make our example more complex: not every two letters combination is a
valid code. Now we will consider only the officially assigned codes as valid:

```smalltalk
| code officiallyAssignedCodes |

code := 'AA'.
officiallyAssignedCodes := #('AR' 'BR' 'US').

AssertionChecker
  check: [ :asserter |
    asserter
      enforce: [ code size = 2 and: [ code allSatisfy: #isLetter ]]
      because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters'
      onSuccess: [ :successAsserter |
        successAsserter
          enforce: [ officiallyAssignedCodes includes: code ]
          because: [ '<1s> is not an officially assigned code'
            expandMacrosWith: code ]
        ]
    ]
```

Here we are introducing two new features:

- First `enforce:because:onSuccess:`, the main idea is that the conditions
  enforced in the success block will be evaluated only if the outer condition
  is satisfied. So we can make assumptions about what `code` looks like at this point.
- Second, using a block as the `because:` argument. This avoids creating
  unnecessary objects because the explanation will only be evaluated if the
  condition is not met.

## Refusing

Sometimes it's easier to explain a condition using negative logic, so
`enforce:because:` has an opposite partner: `refuse:because:`.

```smalltalk
| code unassignedCodes |

code := 'AR'.
unassignedCodes := #('LO' 'LP' 'OU').

AssertionChecker
  check: [ :asserter |
    asserter
      enforce: [ code size = 2 and: [ code allSatisfy: #isLetter ]]
      because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters'
      onSuccess: [ :successAsserter |
        successAsserter
          refuse: [ unassignedCodes includes: code ]
          because: [ '<1s> is an unassigned code' expandMacrosWith: code ]
        ]
    ]
```

## Configuring the error to raise

If not specified the library will raise `AssertionFailed` when some check fails.
If you want to raise a different kind of error there are two ways to configure it:

For single condition checks, use `enforce:because:raising:` or `refuse:because:raising:`

```smalltalk
| code |

code := 'AR'.

AssertionChecker
  enforce: [ code size = 2 ]
  because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters'
  raising: Error
```

For multiple condition checks, use:

```smalltalk
| code |

code := 'AR'.

AssertionChecker
  check: [ :asserter |
    asserter
      enforce: [ code size = 2 ]
      because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters';
      enforce: [ code allSatisfy: #isLetter ]
      because: 'ISO 3166-1 Alpha-2 codes must only contain letters'
  ]
  configuredBy: [ :checker |
    checker raising: InstanceCreationFailed
  ]
```

but keep in mind when using multiple conditions, that the error to raise must understand
`signalAll:` in order to work.
