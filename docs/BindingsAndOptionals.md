## Bindings

A binding is useful for describing situations when there's a need for a required value but can be missing at the beginning. As this is a required value the contract is to ask for it and in case is still missing it will raise an exception.

```smalltalk
| bound unbound |
bound := Binding to: 1.
bound content.  "1"
unbound := Binding unboundBecause: 'Please set the default count.'.
unbound content "Raises and exception"
```

## Optionals

An optional is useful for describing situations when we have an object that can be present or not. In some ways it's similar to the Maybe monad but not pretends to be a monad.

So let's say we have a user interface where we want to show the details of some file the user have to upload. At the beginning there was no file uploaded so we can start with an unused optional:

```smalltalk
fileHolder := Optional unused.
```

and we can have the following rendering code:

```smalltalk
fileHolder withContentDo: [:file | self renderDetailsOf: file]
```

So in principle we don't have a file yet so we won't render anything. Now we can let the user upload a file and change the optional:

```smalltalk
fileHolder := Optional containing: self uploadFile
```

and now the rendering code will take care of rendering the file details.

This is the simplest use, now suppose we want to take some action in case the file is not yet uploaded. We can change the rendering code to:

```smalltalk
fileHolder
		withContentDo: [ :file | self renderDetailsOf: file ]
		ifUnused: [ self renderUploadInstructions ]
```

### Combinations

We can easily combine two optionals:

```smalltalk
fileNameHolder
  with: fileExtensionHolder
  return: [:fileName : fileExtension |
    '<1s>.<2s>' expandMacrosWith: fileName with: fileExtension ]
```
This will produce a new optional that can have the concatenation as his content, or an unused one in case some part is missing.

If we have a list of optionals it's possible to combine them to get a new optional as result. So suppose we have a list of possible numbers and we want to get the sum only if all are available. We can make it sending some combinatoric message:

```smalltalk
Optional
  withAll: possibleNumbers
  return: [:addends | addends sum ]
```

So we will get a new optional that contains the sum in case all the possible numbers are available, or an unused optional in case some number is not available. In that case we are performing the computation over a collection of the values. Also it can be expressed with a step:

```smalltalk
Optional
  forEvery: possibleNumbers
  injectInto: [:sum :addend | sum + addend ]
```
