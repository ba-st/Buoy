tests
testFormatOneElementCollection

	| formatter |
	formatter := CollectionFormatter separatingWith: $, andLastWith: $y.
	self assert: (formatter format: #(1)) equals: '1'