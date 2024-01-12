"
In GS64, GsQueryOptions is part of the Indexing and Querying subsystem. This class encapsulates the optional refinements that may be used when creating a particular query.  Each GsQuery has an associated instance of GsQueryOptions, either the default one or an instance that is created and included in the GsQuery specification method.

This version is just a placeholder so we can easily create extensions methods to load in GS64 specific
packages.
"
Class {
	#name : 'GsQueryOptions',
	#superclass : 'Object',
	#category : 'Buoy-GS64-Compatibility',
	#package : 'Buoy-GS64-Compatibility'
}

{ #category : 'accessing' }
GsQueryOptions class >> cacheQueryResult [

	^ self new
]

{ #category : 'accessing' }
GsQueryOptions class >> default [

	^ self new
]

{ #category : 'combining' }
GsQueryOptions >> + anOption [

	^ self
]
