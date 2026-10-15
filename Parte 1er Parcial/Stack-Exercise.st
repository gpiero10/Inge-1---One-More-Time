!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'pila'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'tests' stamp: 'gs 3/Sep/2026, 1:47:26 pm (UTC)'!
!methodProperties: {}!
isEmpty
	^self size = 0
	! !

!OOStack methodsFor: 'tests' stamp: 'gs 3/Sep/2026, 1:41:27 pm (UTC)'!
!methodProperties: {}!
stackVacioProtocolo
	^self error: self class stackEmptyErrorDescription ! !


!OOStack methodsFor: 'push' stamp: 'gs 3/Sep/2026, 1:43:54 pm (UTC)'!
!methodProperties: {}!
pop
	|elem|
	elem := pila removeLast.
	
	^elem getElement! !

!OOStack methodsFor: 'push' stamp: 'gs 3/Sep/2026, 1:44:04 pm (UTC)'!
!methodProperties: {}!
push: elemento 
	pila add: (OOStackPushedElement for: elemento).! !

!OOStack methodsFor: 'push' stamp: 'gs 3/Sep/2026, 1:43:29 pm (UTC)'!
!methodProperties: {}!
top
	|elem|
	elem := pila at: pila size.
	
	^elem getElement! !


!OOStack methodsFor: 'as yet unclassified' stamp: 'gs 3/Sep/2026, 1:39:25 pm (UTC)'!
!methodProperties: {}!
initialize
	pila := OrderedCollection with: (OOStackBase forAStack: self).! !


!OOStack methodsFor: 'accessing' stamp: 'gs 3/Sep/2026, 1:45:35 pm (UTC)'!
!methodProperties: {}!
size
	^pila size - 1 max: 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 14/Sep/2023, 11:12:21 am (UTC)'!
!methodProperties: {}!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackElement category: #'Stack-Exercise'!
Object subclass: #OOStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElement methodsFor: 'get' stamp: 'gs 3/Sep/2026, 1:33:35 pm (UTC)'!
!methodProperties: {}!
getElement

	self subclassResponsibility! !


!OOStackElement methodsFor: 'initialization' stamp: 'gs 3/Sep/2026, 1:36:06 pm (UTC)'!
!methodProperties: {}!
initializeFor: unElemento

	self subclassResponsibility! !


!classDefinition: #OOStackBase category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackBase
	instanceVariableNames: 'oOStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackBase methodsFor: 'as yet unclassified' stamp: 'gs 3/Sep/2026, 1:41:00 pm (UTC)'!
!methodProperties: {}!
getElement
	^oOStack stackVacioProtocolo! !


!OOStackBase methodsFor: 'initialization' stamp: 'gs 3/Sep/2026, 1:39:55 pm (UTC)'!
!methodProperties: {}!
initializeForAStack: anOOStack 
	
	oOStack := anOOStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackBase class' category: #'Stack-Exercise'!
OOStackBase class
	instanceVariableNames: ''!

!OOStackBase class methodsFor: 'instance creation' stamp: 'gs 3/Sep/2026, 1:39:45 pm (UTC)'!
!methodProperties: {}!
forAStack: anOOStack 

	^self new initializeForAStack: anOOStack ! !


!classDefinition: #OOStackPushedElement category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackPushedElement
	instanceVariableNames: 'elemento'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackPushedElement methodsFor: 'initialization' stamp: 'gs 3/Sep/2026, 1:30:52 pm (UTC)'!
!methodProperties: {}!
initializeFor: unElemento 
	
	elemento := unElemento.! !


!OOStackPushedElement methodsFor: 'get' stamp: 'gs 3/Sep/2026, 1:31:38 pm (UTC)'!
!methodProperties: {}!
getElement
	^elemento ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackPushedElement class' category: #'Stack-Exercise'!
OOStackPushedElement class
	instanceVariableNames: ''!

!OOStackPushedElement class methodsFor: 'instance creation' stamp: 'gs 3/Sep/2026, 1:30:13 pm (UTC)'!
!methodProperties: {}!
for: elemento 
	
	^self new initializeFor: elemento ! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 7/May/2012, 2:30:00 pm (UTC)'!
!methodProperties: {}!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 13/May/2020, 4:29:55 pm (UTC)'!
!methodProperties: {}!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 13/May/2020, 4:30:01 pm (UTC)'!
!methodProperties: {}!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 13/May/2020, 4:30:09 pm (UTC)'!
!methodProperties: {}!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 16/Sep/2021, 8:40:17 pm (UTC)'!
!methodProperties: {}!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 13/May/2020, 4:30:20 pm (UTC)'!
!methodProperties: {}!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 13/May/2020, 4:30:24 pm (UTC)'!
!methodProperties: {}!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 15/Apr/2017, 1:48:26 am (UTC)'!
!methodProperties: {}!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 13/May/2020, 4:30:31 pm (UTC)'!
!methodProperties: {}!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 15/Apr/2017, 1:48:44 am (UTC)'!
!methodProperties: {}!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
