Class {
	#name : 'EscapingAlgorithm',
	#superclass : 'Object',
	#classInstVars : [
		'UniqueInstace'
	],
	#category : 'Buoy-Localization',
	#package : 'Buoy-Localization'
}

{ #category : 'class initialization' }
EscapingAlgorithm class >> initialize [

	<ignoreForCoverage>
	UniqueInstace := super new
]

{ #category : 'instance creation' }
EscapingAlgorithm class >> new [

  ^ UniqueInstace
]

{ #category : 'escaping' }
EscapingAlgorithm >> escape: string [

  ^ string species new: string size streamContents: [ :result |
        | stream |
        stream := string readStream.
        [ stream atEnd ] whileFalse: [ StringEscapingRule escape: stream next on: result ]
      ]
]

{ #category : 'escaping' }
EscapingAlgorithm >> unescape: string [

  ^ string species new: string size streamContents: [ :result |
        | stream |
        stream := string readStream.
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
