baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Buoy-Metaprogramming';
				package: 'Buoy-Metaprogramming-Tests' with: [ spec requires: 'Buoy-Metaprogramming' ];
				package: 'Buoy-Math';
				package: 'Buoy-Math-Tests' with: [ spec requires: 'Buoy-Math' ];
				package: 'Buoy-Assertions';
				package: 'Buoy-Assertions-Tests' with: [ spec requires: 'Buoy-Assertions' ];
				package: 'Buoy-Dynamic-Binding';
				package: 'Buoy-Dynamic-Binding-Tests' with: [ spec requires: 'Buoy-Dynamic-Binding' ];
				package: 'Buoy-Collections';
				package: 'Buoy-Collections-Tests' with: [ spec requires: 'Buoy-Collections' ];
				package: 'Buoy-Conditions';
				package: 'Buoy-Conditions-Tests' with: [ spec requires: 'Buoy-Conditions' ].
			spec
				group: 'Deployment' with: #('Buoy-Assertions' 'Buoy-Math' 'Buoy-Metaprogramming' 'Buoy-Dynamic-Binding' 'Buoy-Collections' 'Buoy-Conditions');
				group: 'Development' with: #('Deployment' 'Buoy-Assertions-Tests' 'Buoy-Math-Tests' 'Buoy-Metaprogramming-Tests' 'Buoy-Dynamic-Binding-Tests' 'Buoy-Collections-Tests' 'Buoy-Conditions-Tests');
				group: 'default' with: #('Deployment') ]