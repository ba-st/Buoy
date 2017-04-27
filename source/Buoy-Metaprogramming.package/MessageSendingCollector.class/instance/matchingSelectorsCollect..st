private
matchingSelectorsCollect: aTransformationBlock

	^ self receiver class allSelectors select: self filterBlock thenCollect: aTransformationBlock