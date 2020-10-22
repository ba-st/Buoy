"
I'm a CollectionFormatterTest,  a test class for testing the behavior of CollectionFormatter
"
Class {
	#name : #CollectionFormatterTest,
	#superclass : #TestCase,
	#category : #'Buoy-Collections-Tests'
}

{ #category : #tests }
CollectionFormatterTest >> testFormat [

	| formatter |
	formatter := CollectionFormatter separatingWith: ', '.
	self assert: (formatter format: #(1 2 3)) equals: '1, 2, 3'
]

{ #category : #tests }
CollectionFormatterTest >> testFormatEmptyCollection [

	| formatter |
	formatter := CollectionFormatter separatingWith: ', ' andLastWith: ' and '.
	self assert: (formatter format: #()) equals: String new
]

{ #category : #tests }
CollectionFormatterTest >> testFormatOn [

	| formatter stream |

	stream := WriteStream on: String new.
	formatter := CollectionFormatter separatingWith: ', '.
	formatter format: #(1 2 3) on: stream.
	self assert: stream contents equals: '1, 2, 3'
]

{ #category : #tests }
CollectionFormatterTest >> testFormatOneElementCollection [

	| formatter |

	formatter := CollectionFormatter separatingWith: ', ' andLastWith: ' and '.
	self assert: (formatter format: #(1)) equals: '1'
]

{ #category : #tests }
CollectionFormatterTest >> testFormatTwoElementCollectionWithLastSeparator [

	| formatter |

	formatter := CollectionFormatter separatingWith: ', ' andLastWith: ' and '.
	self assert: (formatter format: #(1 2)) equals: '1 and 2'
]

{ #category : #tests }
CollectionFormatterTest >> testFormatWithElementFormatter [

	| formatter |

	formatter := CollectionFormatter
		separatingWith: $,
		applyingToEach: [ :element | '/<1p>/' expandMacrosWith: element ].
	self assert: (formatter format: #(1 2 3)) equals: '/1/,/2/,/3/'
]

{ #category : #tests }
CollectionFormatterTest >> testFormatWithLastSeparator [

	| formatter |

	formatter := CollectionFormatter separatingWith: ', ' andLastWith: ' and '.
	self assert: (formatter format: #(1 2 3)) equals: '1, 2 and 3'
]
