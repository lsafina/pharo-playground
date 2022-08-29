"
I represent a node of a linked list.
I store a value and a reference to the next node or nil if there is none.

"
Class {
	#name : #NodeLS,
	#superclass : #Object,
	#instVars : [
		'value',
		'next'
	],
	#category : #LinkedListLS
}

{ #category : #testing }
NodeLS >> hasNext [
	"returns true if the node has a successor, false otherwise"
			
	^ self nextNode isNotNil.
]

{ #category : #accessing }
NodeLS >> nextNode [

	^ next
]

{ #category : #accessing }
NodeLS >> nextNode: anObject [

	next := anObject
]

{ #category : #accessing }
NodeLS >> value [

	^ value
]

{ #category : #accessing }
NodeLS >> value: anObject [

	value := anObject
]
