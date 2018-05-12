"
I'm a test case for Namespace
"
Class {
	#name : #NamespaceTest,
	#superclass : #TestCase,
	#category : #'Buoy-Metaprogramming-Tests'
}

{ #category : #tests }
NamespaceTest >> testEmptyNamespace [

	| emptyNamespace |

	emptyNamespace := Namespace new.

	self assert: emptyNamespace names isEmpty
]
