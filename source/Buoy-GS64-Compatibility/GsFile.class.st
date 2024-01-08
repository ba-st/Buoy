"
In GS64, GsFile provides the means for creating and accessing files. These
files reside in the file system on either the machine that is running the
current session's Gem process (the server machine) or the machine that is
running the client application (the client machine).  The files may be of any
type, textual or binary, though separate protocol is provided for reading and
writing these types of data.  File contents are in bytes and writing kinds of
String that require multiple bytes per code pint, the contents must be
explicitly encoded before write, or written using nextPutAllUtf8:.

This version is just a placeholder so we can easily create extension methods to load in GS64 specific
packages.
"
Class {
	#name : 'GsFile',
	#superclass : 'Object',
	#category : 'Buoy-GS64-Compatibility',
	#package : 'Buoy-GS64-Compatibility'
}
