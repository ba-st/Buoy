# Exception handling

- `on:except:do:` provides an extension to the exception handling machinery to allow handling an exception, but ignoring some subclass of it. For example:

```smalltalk
[ 1 / 0 ] on: Error except: ZeroDivide do: [ ... ]
```

will raise an exception even when `ZeroDivide` is a subclass of `Error`
