Extension { #name : #PositionableStream }

{ #category : #'*Buoy-Collections-GS64-Extensions' }
PositionableStream >> isBinary [
	"Return true if the receiver is a binary byte stream"
	^collection class == ByteArray
]
