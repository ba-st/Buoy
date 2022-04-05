Extension { #name : #Namespace }

{ #category : #'*Buoy-Development-Tools' }
Namespace >> gtInspectorItemsIn: composite [

	<gtInspectorPresentationOrder: 0>
	^ bindings gtInspectorItemsIn: composite
]

{ #category : #'*Buoy-Development-Tools' }
Namespace >> inspectionItems: builder [

	<inspectorPresentationOrder: 0 title: 'Items'>
	^ bindings inspectionItems: builder
]

{ #category : #'*Buoy-Development-Tools' }
Namespace >> spotterForKeysFor: aStep [

	<spotterOrder: 15>
	<stSpotterOrder: 15>
	^ bindings spotterForKeysFor: aStep
]
