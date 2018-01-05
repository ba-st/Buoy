tests
testFormatWithLastSeparator

	| formatter |
	formatter := CollectionFormatter separatingWith: $, andLastWith: $y.
	self assert: (formatter format: #(1 2 3)) equals: '1, 2 y 3'