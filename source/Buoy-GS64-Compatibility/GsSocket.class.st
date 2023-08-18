"
In GS64, GsSocket provides the means for creating and binding TCP sockets through the
operating system of the machine that is running the session's Gem process, and
for communicating across those sockets.
When the current GsProcess is suspended until a socket is ready to read or write,
other GsProcess that are ready to run will be run by the process scheduler.
Methods that suspend the current GsProcess until the socket operation completes
are interruptable by a hard break.

This version is just a placeholder so we can easily create extensions methods to load in GS64 specific
packages.
"
Class {
	#name : #GsSocket,
	#superclass : #Object,
	#category : #'Buoy-GS64-Compatibility'
}
