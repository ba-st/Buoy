# How to support GS64 class options

GemStone/S 64 includes some options during class creation that change the
behavior of instances of that class.

Rowan has support to specify these options using the Tonel format
by filling the `gs_options` metadata in the class creation section. However,
Pharo will be default remove this metadata when committing code, which loses these
options. To avoid this behavior and retain the options, load the `Tool` group
and send in the class `initialize` message one of the following messages:

- `makeInstancesDbTransient`
- `makeInstancesInvariant`
- `makeInstancesNonPersistent`

This will configure the options as class properties in Pharo, which will then be
used by the Tonel Writer to set these options to the metadata.
