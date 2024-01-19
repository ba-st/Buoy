"
In GS64, GsCurrentSession provides a public interface to the current GemStone session.
There is only one instance of GsCurrentSession in each GemStone session.
The GemStone server creates it automatically when a user logs into GemStone.
The instance is transient and cannot be accessed after the user logs out of
GemStone.

This version is just a placeholder so we can easily create extensions methods to load in GS64 specific
packages.
"
Class {
	#name : 'GsCurrentSession',
	#superclass : 'Object',
	#category : 'Buoy-GS64-Compatibility',
	#package : 'Buoy-GS64-Compatibility'
}
