# Math

## Percentages

 A percentage is a number or ratio expressed as a fraction of 100. A percentage
  is a dimensionless number. This project includes a proper abstraction: `Percentage`.

 The easier way to create a percentage is to send the message `percent` to a
 number. For example `5 percent` will create an object representing `5%`.
 There are two common cases also covered as instance creation methods (`0%` and
  `100%`):

 ```smalltalk
Percentage zero. "0%"
Percentage oneHundred "100%"
 ```

Percentages can also be created providing a ratio:

```smalltalk
Percentage ratio: 1. "100%"
Percentage ratio: 1/2 "50%"
```

A percentage of a scaled decimal is exact on every platform. In GemStone/S 64,
dividing a scaled decimal rounds the result to its scale, so its ratio gets
only as many more decimals as it needs to be exact: `12.5s1 percent` has a
ratio of `0.125` with a scale of 3, and prints as `12.500%` (`12.5s1%` in
Pharo). Per mille values work the same way.

These percentages can be operated arithmetically with any number or other
percentages. Try printing the following expressions:

```smalltalk
20 percent * 5. "1"
10 percent + 105 percent. "115%"
10 percent + 15.0 "15.1"
```

Percent changes applied sequentially do not add up in the usual way. For
example, if we apply a 10% increase to a value (200), it will raise it to 220.
If we apply later a 10% decrease to it (a decrease of 22), the final value will
be 198, not the original 200. The reason for the apparent discrepancy is that
the two percent changes (+10% and −10%) are measured relative to different
quantities (200 and 220, respectively), and thus do not "cancel out". This can
be handled easily:

```smalltalk
(200 increasedBy: 10 percent) decreasedBy: 10 percent "198"
```

## Per Mille

Is similar to a percentage but expressed as a fraction of 1000. The easier way
create one is to send the message `perMille` to a number.

```smalltalk
6 perMille. "6‰"
12 perMille "12‰"
```

## Rounding Modes

A rounding mode decides to which integer a number rounds. A number that is not
an integer lies between two integers, and each mode picks one of them. Get a
mode by sending one of these messages to `RoundingMode`:

| Mode | Rounds |
| --- | --- |
| `ceil` | toward positive infinity |
| `floor` | toward negative infinity |
| `expand` | away from zero |
| `truncate` | toward zero |
| `halfCeil` | to the nearest integer, ties toward positive infinity |
| `halfFloor` | to the nearest integer, ties toward negative infinity |
| `halfExpand` | to the nearest integer, ties away from zero |
| `halfTruncate` | to the nearest integer, ties toward zero |
| `halfEven` | to the nearest integer, ties toward the even one |

`roundToInteger:` rounds a number to an integer, and `round:toFractionDigits:`
to a number of decimals:

```smalltalk
RoundingMode halfExpand roundToInteger: 5/2. "3"
RoundingMode halfEven roundToInteger: 5/2. "2"
RoundingMode floor roundToInteger: -5/2. "-3"
RoundingMode halfExpand round: 1.125s3 toFractionDigits: 2. "(113/100)"
RoundingMode halfEven round: 1.125s3 toFractionDigits: 2. "(28/25)"
RoundingMode truncate round: 1/3 toFractionDigits: 4. "(3333/10000)"
```

With exact numbers, like integers, fractions and scaled decimals, the result is
exact too. Floats are rounded as they are, inexactness included:
`RoundingMode halfExpand round: 1.005 toFractionDigits: 2` answers `1`, not
`(101/100)`, because `1.005 * 100` is `100.49999999999999`. Write the number
as a scaled decimal (`1.005s3`) or a fraction instead. Converting the float with
`asScaledDecimal:` does not help, as the result keeps the float's binary value.

## `Number` Extensions for GS64

- `isFloat` returns false; binary and decimal floats return true
- `isZero` returns true if the receiver equals 0
- `nthRoot:` returns the nth root of the receiver
- `round:` round the decimal part of the receiver to be limited to the desired
  number of decimal digits

## `Float` Extensions for GS64

- `isInfinite` returns true if the receiver is infinite

## `DecimalFloat` Extensions for GS64

- `isFloat` returns true, as `DecimalFloat` is a floating point class too
- `isNaN`, `isFinite` and `isInfinite` test the receiver's kind, as they do for
  binary floats

## `Integer` Extensions for GS64

- `#printStringHex` prints the receiver in hexadecimal
- `#printStringLenght:padded:` prints the receiver to a minimum size,
  optionally padding with zeros.
- `readFrom:ifFail:` parses an Integer or evaluates the failure block if the
  format is invalid.

---
Some definitions and examples are based on the ones on [Wikipedia](https://en.wikipedia.org/wiki/Percentage)
