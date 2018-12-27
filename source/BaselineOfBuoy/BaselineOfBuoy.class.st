"
Baseline of Buoy
"
Class {
	#name : #BaselineOfBuoy,
	#superclass : #BaselineOf,
	#category : 'BaselineOfBuoy'
}

{ #category : #baselines }
BaselineOfBuoy >> baseline: spec [

	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Buoy-SUnit-Model';
				package: 'Buoy-Assertions';
				package: 'Buoy-Conditions';
				package: 'Buoy-Metaprogramming' with: [ spec requires: 'Buoy-Assertions' ];
				package: 'Buoy-Math' with: [ spec requires: 'Buoy-Assertions' ];
				package: 'Buoy-Collections' with: [ spec requires: #('Buoy-Assertions' 'Buoy-Dynamic-Binding') ];
				package: 'Buoy-Dynamic-Binding' with: [ spec requires: #('Buoy-Assertions' 'Buoy-Metaprogramming') ];
				package: 'Buoy-SUnit-Tests' with: [ spec requires: 'Buoy-SUnit-Model' ];
				package: 'Buoy-Assertions-Tests' with: [ spec requires: #('Buoy-Assertions' 'SUnit') ];
				package: 'Buoy-Conditions-Tests' with: [ spec requires: 'Buoy-Conditions' ];
				package: 'Buoy-Metaprogramming-Tests' with: [ spec requires: 'Buoy-Metaprogramming' ];
				package: 'Buoy-Math-Tests' with: [ spec requires: #('Buoy-Math' 'SUnit') ];
				package: 'Buoy-Collections-Tests' with: [ spec requires: #('Buoy-Collections' 'SUnit') ];
				package: 'Buoy-Dynamic-Binding-Tests' with: [ spec requires: #('Buoy-Dynamic-Binding' 'SUnit') ];
				package: 'Buoy-Development-Tools' with: [ spec requires: 'Buoy-Metaprogramming' ].
			spec
				group: 'Deployment' with: #('Buoy-Assertions' 'Buoy-Math' 'Buoy-Metaprogramming' 'Buoy-Dynamic-Binding' 'Buoy-Collections' 'Buoy-Conditions');
				group: 'SUnit' with: #('Buoy-SUnit-Model');
				group: 'Dev-Tools' with: #('Buoy-Development-Tools' 'SUnit');
				group: 'Development'
					with: #('Deployment' 'SUnit' 'Buoy-Assertions-Tests' 'Buoy-Math-Tests' 'Buoy-Metaprogramming-Tests' 'Buoy-Dynamic-Binding-Tests' 'Buoy-Collections-Tests' 'Buoy-Conditions-Tests' 'Buoy-SUnit-Tests');
				group: 'CI' with: 'Development';
				group: 'default' with: #('Deployment' 'Dev-Tools' 'SUnit') ]
]
