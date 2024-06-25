Extension { #name : 'NaturalLanguageTranslator' }

{ #category : '*Buoy-SUnit-Model' }
NaturalLanguageTranslator class >> use: translator during: block [

  | currentTranslator |
  currentTranslator := self current.
  [
    self current: translator.
    block value
  ] ensure: [ self current: currentTranslator ]
]
