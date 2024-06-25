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
