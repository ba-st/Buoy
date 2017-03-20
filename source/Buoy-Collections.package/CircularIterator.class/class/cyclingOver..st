Instance Creation
cyclingOver: aSequentiableCollection

	AssertionChecker
		enforce: [ aSequentiableCollection notEmpty ]
		because: 'It makes no sense to iterate in a cyclic way an empty collection'
		raising: InstanceCreationFailed.
		
	^ self new initializeCyclingOver: aSequentiableCollection asArray