# Assertions Tutorial

For this tutorial we will use a simple model: ISO 3166-1 Alpha-2 codes. This codes are two-letter country codes defined in the corresponding [ISO standard](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2).

## Single Conditions

So let's start with the most basic condition this kind of code must respect: a valid code consists of exactly two letters.

Open a playground and `Do it` this:

```smalltalk
| code |

code := 'AR'.

AssertionChecker
  enforce: [ code size = 2 ]
  because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters'
```

Now change `code` to something failing the condition like `'ARG'` and `Do it` again, you should get a Debugger with an `AssertionFailed` exception raised.

So, to enforce a single condition we can send the message `enforce:because:` to `AssertionChecker` and if the condition is not met an `AssertionFailed` exception is raised including the provided explanation.

## Multiple Conditions

Now in the previous example we missed some of the requirements of the standard: a valid code consists only of letters. So let's rewrite our example:

```smalltalk
| code |

code := 'AR'.

AssertionCheckerBuilder new
  checking: [ :asserter |
    asserter
      enforce: [ code size = 2 ]
      because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters';
      enforce: [ code allSatisfy: #isLetter ]
      because: 'ISO 3166-1 Alpha-2 codes must only contain letters'
    ];
  buildAndCheck
```

Note that in this case we're creating an `AssertionCheckerBuilder` and configuring all the conditions to enforce. Let's try now replacing `code` with `'AR3'` and `Do it` again. By default all the conditions to enforce are checked so you should get an error message combining both explanations, and if you handle the raised exception you can get all the failures by sending it the message `failures`.

If you want the more usual behavior of stopping after the first failure you can configure the builder to fail fast:

```smalltalk
| code |

code := 'AR3'.

AssertionCheckerBuilder new
  failFast;
  checking: [ :asserter |
    asserter
      enforce: [ code size = 2 ]
      because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters';
      enforce: [ code allSatisfy: #isLetter ]
      because: 'ISO 3166-1 Alpha-2 codes must only contain letters'
    ];
  buildAndCheck
```

If you `Do it` you will get only the first failure, the next conditions won't even be checked.

## Conditional Checking

Sometimes you want to check a condition but only after other conditions are met. So let's make our example more complex: not every two letters combination is a valid code. Now we will consider only the officially assigned codes as valid:

```smalltalk
| code officiallyAssignedCodes |

code := 'AA'.
officiallyAssignedCodes := #('AR' 'BR' 'US').

AssertionCheckerBuilder new
  checking: [ :asserter |
    asserter
      enforce: [ code size = 2 and: [ code allSatisfy: #isLetter ]]
      because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters'
      onSuccess: [ :sucessAsserter |
        sucessAsserter
          enforce: [ officiallyAssignedCodes includes: code ]
          because: [ '<1s> is not an officially assigned code' expandMacrosWith: code ]
        ]
    ];
    buildAndCheck
```

Here we are introducing two new features:

- First `enforce:because:onSuccess:`, the main idea is that the conditions enforced in the success block will be evaluated only if the outer condition is satisfied. So we can make assumptions about what `code` looks like at this point.
- Second, using a block as the `because:` argument. This avoids creating unnecessary objects because the explanation will only be evaluated if the condition is not met. In this case the argument is a literal String, so it makes no difference.

## Refusing

Sometimes it's easier to explain a condition using negative logic, so `enforce:because:` has an opposite partner: `refuse:because:`.

```smalltalk
| code unassignedCodes |

code := 'AR'.
unassignedCodes := #('LO' 'LP' 'OU').

AssertionCheckerBuilder new
  checking: [ :asserter |
    asserter
      enforce: [ code size = 2 and: [ code allSatisfy: #isLetter ]]
      because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters'
      onSuccess: [ :sucessAsserter |
        sucessAsserter
          refuse: [ unassignedCodes includes: code ]
          because: [ '<1s> is an unassigned code' expandMacrosWith: code ]
        ]
    ];
    buildAndCheck
```

## Configuring the error to raise

If not specified the library will raise `AssertionFailed` when some check fails. If you want to raise a different kind of error there are two ways to configure it:

For single condition checks you can use `enforce:because:raising:` or `refuse:because:raising:`.

```smalltalk
| code |

code := 'AR'.

AssertionChecker
  enforce: [ code size = 2 ]
  because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters'
  raising: Error
```

When using the builder you should use:

```smalltalk
| code |

code := 'AR'.

AssertionCheckerBuilder new
  raising: InstanceCreationFailed;
  checking: [ :asserter |
    asserter
      enforce: [ code size = 2 ]
      because: 'ISO 3166-1 Alpha-2 codes must have exactly two letters';
      enforce: [ code allSatisfy: #isLetter ]
      because: 'ISO 3166-1 Alpha-2 codes must only contain letters'
    ];
  buildAndCheck
```

but keep in mind when using the builder that the error to raise must understand `signalAll:` in order to work.
