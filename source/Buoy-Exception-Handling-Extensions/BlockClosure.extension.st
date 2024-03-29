Extension { #name : #BlockClosure }

{ #category : #'*Buoy-Exception-Handling-Extensions' }
BlockClosure >> on: selector except: exclusionSelector do: action [

	^ self
		  on: selector
		  do: [ :exception |
			  (exclusionSelector handles: exception)
				  ifTrue: [ exception pass ]
				  ifFalse: [ action value: exception ] ]
]
