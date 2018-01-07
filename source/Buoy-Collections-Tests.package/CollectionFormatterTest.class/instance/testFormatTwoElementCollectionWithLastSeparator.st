tests
testFormatTwoElementCollectionWithLastSeparator

	| formatter |
	formatter := CollectionFormatter separatingWith: $, andLastWith: $y.
	self assert: (formatter format: #(1 2)) equals: '1 y 2'