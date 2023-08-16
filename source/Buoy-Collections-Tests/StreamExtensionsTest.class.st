Class {
	#name : #StreamExtensionsTest,
	#superclass : #TestCase,
	#category : #'Buoy-Collections-Tests'
}

{ #category : #tests }
StreamExtensionsTest >> testIsBinary [

	self
		assert: #[ 1 2 ] readStream isBinary;
		deny: '123' readStream isBinary;
		deny: #(  ) readStream isBinary;
		assert: #[ 1 2 ] writeStream isBinary;
		deny: '123' writeStream isBinary;
		deny: #(  ) writeStream isBinary
]
