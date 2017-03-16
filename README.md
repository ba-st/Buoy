# Buoy

![logo](https://maxcdn.icons8.com/Color/PNG/48/Transport/buoy-48.png)

[![Build Status](https://travis-ci.org/ba-st/Buoy.svg?branch=master)](https://travis-ci.org/ba-st/Buoy)
[![Coverage Status](https://coveralls.io/repos/github/ba-st/Buoy/badge.svg?branch=master)](https://coveralls.io/github/ba-st/Buoy?branch=master)

This project aims to complement [Pharo](www.pharo.org) adding useful extensions.

## License
The project source code is [MIT](LICENSE) licensed. Any contribution submitted to the code repository is considered to be under the same license.

The documentation is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

## Get started!

- Download a [Pharo Image and VM](http://get.pharo.org)
- Open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'Buoy';
  repository: 'github://ba-st/Buoy:master/source';
  load
```

## Feature List

### Assertions

This library is aimed at providing a simpler way to enforce and check assertions. The main focus point is to use it in the business model. Read the [online tutorial](docs/Assertions.md).

### Math

This library provides basic arithmetic abstractions like Percentages. See the [related documentation.](docs/Math.md)

### Bindings and Optionals

This library provides support to express optional values and required values but unknown at the beginning. See the [related documentation.](docs/BindingsAndOptionals.md)

## Contributing

If you want to help check the [contribution guidelines.](CONTRIBUTING.md)

---
[Icon pack by Icons8](https://icons8.com)
