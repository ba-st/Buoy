"
A RoundingModeTest is a test class for testing the behavior of RoundingMode
"
Class {
	#name : 'RoundingModeTest',
	#superclass : 'TestCase',
	#category : 'Buoy-Math-Tests',
	#package : 'Buoy-Math-Tests'
}

{ #category : 'private' }
RoundingModeTest >> allModesDo: aBlock [

  #( #ceil #floor #expand #truncate #halfExpand #halfTruncate #halfCeil #halfFloor #halfEven ) do: [
    :selector | aBlock value: ( RoundingMode perform: selector ) ]
]

{ #category : 'private' }
RoundingModeTest >> assertRoundingWith: aRoundingMode toTwoFractionDigitsGives: hundredths [
  "Rounds the values in the reference table, as fractions and as scaled decimals,
	and compares them against the expected results, expressed in hundredths."

  self tableValues with: hundredths do: [ :thousandths :expected |
      self
        assert: ( aRoundingMode round: thousandths / 1000 toFractionDigits: 2 )
        equals: expected / 100;
        assert:
          ( aRoundingMode round: ( thousandths / 1000 asScaledDecimal: 3 ) toFractionDigits: 2 )
        equals: expected / 100
    ]
]

{ #category : 'private' }
RoundingModeTest >> tableValues [
  "1.125, -1.125, 1.135, -1.135, 1.122, -1.122, 1.126 and -1.126, in thousandths"

  ^ #( 1125 -1125 1135 -1135 1122 -1122 1126 -1126 )
]

{ #category : 'tests' }
RoundingModeTest >> testAbstractClasses [

  self
    assert: RoundingMode isAbstract;
    assert: HalfRoundingMode isAbstract;
    deny: DirectedRoundingMode isAbstract;
    deny: HalfDirectedRoundingMode isAbstract;
    deny: HalfEvenRoundingMode isAbstract
]

{ #category : 'tests' }
RoundingModeTest >> testCeil [

  self
    assertRoundingWith: RoundingMode ceil
    toTwoFractionDigitsGives: #( 113 -112 114 -113 113 -112 113 -112 )
]

{ #category : 'tests' }
RoundingModeTest >> testExpand [

  self
    assertRoundingWith: RoundingMode expand
    toTwoFractionDigitsGives: #( 113 -113 114 -114 113 -113 113 -113 )
]

{ #category : 'tests' }
RoundingModeTest >> testFloor [

  self
    assertRoundingWith: RoundingMode floor
    toTwoFractionDigitsGives: #( 112 -113 113 -114 112 -113 112 -113 )
]

{ #category : 'tests' }
RoundingModeTest >> testHalfCeil [

  self
    assertRoundingWith: RoundingMode halfCeil
    toTwoFractionDigitsGives: #( 113 -112 114 -113 112 -112 113 -113 )
]

{ #category : 'tests' }
RoundingModeTest >> testHalfEven [

  self
    assertRoundingWith: RoundingMode halfEven
    toTwoFractionDigitsGives: #( 112 -112 114 -114 112 -112 113 -113 )
]

{ #category : 'tests' }
RoundingModeTest >> testHalfEvenToInteger [

  self
    assert: ( RoundingMode halfEven roundToInteger: 1 / 2 ) equals: 0;
    assert: ( RoundingMode halfEven roundToInteger: 3 / 2 ) equals: 2;
    assert: ( RoundingMode halfEven roundToInteger: 5 / 2 ) equals: 2;
    assert: ( RoundingMode halfEven roundToInteger: -5 / 2 ) equals: -2;
    assert: ( RoundingMode halfEven roundToInteger: -7 / 2 ) equals: -4
]

{ #category : 'tests' }
RoundingModeTest >> testHalfExpand [

  self
    assertRoundingWith: RoundingMode halfExpand
    toTwoFractionDigitsGives: #( 113 -113 114 -114 112 -112 113 -113 )
]

{ #category : 'tests' }
RoundingModeTest >> testHalfFloor [

  self
    assertRoundingWith: RoundingMode halfFloor
    toTwoFractionDigitsGives: #( 112 -113 113 -114 112 -112 113 -113 )
]

{ #category : 'tests' }
RoundingModeTest >> testHalfTruncate [

  self
    assertRoundingWith: RoundingMode halfTruncate
    toTwoFractionDigitsGives: #( 112 -112 113 -113 112 -112 113 -113 )
]

{ #category : 'tests' }
RoundingModeTest >> testRoundIntegers [

  self allModesDo: [ :mode |
      self
        assert: ( mode roundToInteger: 0 ) equals: 0;
        assert: ( mode roundToInteger: 7 ) equals: 7;
        assert: ( mode roundToInteger: -7 ) equals: -7;
        assert: ( mode round: 7 toFractionDigits: 2 ) equals: 7;
        assert: ( mode roundToInteger: 30 factorial ) equals: 30 factorial
    ]
]

{ #category : 'tests' }
RoundingModeTest >> testRoundToMoreFractionDigitsThanTheNumberHas [

  self allModesDo: [ :mode |
      self
        assert: ( mode round: 1 / 4 toFractionDigits: 5 ) equals: 1 / 4;
        assert: ( mode round: -1 / 4 toFractionDigits: 2 ) equals: -1 / 4;
        assert: ( mode round: 1.25s2 toFractionDigits: 3 ) equals: 5 / 4
    ]
]

{ #category : 'tests' }
RoundingModeTest >> testRoundToZeroFractionDigits [

  self
    assert: ( RoundingMode halfExpand round: 5 / 2 toFractionDigits: 0 ) equals: 3;
    assert: ( RoundingMode halfExpand round: -5 / 2 toFractionDigits: 0 ) equals: -3;
    assert: ( RoundingMode truncate round: 29 / 10 toFractionDigits: 0 ) equals: 2;
    assert: ( RoundingMode ceil round: 21 / 10 toFractionDigits: 0 ) equals: 3
]

{ #category : 'tests' }
RoundingModeTest >> testRoundingAnswersExactNumbers [

  self
    assert: ( RoundingMode halfExpand round: 1.125s3 toFractionDigits: 2 ) equals: 113 / 100;
    assert: ( RoundingMode halfExpand round: 1 / 3 toFractionDigits: 4 ) equals: 3333 / 10000;
    assert: ( RoundingMode halfExpand roundToInteger: 2 / 3 ) isInteger
]

{ #category : 'tests' }
RoundingModeTest >> testRoundingTowardZero [

  self
    assert: ( RoundingMode halfExpand round: -1 / 1000 toFractionDigits: 2 ) equals: 0;
    assert: ( RoundingMode floor round: 1 / 1000 toFractionDigits: 2 ) equals: 0;
    assert: ( RoundingMode floor round: -1 / 1000 toFractionDigits: 2 ) equals: -1 / 100;
    assert: ( RoundingMode ceil round: -1 / 1000 toFractionDigits: 2 ) equals: 0
]

{ #category : 'tests' }
RoundingModeTest >> testTruncate [

  self
    assertRoundingWith: RoundingMode truncate
    toTwoFractionDigitsGives: #( 112 -112 113 -113 112 -112 112 -112 )
]
