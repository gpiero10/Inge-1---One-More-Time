!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'tope'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'tests' stamp: 'gs 5/Sep/2026, 3:35:46 pm (UTC)'!
!methodProperties: {}!
isEmpty

	^ tope isEmpty
	! !

!OOStack methodsFor: 'tests' stamp: 'gs 3/Sep/2026, 1:41:27 pm (UTC)'!
!methodProperties: {}!
stackVacioProtocolo
	^self error: self class stackEmptyErrorDescription ! !


!OOStack methodsFor: 'push' stamp: 'gs 5/Sep/2026, 3:40:56 pm (UTC)'!
!methodProperties: {}!
pop
	|elem|
	elem := tope getElement.
	tope := tope elementBehind.
	
	^elem! !

!OOStack methodsFor: 'push' stamp: 'gs 5/Sep/2026, 3:32:03 pm (UTC)'!
!methodProperties: {}!
push: elemento 
	tope := OOStackPushedElement for: elemento over: tope.! !

!OOStack methodsFor: 'push' stamp: 'gs 5/Sep/2026, 3:32:38 pm (UTC)'!
!methodProperties: {}!
top
	^ tope getElement! !


!OOStack methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 3:36:03 pm (UTC)'!
!methodProperties: {}!
initialize
	tope := OOStackBase newFor: self.! !


!OOStack methodsFor: 'accessing' stamp: 'gs 5/Sep/2026, 3:36:53 pm (UTC)'!
!methodProperties: {}!
size
	^ tope getCurrentStackPointer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'gs 5/Sep/2026, 5:25:56 pm (UTC)'!
!methodProperties: {}!
errorPrefijoNoPuedeTenerEspaciosVacios
	^ 'prefijo No Puede Tener Espacios Vacios'! !

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


!OOStackElement methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 3:44:31 pm (UTC)'!
!methodProperties: {}!
elementBehind

	self subclassResponsibility! !

!OOStackElement methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 3:46:24 pm (UTC)'!
!methodProperties: {}!
getCurrentStackPointer

	self subclassResponsibility! !

!OOStackElement methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 3:39:49 pm (UTC)'!
!methodProperties: {}!
isEmpty

	self subclassResponsibility! !


!classDefinition: #OOStackBase category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackBase
	instanceVariableNames: 'oOStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackBase methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 3:45:00 pm (UTC)'!
!methodProperties: {}!
elementBehind
	"nothing" ! !

!OOStackBase methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 3:46:35 pm (UTC)'!
!methodProperties: {}!
getCurrentStackPointer
	^0 ! !

!OOStackBase methodsFor: 'as yet unclassified' stamp: 'gs 3/Sep/2026, 1:41:00 pm (UTC)'!
!methodProperties: {}!
getElement
	^oOStack stackVacioProtocolo! !

!OOStackBase methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 3:37:47 pm (UTC)'!
!methodProperties: {}!
isEmpty
	^true! !


!OOStackBase methodsFor: 'initialization' stamp: 'gs 3/Sep/2026, 1:39:55 pm (UTC)'!
!methodProperties: {}!
initializeForAStack: anOOStack 
	
	oOStack := anOOStack.! !

!OOStackBase methodsFor: 'initialization' stamp: 'gs 5/Sep/2026, 3:37:30 pm (UTC)'!
!methodProperties: {}!
initializeNewFor: anOOStack 
	
	oOStack := anOOStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackBase class' category: #'Stack-Exercise'!
OOStackBase class
	instanceVariableNames: ''!

!OOStackBase class methodsFor: 'instance creation' stamp: 'gs 3/Sep/2026, 1:39:45 pm (UTC)'!
!methodProperties: {}!
forAStack: anOOStack 

	^self new initializeForAStack: anOOStack ! !

!OOStackBase class methodsFor: 'instance creation' stamp: 'gs 5/Sep/2026, 3:37:22 pm (UTC)'!
!methodProperties: {}!
newFor: anOOStack 

	^self new initializeNewFor: anOOStack ! !


!classDefinition: #OOStackPushedElement category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackPushedElement
	instanceVariableNames: 'elemento anteriorTope'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackPushedElement methodsFor: 'initialization' stamp: 'gs 5/Sep/2026, 3:39:02 pm (UTC)'!
!methodProperties: {}!
initializeFor: anElemento over: oldTope 
	
	elemento := anElemento.
	anteriorTope := oldTope.! !


!OOStackPushedElement methodsFor: 'get' stamp: 'gs 3/Sep/2026, 1:31:38 pm (UTC)'!
!methodProperties: {}!
getElement
	^elemento ! !


!OOStackPushedElement methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 3:40:32 pm (UTC)'!
!methodProperties: {}!
elementBehind
	^anteriorTope ! !

!OOStackPushedElement methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 3:46:14 pm (UTC)'!
!methodProperties: {}!
getCurrentStackPointer
	^ 1 + anteriorTope getCurrentStackPointer ! !

!OOStackPushedElement methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 3:39:49 pm (UTC)'!
!methodProperties: {}!
isEmpty
	^ false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackPushedElement class' category: #'Stack-Exercise'!
OOStackPushedElement class
	instanceVariableNames: ''!

!OOStackPushedElement class methodsFor: 'instance creation' stamp: 'gs 3/Sep/2026, 1:30:13 pm (UTC)'!
!methodProperties: {}!
for: elemento 
	
	^self new initializeFor: elemento ! !

!OOStackPushedElement class methodsFor: 'instance creation' stamp: 'gs 5/Sep/2026, 3:38:24 pm (UTC)'!
!methodProperties: {}!
for: elemento over: oldTope 

	^self new initializeFor: elemento over: oldTope ! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 5:42:13 pm (UTC)'!
!methodProperties: {}!
findSentencesWithPrefix: aPrefix inAStack: aStack 
	| stackTemp elem colleccion stackSize|
	
	aPrefix = '' ifTrue: [^self error: self class errorPrefijoNoPuedeSerVacio].
	(aPrefix includesSubString: ' ') 
	ifTrue: [^self error: self class errorPrefijoNoPuedeTenerEspaciosVacios].
	
	colleccion := Set new.
	stackTemp := OOStack new.
	stackSize := aStack size.
	
	stackSize timesRepeat: [
		elem := aStack pop.
		stackTemp push: elem.
		(elem prefixMatchesRegex: aPrefix) ifTrue: [ colleccion add: elem.].
	].
	
	stackSize timesRepeat: [ aStack push: stackTemp pop.].
	
	^ colleccion.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 5:20:10 pm (UTC)'!
!methodProperties: {}!
errorPrefijoNoPuedeSerVacio
	^'Empty prefix isnt supported'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 5:26:40 pm (UTC)'!
!methodProperties: {}!
errorPrefijoNoPuedeTenerEspaciosVacios
	^'prefijo no puede tener espacios vacios'! !


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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 5:44:50 pm (UTC)'!
!methodProperties: {}!
test00SentenceFinderNoEncuentraPrefijoCorrectamente
	|stack sentenceFinder|
	stack := OOStack new.
	
	sentenceFinder := SentenceFinderByPrefix new.
	
	self assert: (sentenceFinder findSentencesWithPrefix: 'Ben' inAStack: stack) 
		equals: (Set new).! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 4:41:29 pm (UTC)'!
!methodProperties: {}!
test01SentenceFinderEncuentraPrefijoCorrectamente
	|stack sentenceFinder|
	stack := OOStack new.
	stack push: 'Ben Arfa'; push: 'Eden Hazard'.
	
	sentenceFinder := SentenceFinderByPrefix new.
	
	self assert: (sentenceFinder findSentencesWithPrefix: 'Ben' inAStack: stack) 
		equals: (Set with: 'Ben Arfa').
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 4:41:22 pm (UTC)'!
!methodProperties: {}!
test02SentenceFinderEncuentraPrefijosCorrectamente
	|stack sentenceFinder|
	stack := OOStack new.
	stack push: 'Ben Arfa'; push: 'Eden Hazard'; push: 'Ben Tennison'.
	
	sentenceFinder := SentenceFinderByPrefix new.
	
	self assert: (sentenceFinder findSentencesWithPrefix: 'Ben' inAStack: stack) 
		equals: (Set with: 'Ben Arfa' with: 'Ben Tennison').! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 5:10:23 pm (UTC)'!
!methodProperties: {}!
test03SentenceFinderNoModificaStackPasadoPorParametro
	|stack sentenceFinder ben10 benArfa eden|
	stack := OOStack new.
	ben10 := 'Ben Tennison'.
	benArfa := 'Ben Arfa'.
	eden := 'Eden Hazard'.
	stack push: benArfa; push: eden; push: ben10.
	
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder findSentencesWithPrefix: 'Hatem' inAStack: stack.
	 
	self assert: stack pop equals: ben10 .
	self assert: stack pop equals: eden.
	self assert: stack pop equals: benArfa.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 5:20:49 pm (UTC)'!
!methodProperties: {}!
test04PrefijoNoPuedeSerVacio
	|stack sentenceFinder ben10 benArfa eden|
	stack := OOStack new.
	ben10 := 'Ben Tennison'.
	benArfa := 'Ben Arfa'.
	eden := 'Eden Hazard'.
	stack push: benArfa; push: eden; push: ben10.
	sentenceFinder := SentenceFinderByPrefix new.
	
	self should: [sentenceFinder findSentencesWithPrefix: '' inAStack: stack] 
		raise: Error
		withExceptionDo: [ :error | self assert: error messageText equals: SentenceFinderByPrefix 
			errorPrefijoNoPuedeSerVacio].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'gs 5/Sep/2026, 5:43:49 pm (UTC)'!
!methodProperties: {}!
test05PrefijoNoPuedeContenerEspaciosVacios
	|stack sentenceFinder ben10 benArfa eden|
	stack := OOStack new.
	ben10 := 'Ben Tennison'.
	benArfa := 'Ben Arfa'.
	eden := 'Eden Hazard'.
	stack push: benArfa; push: eden; push: ben10.
	sentenceFinder := SentenceFinderByPrefix new.
	
	self should: [sentenceFinder findSentencesWithPrefix: 'Ben ' inAStack: stack] 
		raise: Error
		withExceptionDo: [ :error | self assert: error messageText equals: SentenceFinderByPrefix 
			errorPrefijoNoPuedeTenerEspaciosVacios].! !
