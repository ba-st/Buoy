Class {
	#name : #BalancedDistributionInBucketsAlgorithmTest,
	#superclass : #TestCase,
	#category : #'Buoy-Collections-Tests'
}

{ #category : #private }
BalancedDistributionInBucketsAlgorithmTest >> assertDistributionInFourBuckets [

	| buckets |

	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 4;
		assert: buckets first equals: #(1 2 3 4 5 6);
		assert: buckets second equals: #(7 8 9 10 11 12);
		assert: buckets third equals: #(13 14 15 16 17);
		assert: buckets last equals: #(18 19 20 21 22).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 4;
		assert: buckets first equals: #(1 2 3 4 5 6);
		assert: buckets second equals: #(7 8 9 10 11 12);
		assert: buckets third equals: #(13 14 15 16 17 18);
		assert: buckets last equals: #(19 20 21 22 23).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 4;
		assert: buckets first equals: #(1 2 3 4 5 6);
		assert: buckets second equals: #(7 8 9 10 11 12);
		assert: buckets third equals: #(13 14 15 16 17 18);
		assert: buckets last equals: #(19 20 21 22 23 24).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 4;
		assert: buckets first equals: #(1 2 3 4 5 6 7);
		assert: buckets second equals: #(8 9 10 11 12 13);
		assert: buckets third equals: #(14 15 16 17 18 19);
		assert: buckets last equals: #(20 21 22 23 24 25).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 4;
		assert: buckets first equals: #(1 2 3 4 5 6 7);
		assert: buckets second equals: #(8 9 10 11 12 13 14);
		assert: buckets third equals: #(15 16 17 18 19 20);
		assert: buckets last equals: #(21 22 23 24 25 26).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 4;
		assert: buckets first equals: #(1 2 3 4 5 6 7);
		assert: buckets second equals: #(8 9 10 11 12 13 14);
		assert: buckets third equals: #(15 16 17 18 19 20 21);
		assert: buckets last equals: #(22 23 24 25 26 27)
]

{ #category : #private }
BalancedDistributionInBucketsAlgorithmTest >> assertDistributionInOneBucket [

	| buckets |

	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 1;
		assert: buckets first equals: #(1 2 3).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 1;
		assert: buckets first equals: #(1 2 3 4).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 1;
		assert: buckets first equals: #(1 2 3 4 5).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 1;
		assert: buckets first equals: #(1 2 3 4 5 6)
]

{ #category : #private }
BalancedDistributionInBucketsAlgorithmTest >> assertDistributionInThreeBuckets [

	| buckets |

	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 3;
		assert: buckets first equals: #(1 2 3 4 5);
		assert: buckets second equals: #(6 7 8 9 10);
		assert: buckets last equals: #(11 12 13 14 15).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 3;
		assert: buckets first equals: #(1 2 3 4 5 6);
		assert: buckets second equals: #(7 8 9 10 11);
		assert: buckets last equals: #(12 13 14 15 16).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 3;
		assert: buckets first equals: #(1 2 3 4 5 6);
		assert: buckets second equals: #(7 8 9 10 11 12);
		assert: buckets last equals: #(13 14 15 16 17).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 3;
		assert: buckets first equals: #(1 2 3 4 5 6);
		assert: buckets second equals: #(7 8 9 10 11 12);
		assert: buckets last equals: #(13 14 15 16 17 18).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 3;
		assert: buckets first equals: #(1 2 3 4 5 6 7);
		assert: buckets second equals: #(8 9 10 11 12 13);
		assert: buckets last equals: #(14 15 16 17 18 19).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 3;
		assert: buckets first equals: #(1 2 3 4 5 6 7);
		assert: buckets second equals: #(8 9 10 11 12 13 14);
		assert: buckets last equals: #(15 16 17 18 19 20)
]

{ #category : #private }
BalancedDistributionInBucketsAlgorithmTest >> assertDistributionInTwoBuckets [

	| buckets |

	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 2;
		assert: buckets first equals: #(1 2 3 4);
		assert: buckets last equals: #(5 6 7 8).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 2;
		assert: buckets first equals: #(1 2 3 4 5);
		assert: buckets last equals: #(6 7 8 9).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 2;
		assert: buckets first equals: #(1 2 3 4 5);
		assert: buckets last equals: #(6 7 8 9 10).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 2;
		assert: buckets first equals: #(1 2 3 4 5 6);
		assert: buckets last equals: #(7 8 9 10 11).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 2;
		assert: buckets first equals: #(1 2 3 4 5 6);
		assert: buckets last equals: #(7 8 9 10 11 12).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 2;
		assert: buckets first equals: #(1 2 3 4 5 6 7);
		assert: buckets last equals: #(8 9 10 11 12 13)
]

{ #category : #tests }
BalancedDistributionInBucketsAlgorithmTest >> testComplexDistribution [

	self assertDistributionInOneBucket.
	self assertDistributionInTwoBuckets.
	self assertDistributionInThreeBuckets.
	self assertDistributionInFourBuckets
]

{ #category : #tests }
BalancedDistributionInBucketsAlgorithmTest >> testSimpleDistribution [

	| buckets |

	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 1;
		assert: buckets first equals: #(1 2 3 4 5 6 7).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 2;
		assert: buckets first equals: #(1 2 3 4 5 6 7);
		assert: buckets last equals: #(8 9 10 11 12 13 14).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 3;
		assert: buckets first equals: #(1 2 3 4 5 6 7);
		assert: buckets second equals: #(8 9 10 11 12 13 14);
		assert: buckets last equals: #(15 16 17 18 19 20 21).
	buckets := ( BalancedDistributionInBucketsAlgorithm distributing: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28) maxPerBucket: 7 ) execute.
	self
		assert: buckets size equals: 4;
		assert: buckets first equals: #(1 2 3 4 5 6 7);
		assert: buckets second equals: #(8 9 10 11 12 13 14);
		assert: buckets third equals: #(15 16 17 18 19 20 21);
		assert: buckets last equals: #(22 23 24 25 26 27 28)
]
