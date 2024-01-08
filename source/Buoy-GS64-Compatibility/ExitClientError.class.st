"
In GS64, ExitClientError is a subclass of Error, 
signalled when the application wants topaz (or other Gci client) to exit the
client process with a specified exit status.  Not a fatal error ;
client process should call GciLogout before exiting.

This version is just a placeholder so we can easily create extensions methods to load in GS64 specific
packages.
"
Class {
	#name : 'ExitClientError',
	#superclass : 'Error',
	#category : 'Buoy-GS64-Compatibility',
	#package : 'Buoy-GS64-Compatibility'
}
