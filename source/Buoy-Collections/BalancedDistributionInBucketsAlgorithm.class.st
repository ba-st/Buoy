"
I'm an algorithm to distribute in a balanced fashion a number of objects into a maximum number of buckets.
I will return the list of computed buckets.

Instance Variables
	collection:		<SequenceableCollection>
	maximumBucketSize:		<Integer>
"
Class {
	#name : #BalancedDistributionInBucketsAlgorithm,
	#superclass : #Object,
	#instVars : [
		'collection',
		'maximumBucketSize'
	],
	#category : #'Buoy-Collections'
}

{ #category : #'instance creation' }
BalancedDistributionInBucketsAlgorithm class >> distributing: aCollection maxPerBucket: aSmallInteger [

	^ self new initializeDistributing: aCollection maxPerBucket: aSmallInteger
]

{ #category : #private }
BalancedDistributionInBucketsAlgorithm >> countWithAtLeast: minimumCountPerBacket for: numberOfBuckets [

	| remainderToDistribute countPerBucket |

	remainderToDistribute := self numberOfObjectsToDistribute - ( minimumCountPerBacket * numberOfBuckets ).

	countPerBucket := Array new: numberOfBuckets.

	1 to: remainderToDistribute do: [ :index | countPerBucket at: index put: minimumCountPerBacket + 1 ].

	remainderToDistribute + 1 to: numberOfBuckets do: [ :index | countPerBucket at: index put: minimumCountPerBacket ].

	^ countPerBucket
]

{ #category : #private }
BalancedDistributionInBucketsAlgorithm >> distributeBalancedIn: numberOfBuckets bucketsAroundOfSize: numberOfObjectsPerBucket [

	| startIndex countPerBucket |

	countPerBucket := self countWithAtLeast: numberOfObjectsPerBucket floor for: numberOfBuckets.

	startIndex := 1.

	^ countPerBucket
		collect: [ :count | 
			| bucket |

			bucket := collection copyFrom: startIndex to: startIndex + count - 1.
			startIndex := startIndex + count.
			bucket
			]
]

{ #category : #private }
BalancedDistributionInBucketsAlgorithm >> distributeIn: bucketCount bucketsOfSize: numberOfObjectsPerBucket [

	| buckets |

	buckets := Array new: bucketCount.

	1 to: bucketCount do: [ :index | 
		| baseZeroIndex |

		baseZeroIndex := ( index - 1 ) * numberOfObjectsPerBucket.
		buckets at: index put: ( collection copyFrom: baseZeroIndex + 1 to: baseZeroIndex + numberOfObjectsPerBucket )
		].

	^ buckets
]

{ #category : #execution }
BalancedDistributionInBucketsAlgorithm >> execute [

	| numberOfObjectsPerBucket |

	self numberOfObjectsToDistribute = 0
		ifTrue: [ ^ #() ].

	numberOfObjectsPerBucket := self numberOfObjectsToDistribute / self numberOfBuckets.

	^ [ self distributeBalancedIn: self numberOfBuckets bucketsAroundOfSize: numberOfObjectsPerBucket ]
		unless: numberOfObjectsPerBucket isInteger
		inWhichCase: [ self distributeIn: self numberOfBuckets bucketsOfSize: numberOfObjectsPerBucket ]
]

{ #category : #initialization }
BalancedDistributionInBucketsAlgorithm >> initializeDistributing: aCollection maxPerBucket: aSmallInteger [

	collection := aCollection.
	maximumBucketSize := aSmallInteger
]

{ #category : #private }
BalancedDistributionInBucketsAlgorithm >> numberOfBuckets [

	^((self numberOfObjectsToDistribute + maximumBucketSize - 1) / maximumBucketSize) floor
]

{ #category : #private }
BalancedDistributionInBucketsAlgorithm >> numberOfObjectsToDistribute [

	^collection size
]
