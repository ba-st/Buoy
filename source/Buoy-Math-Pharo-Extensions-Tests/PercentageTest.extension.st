Extension { #name : #PercentageTest }

{ #category : #'*Buoy-Math-Pharo-Extensions-Tests' }
PercentageTest >> testStoreOnBase [

	self
		assert: ( Percentage zero storeStringBase: 16 ) equals: 'Percentage zero';
		assert: ( Percentage oneHundred storeStringBase: 16 ) equals: 'Percentage oneHundred';
		assert: ( ( Percentage of: 12 ) storeStringBase: 16 ) equals: 'Percentage of: 16rC'
]
