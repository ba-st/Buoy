tests-Combining
testReturn

	((Optional containing: 0) return: [ :number | number + 1 ]) withContentDo: [ :number | self assert: number equals: 1 ] ifUnused: [ self fail ].

	(Optional unused return: [ :number | number + 1 ]) withContentDo: [ self fail ]