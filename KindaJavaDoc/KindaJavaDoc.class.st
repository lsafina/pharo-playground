"
I am a little class implementing the following requirements:
	
	""a little javadoc: I give a class X and it generates   
	X is subclass of Z   
	has ghjhjh instances varibale   
	comment   
	ist of method   
	foo: arg         
		“method foo: comment”""
		
You can use me as ""KindaJavaDoc new whoAreYou: %className%""
		
I think my method ""whoAreYou"" should be implemented as an Object method, but I am too humble to mess with the Object yet.

Also I prune the result if it is longer than standard 5000 symbols, because my stupid creator has not find out how to fix it yet.
"
Class {
	#name : #KindaJavaDoc,
	#superclass : #Object,
	#category : #KindaJavaDoc
}

{ #category : #documenting }
KindaJavaDoc >> whoAreYou: aClass [  
	"a little javadoc: I give a class X and it generates   
	X is subclass of Z   
	has ghjhjh instances varibale   
	comment   
	ist of method   
	foo: arg         
		“method foo: comment”"
		
^'{1} is subclass of {2} 
	
Instance variable(s): [{3}] 
	
Class comment: [{4}... (the rest of the comment is supressed)] 
	
List of methods: 
{5} ' 
	
format: 
{aClass . 
(aClass superclass) . 
(Character space join: (aClass instanceVariables collect: [:each | each name ])) .
((aClass comment splitOn: '
') first) . 
(Character space join: (aClass methods collect: [ :m| ((m name splitOn: '#') last asString , ' 
	"', m comment asString, '" 
')])) 
}
]
