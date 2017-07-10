testing
isSatisfiedBy: aValue

	^ conditions perform: compositionPolicy with: [ :condition | condition isSatisfiedBy: aValue ]