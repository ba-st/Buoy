"
In GS64, LookupError is an ImproperOperation that is signaled when a lookup is
made and not found. The key instance variable holds the missing key.

This version is just a placeholder so we can easily create extensions methods to load in GS64 specific
packages.
"
Class {
	#name : #LookupError,
	#superclass : #ImproperOperation,
	#category : #'Buoy-GS64-Compatibility'
}
