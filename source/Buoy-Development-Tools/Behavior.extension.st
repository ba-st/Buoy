Extension { #name : 'Behavior' }

{ #category : '*Buoy-Development-Tools' }
Behavior >> inspectionGs64Options: builder [

	<inspectorPresentationOrder: 916 title: 'GS64 Options'>
	^ builder newTable
		  addColumn: ( SpStringTableColumn title: 'Option' evaluated: [ :option | option ] );
		  items: ( self propertyAt: #gs_options );
		  yourself
]

{ #category : '*Buoy-Development-Tools' }
Behavior >> inspectionGs64OptionsContext: aContext [

	aContext active: ( self hasProperty: #gs_options )
]
