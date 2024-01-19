"
In GS64, WriteStreamPortable is an ANSI compliant implementation of
WriteStream, a PositionableStream that allows its objects to be written,
but not read.

This version is just a placeholder so we can easily create extensions methods to load in GS64 specific
packages.
"
Class {
	#name : 'WriteStreamPortable',
	#superclass : 'Stream',
	#instVars : [
		'position',
		'readLimit'
	],
	#category : 'Buoy-GS64-Compatibility',
	#package : 'Buoy-GS64-Compatibility'
}
