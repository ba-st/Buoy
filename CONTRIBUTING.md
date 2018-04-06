# How to Contribute

There's several ways to contribute to the project: reporting bugs, sending feedback, proposing ideas for new features, fixing or adding documentation, promoting the project, or even contributing code changes.

## Reporting issues

Use the issue tracker in this GitHub repository.

## Contributing Code

- This project is MIT licensed, so any code contribution must be under the same license.
- This project uses [semantic versioning](http://semver.org/), so keep it in mind when you make backwards-incompatible changes. If some backwards incompatible change is made the major version MUST be increased.
- The source code is hosted in this GitHub repository using the tonel format in the `source` folder. The master branch contains the latest changes, feel free to send pull requests or fork the project.
- Code contributions without test cases have a lower probability of being merged into the main branch.


- Clone this repository or a fork of it
- Load the corresponding development version evaluating in a Playground:
```smalltalk
Metacello new
  baseline: 'Buoy';
  repository: 'tonel://REPO_LOCATION/source';
  load: 'Development'.
```
where `REPO_LOCATION` is the location of the cloned repo in the local file system.
- Do the changes and save it from Pharo (don't forget to add some test cases)
- Create a branch, commit using the usual Git tooling and open a Pull Request

## Contributing documentation

The project documentation is mantained in this repository in the `docs` folder. To contribute some documentation or improve the existing, feel free to create a branch or fork this repository, make your changes and send a pull request.

Remember the docs are licensed under a CC Attribution-ShareAlike license.
