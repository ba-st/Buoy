tests
testFormatEmptyCollection

	| formatter |
	formatter := CollectionFormatter separatingWith: $, andLastWith: $y.
	self assert: (formatter format: #()) equals: String new