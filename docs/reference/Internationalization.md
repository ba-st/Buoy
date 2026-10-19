# Internationalization and Localization

Internationalization, often shortened to "i18n", is the practice of designing a
system in such a way that it can easily be adapted for different target audiences,
that may vary in region, language, or culture.
The complementary process of adapting a system for a specific target audience is
called Localization. Localization (l10n) is the process of adapting a software
user interface to a specific culture.

## Language Tags and Ranges

Language Tags are represented by instances of `LanguageTag`. A language tag is
used to label the language used by some information content.

These tags can also be used to specify the user's preferences when selecting
information content or to label additional attributes of content and associated
resources.

Sometimes language tags are used to indicate additional language attributes of
the content.

Language tags can be created by providing a subtags list or by parsing its
string representation:

```smalltalk
LanguageTag composedOf: #('en' 'Latn' 'US').
LanguageTag fromString: 'en-us'.
'en-us' asLanguageTag.
```

Its instances can respond the language code (`languageCode`) and provide
methods to access its script and region in case they are defined:

```smalltalk
tag withScriptDo: [:script | ].
tag withRegionDo: [:region| ].
```

This implementation does not do anything special with the other optional
subtags that can be defined; nor supports extended languages and regions in UN
M.49 codes.

Language ranges are represented by instances of `LanguageRange`. A language
range has the same syntax as a language-tag, or is the single character `"*"`.

A language range matches a language tag if it exactly equals the tag, or if it
exactly equals a prefix of the tag such that the first character following the
prefix is `"-"`.

The special range `"*"` matches any tag.  A protocol that uses
language ranges may specify additional rules about the semantics of
`"*"`; for instance, `HTTP/1.1` specifies that the range `"*"` matches only
languages not matched by any other range within an `"Accept-Language:"` header.

Language ranges can be created by sending the message `any`, providing a list
of subtags, or parsing its string representation:

```smalltalk
LanguageRange any.
LanguageRange composedOf: #('en').
LanguageRange fromString: '*'.
LanguageRange fromString: 'es-AR'.
```

`LanguageRange` instances are capable of matching corresponding language tags.
For example:

```smalltalk
(LanguageRange fromString: 'es') matches: 'es-AR' asLanguageTag "==> true"
```

## Escaping Strings

When dealing with localized strings it's usual to have to type some Unicode
characters outside the ones easily available in a keyboard. To ease this typing
we can use `String>>#unescaped` method, that escapes certain sequences starting
with `\` (the reverse solidus character).

The available escaping sequences are:

- `\\` escapes the reverse solidus character
- `\a` escapes the `BEL` Unicode Character (code point 7)
- `\b` escapes the `BS` Unicode Character (code point 8)
- `\e` escapes the `ESC` Unicode Character (code point 27)
- `\f` escapes the `FF` Unicode Character (code point 12)
- `\l` escapes the `LF` Unicode Character (code point 10)
- `\n` escapes to the OS line delimiter
- `\r` escapes the `CR` Unicode Character (code point 13)
- `\t` escapes the `TAB` Unicode Character (code point 9)
- `\v` escapes the `VT` Unicode Character (code point 11)
- `\u{XX}` escapes the Unicode Character with code point XX, XX is expressed in
  Hexadecimal notation and can be any valid code point in the Unicode range.

New escaping sequences can be implemented by end users subclassing `StringEscapingRule`
and implementing the required behavior.

## Current Locale and Language Translator

`CurrentLocale` is a dynamic variable used for accessing the current locale in
the localization support. Note that this is process-specific, so the same
image can have different locales for different running processes.

`NaturalLanguageTranslator` is a placeholder holding the current translator
available in the image.

## Localizing Strings

To localize a string into the language defined by the current locale, you need
to send the message `localize` to the string instance, or `localizeWithAll:` if
you need some placeholders in the translation.

For example,

```smalltalk
'Hello world!' localized
```

will search for a translation of `Hello world!` in the installed language
translator according to the language in the current locale.

```smalltalk
'Hello {1}' localizedWithAll: { self name }
```

will search for the translation and then use the `String>>#format:` method to replace
the placeholders.

The localization methods will first unescape the receiver, then search for a
translation and finally apply the format method.

## Localizing Numbers

Numbers, percentages and per mille values can be formatted following the
conventions of the current locale: its decimal and group separators, its signs
and its number patterns, taken from the
[Unicode CLDR](https://cldr.unicode.org/translation/number-currency-formats).

```smalltalk
CurrentLocale use: 'en' during: [ 1234.5s1 localized ]. "'1,234.5'"
CurrentLocale use: 'es' during: [ 1234.5s1 localized ]. "'1234,5'"
CurrentLocale use: 'es-AR' during: [ 1234.5s1 localized ]. "'1.234,5'"
CurrentLocale use: 'en-IN' during: [ 12345678 localized ]. "'1,23,45,678'"
```

Spain does not group four-digit numbers, but most of the Spanish speaking
countries in America do.

### Formatting Numbers

`Number>>#localized` formats the receiver for the current locale, and
`Number>>#localizedWith:` does the same, configured by a block:

```smalltalk
1.5s1 localizedWith: [ :options | options decimalPlaces: 2 ]. "'1.50'"
5 localizedWith: [ :options | options alwaysDisplaySign ]. "'+5'"
```

Only exact numbers can be formatted: integers, fractions and scaled decimals.
Floats are rejected, as their binary value is often not the decimal they were
written as; convert them to a scaled decimal or a fraction first. The scale of a
scaled decimal is not used as a number of decimals: `1.50s2 localized` is
`'1.5'`.

In GemStone/S 64, `FixedPoint` numbers are exact and formatted like scaled
decimals, while `DecimalFloat` numbers, such as `5.432F2`, are floats and
rejected too.

By default, numbers are formatted:

- with every fraction digit, up to 100: `1234.5678s4 localized` is
  `'1,234.5678'`, and `(1/3) localized` stops after 100 decimals. The default
  maximum can be changed with
  `LocalizedNumberFormatter defaultMaximumFractionDigits:`.
- rounding half away from zero when there are more digits than the maximum.
- with a sign only when the number is negative. The sign is decided on the
  rounded value, so `-1/1000` with two decimals is `'0.00'`.

The configuration block can send these messages:

| Message | Effect |
| --- | --- |
| `displaySignOnNegatives` | Shows a sign only for negatives (the default) |
| `displaySignExceptForZero` | Shows a sign for positive and negative numbers |
| `alwaysDisplaySign` | Shows a sign for every number, zero included |
| `minimumFractionDigits:` | Pads with zeros up to that many decimals |
| `maximumFractionDigits:` | Rounds to at most that many decimals |
| `maximumFractionDigits:roundingWith:` | The same, with a rounding mode |
| `decimalPlaces:` | Shows exactly that many decimals |
| `decimalPlaces:roundingWith:` | The same, with a rounding mode |
| `dontDisplayTrailingZerosForIntegers` | Shows no decimals for integers |

The rounding modes are the ones in [Math](Math.md#rounding-modes). For example:

```smalltalk
1.125s3 localizedWith: [ :options | options maximumFractionDigits: 2 ]. "'1.13'"
1.125s3 localizedWith: [ :options |
  options
    maximumFractionDigits: 2
    roundingWith: RoundingMode halfEven ]. "'1.12'"
1.999s3 localizedWith: [ :options |
  options decimalPlaces: 2; dontDisplayTrailingZerosForIntegers ]. "'2'"
```

`dontDisplayTrailingZerosForIntegers` looks at the rounded number, so `1.999s3`
with two decimals counts as an integer.

The formatting is done by a `LocalizedNumberFormatter`, which the block
configures. One can be created to format many numbers with the same
configuration:

```smalltalk
formatter := LocalizedNumberFormatter
  for: 'es-AR' asLanguageTag
  configuredBy: [ :options | options decimalPlaces: 2 ].
formatter format: 1234.5s1. "'1.234,50'"
formatter format: 1/3. "'0,33'"
```

### Percentages and Per Mille

`Percentage>>#localized` and `PerMille>>#localized`, and their `localizedWith:`
variants, format the value with the locale's percent pattern and the same
configuration messages:

```smalltalk
CurrentLocale use: 'en' during: [ 12.5s1 percent localized ]. "'12.5%'"
CurrentLocale use: 'es' during: [ 12.5s1 percent localized ]. "'12,5 %'"
CurrentLocale use: 'es-AR' during: [ 12.5s1 percent localized ]. "'12,5%'"
12.5s1 percent localizedWith: [ :options | options decimalPlaces: 0 ]. "'13%'"
6 perMille localized. "'6‰'"
```

In Spanish, the percent sign follows a no-break space. CLDR defines no per mille
pattern, so per mille values use the percent pattern with the per mille sign.
`LocalizedNumberFormatter class>>#percentagesFor:configuredBy:` and
`LocalizedNumberFormatter class>>#perMillesFor:configuredBy:` create the
formatters.

### Locale Data

The conventions used for each locale are held by `LocaleConventions current`.
Buoy loads the ones in `locales/numbers.json` when it is loaded: the defaults,
and English, Spanish and all their regional variants, from CLDR 48.2.3. The file
maps language ranges to the properties they set:

```json
{
  "*": {
    "decimalSeparator": ".",
    "groupSeparator": ",",
    "minimumGroupingDigits": 1,
    "plusSign": "+",
    "minusSign": "-",
    "percentSign": "%",
    "perMilleSign": "\u2030",
    "numberFormat": "#,##0.###",
    "percentFormat": "#,##0%"
  },
  "es": {
    "decimalSeparator": ",",
    "groupSeparator": ".",
    "minimumGroupingDigits": 2,
    "percentFormat": "#,##0\u00A0%"
  },
  "es-AR": {
    "minimumGroupingDigits": 1,
    "percentFormat": "#,##0%"
  }
}
```

Each property is resolved for a language tag from the most specific matching
range down to `*`: in `es-AR`, the minimum grouping digits come from `es-AR`,
the decimal separator from `es` and the plus sign from `*`. A language without
an entry uses `*`.

`LocaleConventions>>#numberPropertyNamed:for:` answers a resolved property.
`LocaleConventions>>#loadJSONNumberConventionsFrom:` and
`LocaleConventions>>#loadJSONNumberConventionsFromString:` merge more
conventions, property by property, over the loaded ones. The
[how-to](../how-to/how-to-add-number-localization-data.md) explains how to
generate them from CLDR for other languages, adjust them, and load them.

The number patterns follow CLDR's syntax, with these parts supported:
positive and negative subpatterns, grouping sizes (`#,##,##0` groups
`1,00,00,000`), minimum fraction digits (`0.00`), the percent, per mille, plus
and minus signs, and quoted literals. Scientific notation, currencies,
significant digits, rounding increments and padding are not.
