baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'BAST-Pharo-Extensions';
				package: 'BAST-Pharo-Extensions-Tests' with: [ spec requires: 'BAST-Pharo-Extensions' ].
			spec
				group: 'Deployment' with: #('BAST-Pharo-Extensions');
				group: 'Development' with: #('Deployment' 'BAST-Pharo-Extensions-Tests');
				group: 'default' with: #('Deployment') ]