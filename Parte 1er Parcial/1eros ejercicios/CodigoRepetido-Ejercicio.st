!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 3/Apr/2019, 1:14:26 pm (UTC)'!
!methodProperties: {}!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 3/Apr/2019, 1:14:26 pm (UTC)'!
!methodProperties: {}!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 17/Sep/2020, 10:23:04 am (UTC)'!
!methodProperties: {}!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 3/Apr/2019, 1:14:26 pm (UTC)'!
!methodProperties: {}!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 3/Apr/2019, 1:14:26 pm (UTC)'!
!methodProperties: {}!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 3/Apr/2019, 1:14:26 pm (UTC)'!
!methodProperties: {}!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 19/Sep/2018, 8:36:09 pm (UTC)'!
!methodProperties: {}!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'gs 28/Aug/2026, 7:20:33 pm (UTC)'!
!methodProperties: {}!
removeCustomerNamed: aName 
	 
	^ active remove: aName ifAbsent: [ suspended remove: aName ifAbsent: [ ^ NotFound signal.] ]
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 6/Jul/2011, 8:52:00 pm (UTC)'!
!methodProperties: {}!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 6/Jul/2011, 8:51:00 pm (UTC)'!
!methodProperties: {}!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 3/Apr/2019, 1:14:26 pm (UTC)'!
!methodProperties: {}!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 10/Apr/2023, 1:25:52 am (UTC)'!
!methodProperties: {}!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'.! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 10/Apr/2023, 1:25:56 am (UTC)'!
!methodProperties: {}!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'.! !


!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'repe' stamp: 'gs 30/Aug/2026, 12:09:32 am (UTC)'!
!methodProperties: {}!
cantidadDeClientesDe: unBook activosEsIgualA: unaCantidad yDeSuspendidosEs: otraCantidad 
	self assert: unaCantidad equals:  unBook  numberOfActiveCustomers.
	self assert: otraCantidad equals:  unBook  numberOfSuspendedCustomers.
	self assert: unaCantidad + otraCantidad equals:  unBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'repe' stamp: 'gs 28/Aug/2026, 7:42:27 pm (UTC)'!
!methodProperties: {}!
estaAccion: unBloque noDeberiaDemorarMasDe: unTiempo 
	|inicio fin|
	inicio := Time millisecondClockValue * millisecond.
	unBloque value.
	fin := inicio := Time millisecondClockValue * millisecond.
	
	^ (fin - inicio < unTiempo).
	
	! !

!CustomerBookTest methodsFor: 'repe' stamp: 'gs 30/Aug/2026, 12:31:48 am (UTC)'!
!methodProperties: {}!
should: aBlockThatShouldFail raise: anError assert: conditions
	
	[aBlockThatShouldFail value. self fail] on: anError do: conditions.! !


!CustomerBookTest methodsFor: 'testing' stamp: 'gs 28/Aug/2026, 7:43:39 pm (UTC)'!
!methodProperties: {}!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self estaAccion: [customerBook addCustomerNamed: 'John Lennon'.]  noDeberiaDemorarMasDe: 50*millisecond. 
	
	
	
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gs 29/Aug/2026, 11:02:08 pm (UTC)'!
!methodProperties: {}!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'Paul Pogba'.
	self assert: (self estaAccion: [customerBook removeCustomerNamed: 'Paul Pogba'.]  noDeberiaDemorarMasDe: 
	100*millisecond). 
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 12:37:15 am (UTC)'!
!methodProperties: {}!
test03CanNotAddACustomerWithEmptyName 
	| customerBook |
	customerBook := CustomerBook new.
	
	self should: [ customerBook addCustomerNamed: ''.]
		raise: Error 
		assert: [ :anError | 
			self assert: anError messageText = CustomerBook 
			customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 12:38:39 am (UTC)'!
!methodProperties: {}!
test04CanNotRemoveAnInvalidCustomer
	| customerBook johnLennon |
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self should: [ customerBook removeCustomerNamed: 'Paul McCartney'.] 
		raise: NotFound 
		assert: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 12:34:51 am (UTC)'!
!methodProperties: {}!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| customerBook paulMcCartney|
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self cantidadDeClientesDe: customerBook activosEsIgualA: 0  yDeSuspendidosEs: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 12:34:40 am (UTC)'!
!methodProperties: {}!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	| customerBook paulMcCartney|
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self cantidadDeClientesDe: customerBook activosEsIgualA: 0  yDeSuspendidosEs: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 12:34:13 am (UTC)'!
!methodProperties: {}!
test07CanNotSuspendAnInvalidCustomer
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self should: [ customerBook suspendCustomerNamed: 'Ringo Starr'.] raise: CantSuspend 
	assert: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 12:34:08 am (UTC)'!
!methodProperties: {}!
test08CanNotSuspendAnAlreadySuspendedCustomer
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
		
	self should: [ customerBook suspendCustomerNamed: johnLennon.] raise: CantSuspend 
	assert: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
		
! !
