Extension { #name : 'String' }

{ #category : '*Buoy-GS64-Compatibility' }
String >> asUnicodeString [

	^WideString from: self
]
