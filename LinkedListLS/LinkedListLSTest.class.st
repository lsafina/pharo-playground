"
A LinkedListLSTest is a test class for testing the behavior of LinkedListLS
"
Class {
	#name : #LinkedListLSTest,
	#superclass : #TestCase,
	#category : #'LinkedListLS-Tests'
}

{ #category : #test }
LinkedListLSTest >> testAdd [

	| list |
	list := LinkedListLS new.
	self assertEmpty: list.
	
	list add: 1.
	self assert: list first value equals: 1. 

	list add: 2.
	self assert: list asArray equals: #( 1 2 ). 	
	
	
]

{ #category : #test }
LinkedListLSTest >> testAddAll [

	| list |
	list := LinkedListLS new.
	
	list addAll: #( 1 ).
	self assert: list asArray equals: #( 1 ).
	
	list addAll: #( 2 3 ).
	self assert: list asArray equals: #( 1 2 3 ).
]

{ #category : #test }
LinkedListLSTest >> testAddFirst [

	| list |
	list := LinkedListLS new.
	
	"empty list"
	list addFirst: 3.
	self assert: list asArray equals: #( 3 ).
	list clear.
	
	"list with elements"
	list add: 1.
	list add: 2.
	list addFirst: 0.
	self assert: list asArray equals: #( 0 1 2 ). 
]

{ #category : #tests }
LinkedListLSTest >> testAddLast [ 
	
	| list |
	list := LinkedListLS new.
	
	"empty list"
	list addLast: 3.
	self assert: list asArray equals: #( 3 ).
	list clear.
	
	"list with elements"
	list add: 1.
	list add: 2.
	list addLast: 3.
	self assert: list asArray equals: #( 1 2 3 ). 
]

{ #category : #accessing }
LinkedListLSTest >> testClear [
	
	| list |
	list := LinkedListLS new.
	
	"empty list"
	list clear.
	self assertEmpty: list.
	
	"list with elements"
	list add: 1.
	list add: 2.
	self assert: list asArray equals: #( 1 2 ).
	list clear.
	self assertEmpty: list. 
]

{ #category : #tests }
LinkedListLSTest >> testCollect [
	
	| list |
	
	list := LinkedListLS new.
	list add: 1.
	list add: 2.
	
	self assert: (list collect: [ :e | e > 1 ]) asArray equals: #( false true ).
	self assert: list asArray equals: #( 1 2 )

	
]

{ #category : #tests }
LinkedListLSTest >> testDetect [
	
	| list |
	
	list := LinkedListLS new.
 	list add: 1.
	list add: 2.
	
	"positive"
	self assert: (list detect: [ :e | e = 1 ]) equals:  1.
	self assert: list asArray equals: #( 1 2 ).
	
	"negative"
	self assert: (list detect: [ :e | e < 1 ]) equals: nil.
	self assert: list asArray equals: #( 1 2 ).
]

{ #category : #tests }
LinkedListLSTest >> testDo [

	| list dopler |
	list := LinkedListLS new.
	
	"empty list"
	list do: [:e | e + 1].
	self assertEmpty: list.
	
	"list with elements"
	dopler := LinkedListLS new.
	list add: 1.
	list add: 2.
	list do: [:e | dopler add: e ].
	self assert: list asArray equals: dopler asArray.
	self assert: list asArray equals: #( 1 2).

]

{ #category : #tests }
LinkedListLSTest >> testFirst [
	
	| list temp |
	list := LinkedListLS new.
	temp := list first.
	self assert: temp equals: nil.
	
	list add: 1.
	temp := list first. 
	self assert: temp value equals: 1. 

	
]

{ #category : #tests }
LinkedListLSTest >> testIncludes [
	
	| list temp |
	list := LinkedListLS new.
	
	"empty list"
	temp := list includes: 0.
	self assert: temp equals: false.
	
	"not empty list but holds no element of interest"
	list add: 1.
	temp := list includes: 0.
	self assert: temp equals: false.

	"not empty list, holds an element of interest (corner case: first element)"
	list add: 2.
	temp := list includes: 1.
	self assert: temp equals: true.
	
	"not empty list, holds an element of interest (corner case: last element)"
	list add: 3.
	temp := list includes: 3.
	self assert: temp equals: true.
]

{ #category : #tests }
LinkedListLSTest >> testIsEmpty [
	
	| list |
	list := LinkedListLS new.
	
	"empty list"
	self assert: (list isEmpty) equals: true.
	
	"not empty list"
	list add: 1.
	self assert: (list isEmpty) equals: false.
]

{ #category : #tests }
LinkedListLSTest >> testLast [
	
	| list |
	list := LinkedListLS new.
	
	"empty list"
	self assert: (list last) equals: nil.
	
	"one element list"
	list add: 1.
	self assert: (list last value) equals: 1. 
	
	"more elements"
	list add: 2.
	self assert: (list last value) equals: 2.

	
]

{ #category : #tests }
LinkedListLSTest >> testPenult [

	| list |
	list := LinkedListLS new.
	
	"empty list, penultimate node with no value"
	self assert: (list penult) value equals: nil. 
	
	"empty list, penultimate node with value"
	self assert: (list penult: 0) value equals: nil. 
	
	"1-element list, penultimate node with no value"
	self assert: (list penult) value equals: nil. 
	
	"1-element list, penultimate node with value equals to the element"
	list add: 0.
	self assert: (list penult: 0) value equals: nil.
	list clear.

	"1-element list, penultimate node with value does not equal to the element"
	list add: 1.
	self assert: (list penult: 0) value equals: nil.
	
	"several elements list, penultimate node with no value"
	list add: 2.
	self assert: (list penult) value equals: 1. 
	
	"several elements list, penultimate node with value equals to the element"
	list add: 3.
	self assert: (list penult: 3) value equals: 2.

	"sevaral elements list, penultimate node with value does not equal to the element"
	list add: 4.
	self assert: (list penult: 5) value equals: nil.		
	
	
]

{ #category : #tests }
LinkedListLSTest >> testReject [
	
	| list |
	
	list := LinkedListLS new.
 	list add: 1.
	list add: 2.
	
	"positive"
	self assert: (list reject: [ :e | e > 1 ]) asArray equals: #( 1 ).
	self assert: list asArray equals: #( 1 2 ).
	
	"negative"
	self assert: (list reject: [ :e | e < 1 ]) asArray equals: #( 1 2 ).
	self assert: list asArray equals: #( 1 2 ).
]

{ #category : #tests }
LinkedListLSTest >> testRemove [

	| list |
	list := LinkedListLS new.
	
	"empty list"
	list remove: 0.
	self assertEmpty: list.
	
	"1-element list, remove element with the value present (also the first element)"
	list add: 0.
	list remove: 0.
	self assertEmpty: list.
	list clear.
	
	"1-element list, remove element with the value not present"
	list add: 1.
	list remove: 0.
	self assert: list asArray equals: #(1).
	
	"many elements list, remove element with the value present, check that only the first occurance was removed"
	list add: 1.
	list remove: 1.
	self assert: list asArray equals: #(1).
	
	"many elements list, remove element with the value present, in the middle "
	list add: 2.
	list add: 3.	
	list remove: 2.
	self assert: list asArray equals: #(1 3).
	
	"many elements list, remove element with the value present, last "
	list add: 4.	
	list remove: 4.
	self assert: list asArray equals: #(1 3).
	
	
]

{ #category : #tests }
LinkedListLSTest >> testRemoveFirst [

	| list |
	list := LinkedListLS new.
	
	"empty list"
	list removeFirst.
	self assertEmpty: list.
	
	"list with elements"
	list add: 1.
	list add: 2.
	list removeFirst.
	self assert: list asArray equals: #( 2 ). 
]

{ #category : #tests }
LinkedListLSTest >> testRemoveLast [

	| list |
	list := LinkedListLS new.
	
	"empty list"
	list removeLast.
	self assertEmpty: list.
	
	"list with elements"
	list add: 1.
	list add: 2.
	list removeLast.
	self assert: list asArray equals: #( 1 ). 
]

{ #category : #tests }
LinkedListLSTest >> testSelect [
	
	| list |
	
	list := LinkedListLS new.
 	list add: 1.
	list add: 2.
	
	"positive"
	self assert: (list select: [ :e | e > 1 ]) asArray equals: #( 2 ).
	self assert: list asArray equals: #( 1 2 ).
	
	
	"negative"
	self assert: (list select: [ :e | e < 1 ]) asArray equals: #(  ).
	self assert: list asArray equals: #( 1 2 ).
]

{ #category : #tests }
LinkedListLSTest >> testSize [

	| list |
	list := LinkedListLS new.
	self assert: (list size) equals: 0.
	
	list add: 1.
	self assert: (list size) equals: 1.

	list remove: 1.
	self assert: (list size) equals: 0. 	
		
	list add: 1.
	list add: 2.
	self assert: (list size) equals: 2.
	
	list clear.
	self assert: (list size) equals: 0.
	
	
]
