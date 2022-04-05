# Exception handling

- `on:except:do:` provides an extension to the exception handling allowing to
ignore some subclass of the exception being handled.

For example:

```smalltalk
[ 1 / 0 ] on: Error except: ZeroDivide do: [ ... ]
```

will raise an exception even when `ZeroDivide` is a subclass of `Error`
