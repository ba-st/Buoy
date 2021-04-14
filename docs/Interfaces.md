# Interfaces

An interface is useful for declaring a set of messages to be understood by the objects implementing it.

> It's not intended to be used as some kind of static type check, but to document an expected protocol.

Once you have an interface you can ask it if some object is implementing it:

```smalltalk
| interface |
interface := Interface named: 'Assertable' declaring: #( #assert: #deny: ).
interface isImplementedBy: 1
```

will return `false`

You can also ask it if an instance of some class will implement it:

```smalltalk
| interface |
interface := Interface named: 'Assertable' declaring: #( #assert: #deny: ).
interface isImplementedByInstancesOf: TestCase
```

will return `true`
