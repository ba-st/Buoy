"
In GS64, RcIdentitySet is similar to IdentitySet, but no conflict occurs when multiple users
add objects to an RcIdentitySet. If a conflict with other update operations on the
RcIdentitySet occur, the add is replayed so that the commit can succeed.

This version is just a placeholder so we can easily create extensions methods to load in GS64 specific
packages.
"
Class {
	#name : 'RcIdentitySet',
	#superclass : 'IdentitySet',
	#category : 'Buoy-GS64-Compatibility',
	#package : 'Buoy-GS64-Compatibility'
}
