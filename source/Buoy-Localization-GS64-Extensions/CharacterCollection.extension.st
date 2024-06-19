Extension { #name : 'CharacterCollection' }

{ #category : '*Buoy-Localization-GS64-Extensions' }
CharacterCollection >> asLanguageRange [

  ^ LanguageRange fromString: self
]

{ #category : '*Buoy-Localization-GS64-Extensions' }
CharacterCollection >> asLanguageTag [

	^ LanguageTag fromString: self
]

{ #category : '*Buoy-Localization-GS64-Extensions' }
CharacterCollection >> escaped [

  ^ self species new: self size streamContents: [ :result |
        | stream |
        stream := self readStream.
        [ stream atEnd ] whileFalse: [ StringEscapingRule escape: stream next on: result ]
      ]
]

{ #category : '*Buoy-Localization-GS64-Extensions' }
CharacterCollection >> localized [

  ^ self localizedWithAll: #(  )
]

{ #category : '*Buoy-Localization-GS64-Extensions' }
CharacterCollection >> localizedWithAll: collection [

  ^ NaturalLanguageTranslator current localize: self withAll: collection to: CurrentLocale value
]

{ #category : '*Buoy-Localization-GS64-Extensions' }
CharacterCollection >> unescaped [

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
