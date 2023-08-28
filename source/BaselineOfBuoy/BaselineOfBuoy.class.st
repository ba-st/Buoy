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
				baselineTools: spec;
				baselineGS64Development: spec.
			spec
				group: 'CI' with: 'Tests';
				group: 'Development' with: #('Tools' 'Tests');
				group: 'default' with: 'Development'
			]
]

{ #category : #baselines }
BaselineOfBuoy >> baselineAssertions: spec [

	spec
		package: 'Buoy-Assertions-Extensions';
		group: 'Deployment' with: 'Buoy-Assertions-Extensions';
		package: 'Buoy-Assertions'
		with: [
			spec requires: #( 'Buoy-Conditions' 'Buoy-Assertions-Extensions' ) ];
		group: 'Deployment' with: 'Buoy-Assertions';
		package: 'Buoy-Assertions-Tests'
		with: [
			spec requires: #( 'Buoy-Assertions' 'Dependent-SUnit-Extensions' ) ];
		group: 'Tests' with: 'Buoy-Assertions-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineCollections: spec [

	spec
		package: 'Buoy-Collections' with: [
			spec requires:
					#( 'Buoy-Assertions' 'Buoy-Dynamic-Binding'
					   'Buoy-Comparison' ) ];
		group: 'Deployment' with: 'Buoy-Collections';
		package: 'Buoy-Collections-Extensions'
		with: [ spec requires: 'Buoy-Collections' ];
		group: 'Deployment' with: 'Buoy-Collections-Extensions';
		package: 'Buoy-Collections-Pharo-Extensions'
		with: [ spec requires: 'Buoy-Collections' ];
		group: 'Deployment' with: 'Buoy-Collections-Pharo-Extensions';
		package: 'Buoy-Collections-Tests' with: [
			spec requires: #( 'Buoy-Collections' 'Buoy-Collections-Extensions'
					   'Buoy-Collections-Pharo-Extensions'
					   'Dependent-SUnit-Extensions' ) ];
		group: 'Tests' with: 'Buoy-Collections-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineComparison: spec [

	spec
		package: 'Buoy-Comparison'
		with: [ spec requires: 'Buoy-Assertions' ];
		group: 'Deployment' with: 'Buoy-Comparison';
		package: 'Buoy-Comparison-Extensions'
		with: [ spec requires: 'Buoy-Comparison' ];
		group: 'Deployment' with: 'Buoy-Comparison-Extensions';
		package: 'Buoy-Comparison-Tests'
		with: [
			spec requires: #( 'Buoy-Comparison-Extensions' 'Dependent-SUnit-Extensions' ) ];
		group: 'Tests' with: 'Buoy-Comparison-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineConditions: spec [

	spec
		package: 'Buoy-Conditions-Extensions';
		group: 'Deployment' with: 'Buoy-Conditions-Extensions';
		package: 'Buoy-Conditions';
		group: 'Deployment' with: 'Buoy-Conditions';
		package: 'Buoy-Conditions-Pharo-Extensions'
		with: [
			spec requires: #( 'Buoy-Conditions' 'Buoy-Conditions-Extensions' ) ];
		group: 'Deployment' with: 'Buoy-Conditions-Pharo-Extensions';
		package: 'Buoy-Conditions-Tests'
		with: [
			spec requires: #( 'Buoy-Conditions' 'Buoy-Conditions-Extensions' ) ];
		group: 'Tests' with: 'Buoy-Conditions-Tests';
		package: 'Buoy-Conditions-Pharo-Extensions-Tests'
		with: [ spec requires: 'Buoy-Conditions-Pharo-Extensions' ];
		group: 'Tests' with: 'Buoy-Conditions-Pharo-Extensions-Tests'
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
		package: 'Buoy-Exception-Handling-Extensions';
		group: 'Deployment' with: 'Buoy-Exception-Handling-Extensions';
		package: 'Buoy-Exception-Handling-Tests' with: [ spec requires: 'Buoy-Exception-Handling-Extensions' ];
		group: 'Tests' with: 'Buoy-Exception-Handling-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineGS64Development: spec [

	spec
		package: 'Buoy-GS64-Compatibility'
		with: [ spec requires: 'Development' ];
		group: 'GS64-Development' with: 'Buoy-GS64-Compatibility';
		package: 'Buoy-Collections-GS64-Extensions'
		with: [ spec requires: 'Buoy-GS64-Compatibility' ];
		group: 'GS64-Development' with: 'Buoy-Collections-GS64-Extensions';
		package: 'Buoy-Math-GS64-Base-Extensions'
		with: [ spec requires: 'Buoy-GS64-Compatibility' ];
		group: 'GS64-Development' with: 'Buoy-Math-GS64-Base-Extensions';
		package: 'Buoy-Math-GS64-Extensions'
		with: [ spec requires: 'Buoy-GS64-Compatibility' ];
		group: 'GS64-Development' with: 'Buoy-Math-GS64-Extensions';
		package: 'Buoy-Metaprogramming-GS64-Extensions'
		with: [ spec requires: 'Buoy-GS64-Compatibility' ];
		group: 'GS64-Development'
		with: 'Buoy-Metaprogramming-GS64-Extensions';
		package: 'Buoy-SUnit-GS64-Extensions'
		with: [ spec requires: 'Buoy-GS64-Compatibility' ];
		group: 'GS64-Development' with: 'Buoy-SUnit-GS64-Extensions'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineMath: spec [

	spec
		package: 'Buoy-Math' with: [ spec requires: 'Buoy-Assertions' ];
		group: 'Deployment' with: 'Buoy-Math';
		package: 'Buoy-Math-Extensions'
		with: [ spec requires: 'Buoy-Math' ];
		group: 'Deployment' with: 'Buoy-Math-Extensions';
		package: 'Buoy-Math-Pharo-Extensions'
		with: [ spec requires: 'Buoy-Math' ];
		group: 'Deployment' with: 'Buoy-Math-Pharo-Extensions';
		package: 'Buoy-Math-Tests' with: [
			spec requires:
					#( 'Buoy-Math-Extensions' 'Buoy-Math-Pharo-Extensions'
					   'Dependent-SUnit-Extensions' ) ];
		group: 'Tests' with: 'Buoy-Math-Tests';
		package: 'Buoy-Math-Pharo-Extensions-Tests' with: [
			spec requires: 'Buoy-Math-Tests' ];
		group: 'Tests' with: 'Buoy-Math-Pharo-Extensions-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineMetaprogramming: spec [

	spec
		package: 'Buoy-Metaprogramming'
		with: [ spec requires: 'Buoy-Assertions' ];
		group: 'Deployment' with: 'Buoy-Metaprogramming';
		package: 'Buoy-Metaprogramming-Extensions'
		with: [ spec requires: 'Buoy-Assertions' ];
		group: 'Deployment' with: 'Buoy-Metaprogramming-Extensions';
		package: 'Buoy-Metaprogramming-Pharo-Extensions';
		group: 'Deployment' with: 'Buoy-Metaprogramming-Pharo-Extensions';
		package: 'Buoy-Metaprogramming-Tests' with: [
			spec requires:
					#( 'Buoy-Metaprogramming' 'Buoy-Metaprogramming-Extensions'
					   'Buoy-Metaprogramming-Pharo-Extensions' ) ];
		group: 'Tests' with: 'Buoy-Metaprogramming-Tests'
]

{ #category : #baselines }
BaselineOfBuoy >> baselineSUnit: spec [

	spec
		package: 'Buoy-SUnit-Model';
		group: 'Dependent-SUnit-Extensions' with: 'Buoy-SUnit-Model';
		package: 'Buoy-SUnit-Pharo-Extensions';
		group: 'Dependent-SUnit-Extensions' with: 'Buoy-SUnit-Pharo-Extensions';
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
