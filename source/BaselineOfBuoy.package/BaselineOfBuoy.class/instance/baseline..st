baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Buoy';
				package: 'Buoy-Tests' with: [ spec requires: 'Buoy' ];
				package: 'Buoy-Dynamic-Binding';
				package: 'Buoy-Dynamic-Binding-Tests' with: [ spec requires: 'Buoy-Dynamic-Binding' ].
			spec
				group: 'Deployment' with: #('Buoy' 'Buoy-Dynamic-Binding');
				group: 'Development' with: #('Deployment' 'Buoy-Tests' 'Buoy-Dynamic-Binding-Tests');
				group: 'default' with: #('Deployment') ]