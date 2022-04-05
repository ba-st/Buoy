# How to use Buoy as dependency in a Pharo product

In order to include **Buoy** as part of your project, you should reference
the package in your product baseline:

1. Define the Buoy repository and version to be used, and the [baseline groups](../reference/Baseline-groups.md)
    you want to depend on (usually it will be `Deployment`).

    If you're unsure on what to depend use the *Dependency Analyzer*
    tool to choose an appropriate group including the packages you need.

2. Create a method like this one in the baseline class of your product:

    ```smalltalk
    setUpDependencies: spec

      spec
        baseline: 'Buoy'
        with: [ spec repository: 'github://github://ba-st/Buoy:v{XX}' ];
        project: 'Buoy-Deployment'
        copyFrom: 'Buoy' with: [ spec loads: 'Deployment' ]
    ```

    This will create `Buoy-Deployment` as a valid target that can be used
    as requirement in your own packages.

    > Replace `{XX}` with the version you want to depend on

3. Use the new loading target as a requirement on your packages. For example:

    ```smalltalk
    baseline: spec

    <baseline>
    spec
      for: #pharo
      do: [
        self setUpDependencies: spec.
        spec
          package: 'My-Package'
          with: [ spec requires: #('Buoy-Deployment') ] ]
    ```
