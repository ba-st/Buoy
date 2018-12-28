Extension { #name : #BlockClosure }

{ #category : #'*Buoy-Exception-Handling-System' }
BlockClosure >> on: selector except: exclusionSelector do: action [

	^ self
		on: selector - exclusionSelector
		do: action
]
