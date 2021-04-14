# Namespaces

A namespace is responsible of binding a set of symbols to objects of various kinds, so that these objects may be referred to by name.

You can instantiate a namespace and start binding names to any kind of object:

```smalltalk
| cssConstants |
cssConstants := Namespace new.
cssConstants
  bind: #inherit to: 'inherit';
  bind: #white to: Color white
```

By default you can't bind a name already bound, but you can use the `rebind:to:` message to accomplish that.

Now it's possible to access the object bound by name:

```smalltalk
cssConstants >> #white
```

will return an object representing the white color.
