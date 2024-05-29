Extension { #name : 'RBProgramNode' }

{ #category : '*Buoy-Development-Tools-Pharo-12' }
RBProgramNode class >> formatters [

	^ (RBAbstractFormatter allSubclasses reject: [ :each | each isAbstract ])
			sort: [ :a :b | a priority > b priority ]
]
