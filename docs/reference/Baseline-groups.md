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

## GS64 Components

Buoy includes the following components in its Rowan configuration that can be
used as loading targets:

- `Deployment` will load all the packages needed in a deployed application
- `Tests` will load the test cases
- `Dependent-SUnit-Extensions` will load extensions to SUnit
