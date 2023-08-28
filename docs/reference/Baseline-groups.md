# Baseline Groups & GS 64 Components

## Pharo Baseline Groups

Buoy includes the following groups in its Baseline that can be used as
loading targets:

- `Deployment` will load all the packages needed in a deployed application
- `Tests` will load the test cases
- `Tools` will load tooling extensions
- `Dependent-SUnit-Extensions` will load extensions to SUnit
- `CI` is the group loaded in the continuous integration setup, in this
  particular case it is the same as `Tests`
- `Development` will load all the needed packages to develop and contribute to
   the project

## Pharo - GS64 Development glue

`GS64-Development` is an optional group that will load `Development` and all
the packages required to develop changes applicable to GS64 in a Pharo image.

Loading this package can have unexpected consequences on to the Pharo image,
because it extends and changes some kernel classes. To load this group you will
need first to rename `DynamicVariable` to another thing because it will try to
load a GS64 version of it, and it's used during the loading stage.

Once the packages are loaded remove the extension in `Object class>>#new`
to recover the cursor in the browsers.

Other packages in the project will be marked as dirty, but this is expected;
just remember to cherry-pick the changes to commit and don't remove the changed
methods in the Pharo related packages.

## GS64 Components

Buoy includes the following components in its Rowan configuration that can be
used as loading targets:

- `Deployment` will load all the packages needed in a deployed application
- `Tests` will load the test cases
- `Dependent-SUnit-Extensions` will load extensions to SUnit
