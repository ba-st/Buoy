# How to add number localization data

Buoy formats numbers with the conventions of the current locale: its decimal
and group separators, its signs and its number patterns. They come from the
[Unicode CLDR](https://cldr.unicode.org/translation/number-currency-formats)
and are loaded from JSON files. Buoy ships `locales/numbers.json`, with the
global defaults, English, Spanish and all their regional variants, and loads it
when Buoy itself is loaded.

This guide adds the conventions for other languages, or changes the ones Buoy
ships, from an application.

## The file format

Each top-level key is a language range, and each value holds the properties
that range sets. A property is resolved for a language tag from the most
specific matching range down to `*`, one property at a time:

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

With this file, `es-AR` takes its `minimumGroupingDigits` from `es-AR`, its
decimal separator from `es` and its plus sign from `*`.

The properties are:

| Property | What it is |
| --- | --- |
| `decimalSeparator` | Separates the integer and fraction parts |
| `groupSeparator` | Separates groups of integer digits |
| `minimumGroupingDigits` | Digits needed in the first group to group |
| `plusSign` | The sign of positive numbers, when shown |
| `minusSign` | The sign of negative numbers |
| `percentSign` | The percent sign |
| `perMilleSign` | The per mille sign |
| `numberFormat` | The [pattern][patterns] for numbers |
| `percentFormat` | The [pattern][patterns] for percentages |

`minimumGroupingDigits` is the number of digits the first group needs before
digits are grouped at all: with 2, `1234` is not grouped but `12345` is.

[patterns]: https://unicode.org/reports/tr35/tr35-numbers.html#Number_Format_Patterns

Write characters outside ASCII as `\u` escapes, like `\u00A0` for a
no-break space: separators are often invisible characters, and escapes keep
them visible in reviews and diffs.

## Generate the conventions from CLDR

Save this script as `cldr-number-conventions.sh`. It needs `bash`, `curl` and
`jq`, and prints the conventions for the languages it is given, and for all
their regional variants, as of CLDR 48.2.3:

```bash
#!/usr/bin/env bash
# Prints, in Buoy's locale data format, the number conventions CLDR defines
# for the given languages and all their regional variants.
#
# Usage: cldr-number-conventions.sh <language>...
# Example: cldr-number-conventions.sh en es > locales/numbers.json
set -euo pipefail

readonly CLDR_VERSION=48.2.3
readonly CLDR_URL="https://raw.githubusercontent.com/unicode-org/cldr-json/\
${CLDR_VERSION}/cldr-json"

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <language>..." >&2
  exit 64
fi

download() {
  curl --fail --silent --show-error --location "${CLDR_URL}/$1"
}

# The properties Buoy uses, read from a locale's CLDR numbers.json
conventions_of() {
  download "cldr-numbers-full/main/$1/numbers.json" |
    jq --compact-output --arg id "$1" '
      .main[$id].numbers as $numbers
      | $numbers["symbols-numberSystem-latn"] as $symbols
      | {
          id: $id,
          conventions: {
            decimalSeparator: $symbols.decimal,
            groupSeparator: $symbols.group,
            minimumGroupingDigits: ($numbers.minimumGroupingDigits | tonumber),
            plusSign: $symbols.plusSign,
            minusSign: $symbols.minusSign,
            percentSign: $symbols.percentSign,
            perMilleSign: $symbols.perMille,
            numberFormat: $numbers["decimalFormats-numberSystem-latn"].standard,
            percentFormat: $numbers["percentFormats-numberSystem-latn"].standard
          }
        }'
}

# The CLDR locales of the given languages, the languages themselves included
locales=$(
  download "cldr-core/availableLocales.json" |
    jq --raw-output --args '
      .availableLocales.full[]
      | select(. as $locale | $ARGS.positional
          | any(. as $language
              | $locale == $language
                or ($locale | startswith($language + "-"))))
    ' "$@"
)

# "*" comes from CLDR's root locale, und. Each language keeps what differs
# from "*", and each regional variant what differs from its language.
{
  conventions_of und
  for locale in ${locales}; do
    conventions_of "${locale}"
  done
} | jq --slurp --raw-output '
  def without($base): with_entries(select(.value != $base[.key]));
  def hex4:
    [(. / 4096 | floor) % 16, (. / 256 | floor) % 16, (. / 16 | floor) % 16,
      . % 16]
    | map("0123456789ABCDEF"[.:. + 1]) | join("");
  def ascii:
    explode
    | map(
        if . < 128 then [.] | implode
        elif . < 65536 then "\\u" + hex4
        else (. - 65536) as $c
          | "\\u" + (55296 + ($c / 1024 | floor) | hex4)
            + "\\u" + (56320 + $c % 1024 | hex4)
        end)
    | join("");
  def entry:
    (.value | to_entries | map("\(.key | tojson): \(.value | tojson)"))
      as $properties
    | "  \(.key | tojson): {\($properties | join(", "))}";

  (map({(.id): .conventions}) | add) as $all
  | [{key: "*", value: $all.und}]
    + [ .[]
        | select(.id != "und")
        | .id as $id
        | ($id | split("-") | first) as $language
        | {
            key: $id,
            value: (.conventions
              | if $id == $language then without($all.und)
                else without($all[$language]) end)
          }
        | select(.value != {} or .key == $language) ]
  | "{\n" + (map(entry) | join(",\n")) + "\n}"
  | ascii
'
```

Run it with the languages to add:

```bash
bash cldr-number-conventions.sh fr de > locales/numbers.json
```

The output always starts with `*`, CLDR's defaults. Each language keeps only
what differs from `*`, and each regional variant only what differs from its
language; variants that differ in nothing are left out. A language entry is
always written, even if empty, to record that the language is supported.

Variants are compared with their language, not with the parent CLDR gives them,
because a language range only matches the tags it is a prefix of: CLDR makes
`es-AR` inherit from `es-419`, but the `es-419` range never matches `es-AR`.

## Adjust the conventions by hand

Edit the generated file to change what CLDR says. For example, to group
four-digit numbers in Spain too:

```json
{
  "es": {
    "minimumGroupingDigits": 1
  }
}
```

A file does not need `*`, nor every property of a range: it only needs what it
adds or changes. That makes a short file of overrides, loaded after Buoy's, the
simplest way to change a few conventions.

## Load the conventions

Load the file into the current locale conventions:

```smalltalk
LocaleConventions current loadJSONNumberConventionsFrom:
  'locales/numbers.json' asFileReference
```

`loadJSONNumberConventionsFromString:` does the same with JSON held in a
string. Both are shortcuts for the `#numbers` category of the conventions; a
project with conventions of its own registers a category for them, as the
[reference](../reference/Internationalization.md#locale-data) explains.

Each load merges the file's properties over the ones already loaded, so a
later load overrides an earlier one property by property. Buoy loads its own
file when Buoy is loaded, so an application loading its file afterwards
overrides Buoy's conventions where both define a property.

A good place to load it is a post-load action of the application's baseline,
as Buoy does: the conventions then become part of the image, and deployed
images do not need the file. In Pharo,
`BaselineOf >> withSourceDirectoryReferenceDo:` finds the directory the code was
loaded from:

```smalltalk
baseline: spec

  <baseline>
  spec for: #pharo do: [
    spec postLoadDoIt: #loadLocaleData.
    "..."
  ]
```

```smalltalk
loadLocaleData

  self withSourceDirectoryReferenceDo: [ :sourceDirectory |
    ( self classNamed: #LocaleConventions ) current loadJSONNumberConventionsFrom:
      sourceDirectory parent / 'locales' / 'numbers.json' ]
```

In GemStone/S 64, do the same in a Rowan post-load script, finding the file
from the project's repository root:

```smalltalk
| root |
root := ( Rowan projectNamed: 'MyProject' ) repositoryRoot.
LocaleConventions current loadJSONNumberConventionsFrom:
  root / 'locales' / 'numbers.json'
```

## Update to a newer CLDR release

Change `CLDR_VERSION` in the script to a
[cldr-json release](https://github.com/unicode-org/cldr-json/releases) and
generate the file again. Review the differences before committing them.
