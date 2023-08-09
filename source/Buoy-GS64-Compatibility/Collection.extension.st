Extension { #name : #Collection }

{ #category : #'*Buoy-GS64-Compatibility' }
Collection >> any [

	"Answer a representative sample of the receiver. It raises an error when the collection is empty. This method can be helpful when needing to preinfer the nature of the contents of semi-homogeneous collections."

	self emptyCheck.
	self do: [ :each | ^ each ]
]
