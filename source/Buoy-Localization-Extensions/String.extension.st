Extension { #name : 'String' }

{ #category : '*Buoy-Localization-Extensions' }
String >> asLanguageRange [

  ^ LanguageRange fromString: self
]

{ #category : '*Buoy-Localization-Extensions' }
String >> asLanguageTag [

	^ LanguageTag fromString: self
]

{ #category : '*Buoy-Localization-Extensions' }
String >> escaped [

  ^ self species new: self size streamContents: [ :result |
        | stream |
        stream := self readStream.
        [ stream atEnd ] whileFalse: [ StringEscapingRule escape: stream next on: result ]
      ]
]

{ #category : '*Buoy-Localization-Extensions' }
String >> localized [

  ^ self localizedWithAll: #(  )
]

{ #category : '*Buoy-Localization-Extensions' }
String >> localizedWithAll: collection [

  ^ NaturalLanguageTranslator current localize: self withAll: collection to: CurrentLocale value
]

{ #category : '*Buoy-Localization-Extensions' }
String >> unescaped [

  ^ self species new: self size streamContents: [ :result |
        | stream |
        stream := self readStream.
        [ stream atEnd ] whileFalse: [
            | currentChar |
            currentChar := stream next.
            currentChar == $\
              ifTrue: [
                  stream atEnd
                    ifTrue: [ AssertionFailed signal: 'Missing escape sequence' ]
                    ifFalse: [ StringEscapingRule unescape: stream next from: stream on: result ]
                ]
              ifFalse: [ result nextPut: currentChar ]
          ]
      ]
]
