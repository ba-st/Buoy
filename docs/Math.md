# Math

## Percentages

 A percentage is a number or ratio expressed as a fraction of 100. A percentage is a dimensionless number. This project includes a proper abstraction: `Percentage`.

 The easier way to create a percentage is to send the message `percent` to a number. For example `5 percent` will create an object representing `5%`. There's two common cases also covered as instance creation methods (`0%` and `100%`):

 ```smalltalk
Percentage zero. "0%"
Percentage oneHundred "100%"
 ```

Percentages can also be created providing a ratio:

```smalltalk
Percentage ratio: 1. "100%"
Percentage ratio: 1/2 "50%"
```

This percentages can be operated arithmetically with any number or other percentages. Try printing the following expressions:

```smalltalk
20 percent * 5. "1"
10 percent + 105 percent. "115%"
10 percent + 15.0 "15.1"
```

Percent changes applied sequentially do not add up in the usual way. For example, if we apply a 10% increase to a value (200), it will raise it to 220. If we apply later a 10% decrease to it (a decrease of 22), the final value will be 198, not the original 200. The reason for the apparent discrepancy is that the two percent changes (+10% and −10%) are measured relative to different quantities (200 and 220, respectively), and thus do not "cancel out". This can be handled easily:

```smalltalk
(200 increasedBy: 10 percent) decreasedBy: 10 percent "198"
```

## Per Mille

It's similar to a percentage but expressed as a fraction of 1000. The easier way create one is to send the message `perMille` to a number.

```smalltalk
6 perMille. "6‰"
12 perMille "12‰"
```

---
Some definitions and examples are based on the ones in  [Wikipedia](https://en.wikipedia.org/wiki/Percentage)
