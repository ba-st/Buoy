# Buoy

This project aims to complement [Pharo](https://www.pharo.org) adding useful extensions.

[![Unit Tests](https://github.com/ba-st/Buoy/actions/workflows/unit-tests.yml/badge.svg)](https://github.com/ba-st/Buoy/actions/workflows/unit-tests.yml)
[![Coverage Status](https://codecov.io/github/ba-st/Buoy/coverage.svg?branch=release-candidate)](https://codecov.io/gh/ba-st/Buoy/branch/release-candidate)
[![Group loading check](https://github.com/ba-st/Buoy/actions/workflows/loading-groups.yml/badge.svg)](https://github.com/ba-st/Buoy/actions/workflows/loading-groups.yml)
[![Markdown Lint](https://github.com/ba-st/Buoy/actions/workflows/markdown-lint.yml/badge.svg)](https://github.com/ba-st/Buoy/actions/workflows/markdown-lint.yml)

[![GitHub release](https://img.shields.io/github/release/ba-st/Buoy.svg)](https://github.com/ba-st/Buoy/releases/latest)
[![Pharo 7.0](https://img.shields.io/badge/Pharo-7.0-informational)](https://pharo.org)
[![Pharo 8.0](https://img.shields.io/badge/Pharo-8.0-informational)](https://pharo.org)
[![Pharo 9.0](https://img.shields.io/badge/Pharo-9.0-informational)](https://pharo.org)

Quick links

- [**Explore the docs**](docs/)
- [Report a defect](https://github.com/ba-st/Buoy/issues/new?labels=Type%3A+Defect)
- [Request a feature](https://github.com/ba-st/Buoy/issues/new?labels=Type%3A+Feature)

## Feature List

### Assertions

This library is aimed at providing a simpler way to enforce and check assertions. The main focus point is to use it in the business model. Read the [online tutorial](docs/Assertions.md).

### Collections

This library provides additional abstractions for Collections. See the [related documentation.](docs/Collections.md)

### Comparison

This  library provides support to compare objects both for equality and identity. They are typically used to implement the `=` and `hash` methods. See the [related documentation.](docs/Comparison.md)

### Math

This library provides basic arithmetic abstractions like Percentages. See the [related documentation.](docs/Math.md)

### Bindings and Optionals

This library provides support to express optional values and required values, that can be unknown at the beginning of an execution. See the [related documentation.](docs/BindingsAndOptionals.md)

### Exception Handling

Provides extensions to the [exception handling mechanics](docs/ExceptionHandling.md).

### Metaprogramming

This library provides some abstractions like [namespaces](docs/Namespaces.md) and [interfaces](docs/Interfaces.md).

### SUnit

Provides [extensions to the SUnit framework](docs/SUnit.md).

## License

- The code is licensed under [MIT](LICENSE).
- The documentation is licensed under [CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0/).

## Installation

To load the project in a Pharo image, or declare it as a dependency of your own project follow this [instructions](docs/Installation.md).

## Contributing

Check the [Contribution Guidelines](CONTRIBUTING.md)
