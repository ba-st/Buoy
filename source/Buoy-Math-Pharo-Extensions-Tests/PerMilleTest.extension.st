Extension { #name : #PerMilleTest }

{ #category : #'*Buoy-Math-Pharo-Extensions-Tests' }
PerMilleTest >> testStoreOnBase [

	self
		assert: ( 0 perMille storeStringBase: 16 ) equals: '16r0 perMille';
		assert: ( 1000 perMille storeStringBase: 16 ) equals: '16r3E8 perMille';
		assert: ( ( PerMille of: 12 ) storeStringBase: 16 ) equals: '16rC perMille'
]
