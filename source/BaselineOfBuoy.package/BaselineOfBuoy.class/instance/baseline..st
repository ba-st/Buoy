baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Buoy';
				package: 'Buoy-Tests' with: [ spec requires: 'Buoy' ].
			spec
				group: 'Deployment' with: #('Buoy');
				group: 'Development' with: #('Deployment' 'Buoy-Tests');
				group: 'default' with: #('Deployment') ]