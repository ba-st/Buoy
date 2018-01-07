tests
testFormatOn

	| formatter stream |
	stream := WriteStream on: String new.
	formatter := CollectionFormatter separatingWith: $,.
	formatter format: #(1 2 3) on: stream.
	self assert: stream contents equals: '1, 2, 3'