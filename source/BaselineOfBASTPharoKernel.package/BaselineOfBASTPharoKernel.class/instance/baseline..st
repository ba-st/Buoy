baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Pharo-Kernel-Extensions';
				package: 'Pharo-Kernel-Extensions-Tests' with: [ spec requires: 'Pharo-Kernel-Extensions' ].
			spec
				group: 'Deployment' with: #('Pharo-Kernel-Extensions');
				group: 'Development' with: #('Deployment' 'Pharo-Kernel-Extensions-Tests');
				group: 'default' with: #('Deployment') ]