# How to support GS64 class options

GemStone/S 64 includes some options during class creation that change the
behavior of the instances.

There's support in Rowan to specify these options using the Tonel format
by filling the `gs_options` metadata in the class creation section. However,
by default Pharo will remove this metadata when committing code losing the
options. To avoid this behavior and retain the options, load the `Tool` group
and send in the class `initialize` message one of the following messages:

- `makeInstancesDbTransient`
- `makeInstancesInvariant`
- `makeInstancesNonPersistent`

This will configure the options as class properties in Pharo, and later the
Tonel Writer will use these options for the metadata.
