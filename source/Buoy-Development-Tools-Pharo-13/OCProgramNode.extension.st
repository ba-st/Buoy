Extension { #name : 'OCProgramNode' }

{ #category : '*Buoy-Development-Tools-Pharo-13' }
OCProgramNode class >> formatters [

	^ (RBAbstractFormatter allSubclasses reject: [ :each | each isAbstract ])
			sort: [ :a :b | a priority > b priority ]
]
