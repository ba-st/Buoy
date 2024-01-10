"
In GS64, an instance of GsIndexOptions specifies features that will be used when creating a particular index on a collection. GsIndexSpec index definition methods all have variants that accept an instance of GsIndexOptions, although some override certain settings. If no GsIndexOptions is explicitly provided, the session or repository default is used.
The GsIndexOptions defines if the index is a legacy index or a btreePlus index, as well as other important indexing features.

This version is just a placeholder so we can easily create extensions methods to load in GS64 specific
packages.
"
Class {
	#name : 'GsIndexOptions',
	#superclass : 'Object',
	#category : 'Buoy-GS64-Compatibility',
	#package : 'Buoy-GS64-Compatibility'
}

{ #category : 'options' }
GsIndexOptions class >> btreePlusIndex [

	^ self new
]

{ #category : 'options' }
GsIndexOptions class >> optimizedComparison [

	^ self new
]

{ #category : 'options' }
GsIndexOptions class >> reducedConflict [

	^ self new
]

{ #category : 'combining' }
GsIndexOptions >> + anOption [

	^ self
]
