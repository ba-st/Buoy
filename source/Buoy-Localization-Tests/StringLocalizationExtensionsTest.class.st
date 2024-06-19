Class {
	#name : 'StringLocalizationExtensionsTest',
	#superclass : 'TestCase',
	#category : 'Buoy-Localization-Tests',
	#package : 'Buoy-Localization-Tests'
}

{ #category : 'private' }
StringLocalizationExtensionsTest >> assertUnescaping: string raisesAsError: errorMessage [

  self should: [ string unescaped ] raise: AssertionFailed withMessageText: errorMessage
]

{ #category : 'tests - escaping' }
StringLocalizationExtensionsTest >> testErrorsInUnescaped [

  self assertUnescaping: '\💩' raisesAsError: 'There''s no escaping rule for "💩" (\u{1F4A9})'.

  self
    assertUnescaping: '\ \\' raisesAsError: 'There''s no escaping rule for " " (\u{0020})';
    assertUnescaping: '\\\' raisesAsError: 'Missing escape sequence';
    assertUnescaping: '\\ \' raisesAsError: 'Missing escape sequence'.

  self
    assertUnescaping: '\u' raisesAsError: 'Missing opening "{" in escaping sequence';
    assertUnescaping: '\u{' raisesAsError: 'Missing closing "}" in escaping sequence';
    assertUnescaping: '\u{010' raisesAsError: 'Missing closing "}" in escaping sequence';
    assertUnescaping: '\u{}' raisesAsError: 'Unexpected hexadecimal sequence ""';
    assertUnescaping: '\u{💩}' raisesAsError: 'Unexpected hexadecimal sequence "💩"';
    assertUnescaping: '\u{G}' raisesAsError: 'Unexpected hexadecimal sequence "G"';
    assertUnescaping: '\u{-1}' raisesAsError: 'Code point "-1" is out of range';
    assertUnescaping: '\u{FFFFFF}' raisesAsError: 'Code point "FFFFFF" is out of range'
]

{ #category : 'tests - escaping' }
StringLocalizationExtensionsTest >> testEscaped [

  self
    assert: 'я' escaped equals: '\u{44F}';
    assert: 'café' escaped equals: 'cafe\u{301}';
    assert: 'ā' escaped equals: '\u{101}';
    assert: 'Ω' escaped equals: '\u{3A9}';
    assert: '🇷' escaped equals: '\u{1F1F7}';

    assert: '{1} seems to be out of sync. Please fetch from "{2}" and try again.' escaped
    equals: '{1} seems to be out of sync. Please fetch from "{2}" and try again.';

    assert: 'Ṩ<l><t><r>{10} {name and surname} \ \{ ∈ ⊕' expandMacros escaped
    equals: 'S\u{307}\u{323}\l\t\r{10} {name and surname} \\ \\{ \u{2208} \u{2295}';

    assert: '̣̇<l><t><r>Walter ∈ ⊕' expandMacros escaped
    equals: '\u{307}\u{323}\l\t\rWalter \u{2208} \u{2295}';

    assert: '<html><h1>Czech is in Czech čeština.</h1></html>' escaped
    equals: '<html><h1>Czech is in Czech \u{10D}e\u{161}tina.</h1></html>'
]

{ #category : 'tests - escaping' }
StringLocalizationExtensionsTest >> testEscapedControlCharacters [

  self
    assert: '\r' equals: String cr escaped;
    assert: '\l' equals: String lf escaped;
    assert: '\t' equals: String tab escaped;
    assert: '\a' equals: ( Character codePoint: 7 ) asString escaped;
    assert: '\b' equals: Character backspace asString escaped;
    assert: '\v' equals: ( Character codePoint: 11 ) asString escaped;
    assert: '\f' equals: ( Character codePoint: 12 ) asString escaped;
    assert: '\e' equals: Character escape asString escaped
]

{ #category : 'tests - escaping' }
StringLocalizationExtensionsTest >> testEscapedReverseSolidus [

  self
    assert: '\\' equals: '\' escaped;
    assert: '\\ \\' equals: '\ \' escaped
]

{ #category : 'tests - escaping' }
StringLocalizationExtensionsTest >> testEscapedUnicode [

  self
    assert: '\u{44F}' equals: 'я' escaped;
    assert: '\u{101}' equals: 'ā' escaped;
    assert: '\u{3A9}' equals: 'Ω' escaped;
    assert: '\u{1F1F7}' equals: '🇷' escaped;
    assert: '\u{1F63B}' equals: '😻' escaped
]

{ #category : 'tests - escaping' }
StringLocalizationExtensionsTest >> testEscapedWithoutEscapingSequence [

  self
    assert: 'aabb' escaped equals: 'aabb';
    assert: 'a + b' escaped equals: 'a + b';
    assert: 'café' escaped equals: 'café';
    assert: '¡vamos! ¿adonde?' escaped equals: '¡vamos! ¿adonde?'
]

{ #category : 'tests - localization' }
StringLocalizationExtensionsTest >> testLocalized [

  self assert: 'Welcome' localized equals: 'Welcome'.

  self
    use: [ :translator |
        translator
          translationFor: 'Welcome' in: 'es' is: 'Bienvenido';
          translationFor: 'Welcome'
          in: 'ar'
          is: '\u{623}\u{647}\u{644}\u{627}\u{64B} \u{648} \u{633}\u{647}\u{644}\u{627}\u{64B}';
          translationFor: 'Welcome' in: 'de' is: 'Willkommen';
          translationFor: 'Welcome' in: 'fr' is: 'Bienvenue';
          translationFor: 'Welcome' in: 'pt' is: 'Bem-vindo';
          translationFor: 'Welcome' in: 'ja' is: '\u{3088}\u{3046}\u{3053}\u{305D}'
      ]
    asNaturalLanguageTranslatorDuring: [
        self
          use: 'es-AR' asLocaleDuring: [ self assert: 'Welcome' localized equals: 'Bienvenido' ];
          use: 'es-MX' asLocaleDuring: [ self assert: 'Welcome' localized equals: 'Bienvenido' ];
          use: 'ar' asLocaleDuring: [ self assert: 'Welcome' localized equals: 'أهلاً و سهلاً' ];
          use: 'de' asLocaleDuring: [ self assert: 'Welcome' localized equals: 'Willkommen' ];
          use: 'fr' asLocaleDuring: [ self assert: 'Welcome' localized equals: 'Bienvenue' ];
          use: 'pt' asLocaleDuring: [ self assert: 'Welcome' localized equals: 'Bem-vindo' ];
          use: 'pt-BR' asLocaleDuring: [ self assert: 'Welcome' localized equals: 'Bem-vindo' ];
          use: 'ja' asLocaleDuring: [ self assert: 'Welcome' localized equals: 'ようこそ' ]
      ]
]

{ #category : 'tests - localization' }
StringLocalizationExtensionsTest >> testLocalizedWithAll [

  | stringToTranslate parameters |
  stringToTranslate := '{1} seems to be out of sync. Please fetch from "{2}" and try again.'.
  parameters := #( 'Buoy' 'origin' ).

  self
    assert: ( stringToTranslate localizedWithAll: parameters )
    equals: 'Buoy seems to be out of sync. Please fetch from "origin" and try again.'.

  self
    use: [ :translator |
        translator
          translationFor: stringToTranslate
          in: 'es'
          is: '{1} parece no estar sincronizado. Por favor, actualiza desde "{2}" y reintenta.';
          translationFor: stringToTranslate
          in: 'es-AR'
          is: '{1} parece no estar sincronizado. Por favor, actualizá desde "{2}" y reintentá.'
      ]
    asNaturalLanguageTranslatorDuring: [
        self
          use: 'es-AR' asLocaleDuring: [
              self
                assert: ( stringToTranslate localizedWithAll: parameters )
                equals:
                  'Buoy parece no estar sincronizado. Por favor, actualizá desde "origin" y reintentá.'
            ];
          use: 'es-MX' asLocaleDuring: [
              self
                assert: ( stringToTranslate localizedWithAll: parameters )
                equals:
                  'Buoy parece no estar sincronizado. Por favor, actualiza desde "origin" y reintenta.'
            ]
      ]
]

{ #category : 'tests - escaping' }
StringLocalizationExtensionsTest >> testUnescaped [

  self
    assert: '\u{044F}' unescaped equals: 'я';
    assert: 'cafe\u{0301}' unescaped equals: 'café';
    assert: '\u{101}' unescaped equals: 'ā';
    assert: '\u{03A9}' unescaped equals: 'Ω';
    assert: '\u{1F1F7}' unescaped equals: '🇷';

    assert: '{1} seems to be out of sync. Please fetch from "{2}" and try again.' unescaped
    equals: '{1} seems to be out of sync. Please fetch from "{2}" and try again.';

    assert: 'S\u{0307}\u{0323}\n\t\r{10} {name and surname} \\ \\{ \u{2208} \u{2295}' unescaped
    equals: 'Ṩ<n><t><r>{10} {name and surname} \ \{ ∈ ⊕' expandMacros;

    assert: '\u{0307}\u{0323}\n\t\rWalter \u{2208} \u{2295}' unescaped
    equals: '̣̇<n><t><r>Walter ∈ ⊕' expandMacros;

    assert: '<html><h1>Czech is in Czech \u{10D}e\u{161}tina.</h1></html>' unescaped
    equals: '<html><h1>Czech is in Czech čeština.</h1></html>'
]

{ #category : 'tests - escaping' }
StringLocalizationExtensionsTest >> testUnescapedControlCharacters [

  self
    assert: '\r' unescaped equals: String cr;
    assert: '\l' unescaped equals: String lf;
    assert: '\t' unescaped equals: String tab;
    assert: '\n' unescaped equals: OSPlatform current lineEnding;
    assert: '\a' unescaped equals: ( Character codePoint: 7 ) asString;
    assert: '\b' unescaped equals: Character backspace asString;
    assert: '\v' unescaped equals: ( Character codePoint: 11 ) asString;
    assert: '\f' unescaped equals: ( Character codePoint: 12 ) asString;
    assert: '\e' unescaped equals: Character escape asString
]

{ #category : 'tests - escaping' }
StringLocalizationExtensionsTest >> testUnescapedReverseSolidus [

  self
    assert: '\\' unescaped equals: '\';
    assert: '\\ \\' unescaped equals: '\ \'.

  self
    should: [ '\\\' unescaped ] raise: AssertionFailed withMessageText: 'Missing escape sequence';
    should: [ '\ \\' unescaped ]
    raise: AssertionFailed
    withMessageText: 'There''s no escaping rule for " " (\u{0020})';
    should: [ '\\ \' unescaped ] raise: AssertionFailed withMessageText: 'Missing escape sequence'
]

{ #category : 'tests - escaping' }
StringLocalizationExtensionsTest >> testUnescapedUnicode [

  self
    assert: '\u{044F}' unescaped equals: 'я';
    assert: '\u{44F}' unescaped equals: 'я';
    assert: '\u{101}' unescaped equals: 'ā';
    assert: '\u{03A9}' unescaped equals: 'Ω';
    assert: '\u{3A9}' unescaped equals: 'Ω';
    assert: '\u{1F1F7}' unescaped equals: '🇷';
    assert: '\u{41}' unescaped equals: 'A';
    assert: '\u{041}' unescaped equals: 'A';
    assert: '\u{0041}' unescaped equals: 'A';
    assert: '\u{1F63b}' unescaped equals: '😻'
]

{ #category : 'tests - escaping' }
StringLocalizationExtensionsTest >> testUnescapedWithoutEscapingSequence [

  self
    assert: 'aabb' unescaped equals: 'aabb';
    assert: 'Ω + 💩' unescaped equals: 'Ω + 💩'
]
