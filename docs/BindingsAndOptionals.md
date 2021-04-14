# Bindings and Optionals

## Bindings

A binding is useful for describing situations when there's a need for a required value that can be missing at the beginning. As this is a required value, the contract is to ask for it, and in case it is still missing we will raise an exception.

```smalltalk
| definedBinding undefinedBinding |
definedBinding := Binding to: 1.
definedBinding content.  "1"
undefinedBinding := Binding undefinedExplainedBy: 'Please set the default count.'.
undefinedBinding content "Raises and exception"
```

## Optionals

An optional is useful for describing situations when we have an object that can either be present or not. In some ways it's similar to the Maybe monad, but it does not pretend to be a monad.

So let's say we have a user interface where we want to show the details of some file the user has to upload. At the beginning there is no file so we can start with an unused optional:

```smalltalk
fileOptional := Optional unused.
```

and we can have the following rendering code:

```smalltalk
fileOptional withContentDo: [:file | self renderDetailsOf: file]
```

The first time we render our page we don't have a file, and so we won't render anything. Now we can let the user upload a file and change the optional:

```smalltalk
fileOptional := Optional containing: self uploadFile
```

and now the rendering code will take care of rendering the file details.

This is the simplest use, now suppose we want to take some action in case the file is not yet uploaded. We can change the rendering code to:

```smalltalk
fileOptional
  withContentDo: [ :file | self renderDetailsOf: file ]
  ifUnused: [ self renderUploadInstructions ]
```

### Combinations

We can transform an optional:

```smalltalk
fileOptional return: [:file | file asUrl ]
```

This will produce a new optional that will have an URL based on the file, or an unused one in case the file is missing.

We can easily combine two optionals:

```smalltalk
fileOptional
  with: fileExtensionOptional
  return: [:fileName : fileExtension |
    '<1s>.<2s>' expandMacrosWith: fileName with: fileExtension ]
```

This will produce a new optional that will have the concatenation as its content, or an unused one in case some part is missing.

If we have a list of optionals it's possible to combine them to get a new optional as a result. So suppose we have a list of possible numbers and we want to get the sum only if all are available. We can do that by sending the following message:

```smalltalk
Optional
  withAll: numberOptionals
  return: [:addends | addends sum ]
```

So we will get a new optional that contains the sum in case all the possible numbers are available, or an unused optional in case some number is not available. In that case we are performing the computation over a collection of the values. It can be expressed for each step, with an injection:

```smalltalk
Optional
  forEvery: numberOptionals
  injectInto: [:sum :addend | sum + addend ]
```
