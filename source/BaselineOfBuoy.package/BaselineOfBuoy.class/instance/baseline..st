baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Buoy';
				package: 'Buoy-Tests' with: [ spec requires: 'Buoy' ];
				package: 'Buoy-Dynamic-Binding';
				package: 'Buoy-Dynamic-Binding-Tests' with: [ spec requires: 'Buoy-Dynamic-Binding' ];
				package: 'Buoy-Collections';
				package: 'Buoy-Collections-Tests' with: [ spec requires: 'Buoy-Collections' ].
			spec
				group: 'Deployment' with: #('Buoy' 'Buoy-Dynamic-Binding' 'Buoy-Collections');
				group: 'Development' with: #('Deployment' 'Buoy-Tests' 'Buoy-Dynamic-Binding-Tests' 'Buoy-Collections-Tests');
				group: 'default' with: #('Deployment') ]