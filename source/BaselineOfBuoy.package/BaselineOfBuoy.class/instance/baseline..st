baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Buoy-Assertions';
				package: 'Buoy-Conditions';
				package: 'Buoy-Metaprogramming';
				package: 'Buoy-Math' with: [ spec requires: 'Buoy-Assertions'];
				package: 'Buoy-Collections' with: [ spec requires: #('Buoy-Assertions' 'Buoy-Dynamic-Binding' )];
				package: 'Buoy-Dynamic-Binding' with: [ spec requires: #('Buoy-Assertions' 'Buoy-Metaprogramming' )];
				
				package: 'Buoy-Assertions-Tests' with: [ spec requires: 'Buoy-Assertions' ];
				package: 'Buoy-Conditions-Tests' with: [ spec requires: 'Buoy-Conditions' ];
				package: 'Buoy-Metaprogramming-Tests' with: [ spec requires: 'Buoy-Metaprogramming' ];
				package: 'Buoy-Math-Tests' with: [ spec requires: 'Buoy-Math' ];
				package: 'Buoy-Collections-Tests' with: [ spec requires: 'Buoy-Collections' ];
				package: 'Buoy-Dynamic-Binding-Tests' with: [ spec requires: 'Buoy-Dynamic-Binding' ].
			spec
				group: 'Deployment' with: #('Buoy-Assertions' 'Buoy-Math' 'Buoy-Metaprogramming' 'Buoy-Dynamic-Binding' 'Buoy-Collections' 'Buoy-Conditions');
				group: 'Development' with: #('Deployment' 'Buoy-Assertions-Tests' 'Buoy-Math-Tests' 'Buoy-Metaprogramming-Tests' 'Buoy-Dynamic-Binding-Tests' 'Buoy-Collections-Tests' 'Buoy-Conditions-Tests');
				group: 'default' with: #('Deployment') ]