# Installation

## Basic Installation

You can load **Buoy** evaluating:
```smalltalk
Metacello new
	baseline: 'Buoy';
	repository: 'github://ba-st/Buoy:release-candidate/source';
	load.
```
>  Change `release-candidate` to some released version if you want a pinned version

## Using as dependency

In order to include **Buoy** as part of your project, you should reference the package in your product baseline:

```smalltalk
setUpDependencies: spec

	spec
		baseline: 'Buoy'
			with: [ spec
				repository: 'github://ba-st/Buoy:v{XX}/source';
				loads: #('Deployment') ];
		import: 'Buoy'.
```
> Replace `{XX}` with the version you want to depend on

```smalltalk
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec package: 'My-Package' with: [ spec requires: #('Buoy') ] ]
```
