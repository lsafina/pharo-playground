"
I represent a single-linked list.
I store a first element of a NodeLS class, that has information of the next node in the list.
I allow nil-values and duplicates.  
"
Class {
	#name : #LinkedListLS,
	#superclass : #Object,
	#instVars : [
		'first'
	],
	#category : #LinkedListLS
}

{ #category : #'adding nodes' }
LinkedListLS >> add: aValue [
	"adds a value to the end of the list,
	 returns the list"	
			
	self addLast: aValue.
	^ self
	
	
	
	
]

{ #category : #adding }
LinkedListLS >> addAll: aList [
	"adds all elements of aList to the list,
	 returns the list"
	
	aList do: [ :each | self addLast: each ].
	^self
		
			
]

{ #category : #adding }
LinkedListLS >> addFirst: aValue [
	"adds a node with aValue to the beginning of the list
	 returns the list"	
			
	|temp|
	
	self isEmpty ifTrue: [ first := NodeLS new value: aValue. ^ self ].
	
	temp := NodeLS new value: aValue; nextNode: first.
	
	first := temp.
	^self
	 
	
	

]

{ #category : #adding }
LinkedListLS >> addLast: aValue [
	"adds a node with aValue to the end of the list,
	 returns the list"	
			
	| temp |
	
	temp := NodeLS new value: aValue.
	self last ifNil: [ first := temp. ^ self ].
	 
	self last nextNode: temp. ^ self
	
]

{ #category : #converting }
LinkedListLS >> asArray [
	"this method was ""honnêtement dérobé"" from the system library, but just for testing 	purposes 
	 Return a new Array containing my elements"
	
	^ Array streamContents: [ :out |
		self do: [ :each | out nextPut: each ] ]
]

{ #category : #accessing }
LinkedListLS >> clear [
	"erases all elements from the list,
	 returns nothing"	
			
	first := nil
]

{ #category : #enumerating }
LinkedListLS >> collect: aBlock [
	"builds a new list of the same size evaluating each element with aBlock,
	 returns a newly built list"
			
	| list |
	list := self class new.
	
	self do: [ :each | list add: (aBlock value: each) ].
	^ list
]

{ #category : #enumerating }
LinkedListLS >> detect: aBlock [
	"returns a first element in the list which has satisfied the evaluation of the aBlock condition or nil if there is no such element"
			
	self do: [ :each | (aBlock value: each) ifTrue: [ ^ each ] ].
	^ nil.
	
	
]

{ #category : #enumerating }
LinkedListLS >> do: aBlock [
	"evalutes aBlock for each element of the list,
	 returns the list"	
			
	| temp |
	
	temp := first.
	[ temp ] 
		whileNotNil:  [ 
	 		aBlock value: temp value.
			temp := temp nextNode 
			].
	^self.	
]

{ #category : #accessing }
LinkedListLS >> first [
	"returns the first node of the list"

	^ first
]

{ #category : #accessing }
LinkedListLS >> first: anObject [
	"sets the first node of the list to anObject"

	first := anObject
]

{ #category : #testing }
LinkedListLS >> includes: aValue [
	"returns true if the list has a node with aValue, returns false otherwise"	
			
	| temp |
	
	temp := first.
	[temp] whileNotNil: [ temp value = aValue ifTrue: [^ true ]. temp := temp nextNode].
	^false
	
]

{ #category : #testing }
LinkedListLS >> isEmpty [
	"returns true if the collectin is empty, false otherwise"	
			
	^ first isNil.
]

{ #category : #accessing }
LinkedListLS >> last [
	"returns the last element in the list or nil if the list is empty"	
			
	| temp |
	
	first ifNil: [ ^ nil ].
	
	temp := first.  
	[ temp hasNext] whileTrue: [ temp := temp nextNode ].
	^ temp
]

{ #category : #'accessing - arguments' }
LinkedListLS >> penult [
	"a service method needed to remove things more easily, 
	 returns a penultimate node in the list for the list of 2 elements or more, 
	 returns nil otherwise"	
			
	| temp prev|
	
	first ifNil: [ ^ nil ].
	first hasNext 
		ifFalse: [ ^ nil ]
		ifTrue: [ 
		prev := first. temp := first nextNode. 
			[ temp hasNext] whileTrue: [ prev := prev nextNode. temp := temp nextNode ].
			^ prev
		].  
	
	  
	
]

{ #category : #'accessing - arguments' }
LinkedListLS >> penult: aValue [
	"a service method needed to remove things more easily,
	 returns a penultimate node of the node with aValue in the list for the list of 2 	 	 	elements or more, 
	returns nil if there is no such element or the list is of size < 2"	
			
	| prev next |
	
	first ifNil: [ ^ nil ].
	first hasNext 
		ifFalse: [ ^ nil ]
		ifTrue: [ 
			prev := first. next := first nextNode.
			 [ next ] whileNotNil: [ 
				next value = aValue ifTrue: [ ^ prev ].
				prev := prev nextNode. next := next nextNode 
			].
		].  
	^ nil.
	  
	
]

{ #category : #enumerating }
LinkedListLS >> reject: aBlock [
	"builds a new list containing elements which has not satisfied the evaluation of the aBlock condition, 
	returns newly built list"
	
	| temp |
	temp := LinkedListLS new.
	
	self do: [ :each | (aBlock value: each) ifFalse: [ temp add: each ] ].
	^ temp
	
]

{ #category : #removing }
LinkedListLS >> remove: aValue [
	"removes the first occurence of aValue, 
	 returns the list"	
		
	| prev temp |
	
	prev := self penult: aValue.
	prev ifNotNil: [ 
		temp := prev nextNode.
		temp hasNext 
			ifTrue: [ prev nextNode: temp nextNode ]
			ifFalse: [ prev nextNode: nil ].
		^self
	].

	first value = aValue ifTrue: [ self removeFirst ]. 
	^ self
]

{ #category : #removing }
LinkedListLS >> removeFirst [
	"removes the first element of the list,
	 returns the list"	
			
	self isEmpty ifFalse: [ 
		first hasNext 
			ifTrue: [ first := first nextNode ]
			ifFalse: [ self clear ]
		 ].
	^ self
	
	
]

{ #category : #removing }
LinkedListLS >> removeLast [
	"removes the last element of the list
	 returns the list"	
			
	| temp |
	
	self size > 1 ifTrue: [temp := self penult. temp nextNode: nil. ^ self].
	self isEmpty 
		ifFalse: [ self clear ].
	^ self
]

{ #category : #enumerating }
LinkedListLS >> select: aBlock [
	"builds a new list containing elements which has satisfied the evaluation of the aBlock condition,
	returns the newly built list"
			
	| temp |
	temp := LinkedListLS new.
	
	self do: [ :each | (aBlock value: each) ifTrue: [ temp add: each ] ].
	^ temp
]

{ #category : #accessing }
LinkedListLS >> size [
	"returns the amount of elements in the list"	
			
	| temp size |
	
	temp := first. size := 0.
	[temp] whileNotNil: [ size := size + 1. temp := temp nextNode].
	^ size
]
