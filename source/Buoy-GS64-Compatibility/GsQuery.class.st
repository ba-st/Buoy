"
In GS64, a GsQuery is a programmatic way to define a query, allowing you to easily abstract, store
and reuse various aspects of the query.

This version is just a placeholder so we can easily create extensions methods to load in GS64 specific
packages.
"
Class {
	#name : 'GsQuery',
	#superclass : 'Object',
	#category : 'Buoy-GS64-Compatibility',
	#package : 'Buoy-GS64-Compatibility'
}

{ #category : 'instance creation' }
GsQuery class >> fromString: aString [

	^ self new
]

{ #category : 'configuring' }
GsQuery >> on: anUnorderedCollection [

	
]

{ #category : 'accessing' }
GsQuery >> queryResult [

	^ { 'Stallone'. 'Stallone'. 'Stallone'. 'Stallone' }
]
