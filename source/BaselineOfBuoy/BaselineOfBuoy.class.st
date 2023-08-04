"
Baseline of Buoy
"
Class {
	#name : #BaselineOfBuoy,
	#superclass : #BaselineOf,
	#category : #BaselineOfBuoy
}

{ #category : #baselines }
BaselineOfBuoy >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ self
				baselineAssertions: spec;
				baselineCollections: spec;
				baselineConditions: spec;
				baselineComparison: spec;
				baselineDynamicBinding: spec;
				baselineExceptionHandling: spec;
				baselineMath: spec;
				baselineMetaprogramming: spec;
				baselineSUnit: spec;
				baselineTools: spec.
			spec
				group: 'CI' with: 'Tests';
				group: 'Development' with: #('Tools' 'Tests')
			]
]

{ #category : #baselines }
BaselineOfBuoy >> baselineAssertions: spec [

	spec
		package: 'Buoy-Assertions' with: [ spec requires: 'Buoy-Conditions' ];
		group: 'Deployment' with: 'Buoy-Assertions';
		package: 'Buoy-Assertions-Tests'
			with: [ spec requires: #('Buoy-Assertions' 'Dependent-SUnit-Extensions') ];
		group: 'Tests' with: 'Buoy-Assertions-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineCollections: spec [

	spec
		package: 'Buoy-Collections'
		with: [ spec requires: #( 'Buoy-Assertions' 'Buoy-Dynamic-Binding' 'Buoy-Comparison' ) ];
		group: 'Deployment' with: 'Buoy-Collections';
		package: 'Buoy-Collections-Tests'
		with: [ spec requires: #( 'Buoy-Collections' 'Dependent-SUnit-Extensions' ) ];
		group: 'Tests' with: 'Buoy-Collections-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineComparison: spec [

	spec
		package: 'Buoy-Comparison' with: [ spec requires: 'Buoy-Assertions' ];
		group: 'Deployment' with: 'Buoy-Comparison';
		package: 'Buoy-Comparison-Tests'
			with: [ spec requires: #('Buoy-Comparison' 'Dependent-SUnit-Extensions') ];
		group: 'Tests' with: 'Buoy-Comparison-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineConditions: spec [

	spec
		package: 'Buoy-Conditions-Extensions';
		group: 'Deployment' with: 'Buoy-Conditions-Extensions';
		package: 'Buoy-Conditions';
		group: 'Deployment' with: 'Buoy-Conditions';
		package: 'Buoy-Conditions-Tests'
		with: [
			spec requires: #( 'Buoy-Conditions' 'Buoy-Conditions-Extensions' ) ];
		group: 'Tests' with: 'Buoy-Conditions-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineDynamicBinding: spec [

	spec
		package: 'Buoy-Dynamic-Binding' with: [ spec requires: #('Buoy-Assertions' 'Buoy-Metaprogramming') ];
		group: 'Deployment' with: 'Buoy-Dynamic-Binding';
		package: 'Buoy-Dynamic-Binding-Tests' with: [ spec requires: #('Buoy-Dynamic-Binding' 'Dependent-SUnit-Extensions') ];
		group: 'Tests' with: 'Buoy-Dynamic-Binding-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineExceptionHandling: spec [

	spec
		package: 'Buoy-Exception-Handling';
		group: 'Deployment' with: 'Buoy-Exception-Handling';
		package: 'Buoy-Exception-Handling-Tests' with: [ spec requires: 'Buoy-Exception-Handling' ];
		group: 'Tests' with: 'Buoy-Exception-Handling-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineMath: spec [

	spec
		package: 'Buoy-Math' with: [ spec requires: 'Buoy-Assertions' ];
		group: 'Deployment' with: 'Buoy-Math';
		package: 'Buoy-Math-Tests' with: [ spec requires: #('Buoy-Math' 'Dependent-SUnit-Extensions') ];
		group: 'Tests' with: 'Buoy-Math-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineMetaprogramming: spec [

	spec
		package: 'Buoy-Metaprogramming' with: [ spec requires: 'Buoy-Assertions' ];
		group: 'Deployment' with: 'Buoy-Metaprogramming';
		package: 'Buoy-Metaprogramming-Tests' with: [ spec requires: 'Buoy-Metaprogramming' ];
		group: 'Tests' with: 'Buoy-Metaprogramming-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineSUnit: spec [

	spec
		package: 'Buoy-SUnit-Model';
		group: 'Dependent-SUnit-Extensions' with: 'Buoy-SUnit-Model';
		package: 'Buoy-SUnit-Tests' with: [ spec requires: 'Dependent-SUnit-Extensions' ];
		group: 'Tests' with: 'Buoy-SUnit-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineTools: spec [

	spec
		package: 'Buoy-Development-Tools' with: [ spec requires: 'Deployment' ];
		group: 'Tools' with: #('Buoy-Development-Tools' 'Dependent-SUnit-Extensions')
]

{ #category : #accessing }
BaselineOfBuoy >> projectClass [

	^ MetacelloCypressBaselineProject
]
