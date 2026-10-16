!classDefinition: #Automobile category: #'2.Replace-if-State'!
Object subclass: #Automobile
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Automobile methodsFor: 'initialization' stamp: 'gs 30/Aug/2026, 2:52:45 am (UTC)'!
!methodProperties: {}!
initialize

	state := MotorOff newFor: self.
	speed := 0 * kilometer / hour! !

!Automobile methodsFor: 'initialization' stamp: 'NR 16/Sep/2025, 9:35:07 am (UTC)'!
!methodProperties: {}!
initializeWithEngineType: anEngineType
	
	engineType := anEngineType.
	speed := 0 * kilometer / hour! !


!Automobile methodsFor: 'move' stamp: 'gs 30/Aug/2026, 2:48:59 am (UTC)'!
!methodProperties: {}!
accelerate
	
	"state = #Off ifTrue:[self error: 'Can not accelerate when turned off'].
	state = #On ifTrue:[speed := speed + (10 * kilometer / hour)]."
	state accelerate.! !

!Automobile methodsFor: 'move' stamp: 'ARM 29/Apr/2024, 1:51:37 pm (UTC)'!
!methodProperties: {}!
turnOn

	state := #On! !


!Automobile methodsFor: 'state' stamp: 'gs 30/Aug/2026, 2:51:35 am (UTC)'!
!methodProperties: {}!
accelerateWhenOff
	self error: 'Can not accelerate when turned off'.! !

!Automobile methodsFor: 'state' stamp: 'gs 30/Aug/2026, 2:51:47 am (UTC)'!
!methodProperties: {}!
accelerateWhenOn
	speed := speed + (10 * kilometer / hour)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Automobile class' category: #'2.Replace-if-State'!
Automobile class
	instanceVariableNames: ''!

!Automobile class methodsFor: 'instance creation' stamp: 'gs 30/Aug/2026, 1:32:56 am (UTC)'!
!methodProperties: {}!
electric

	^ self new initializeWithEngineType: MotorElectrico new.

! !

!Automobile class methodsFor: 'instance creation' stamp: 'gs 30/Aug/2026, 1:32:44 am (UTC)'!
!methodProperties: {}!
gasoline

	^ self new initializeWithEngineType: MotorGasolina new.! !

!Automobile class methodsFor: 'instance creation' stamp: 'gs 30/Aug/2026, 1:32:33 am (UTC)'!
!methodProperties: {}!
jetFueled

	^ self new initializeWithEngineType:  MotorJetFueled new.! !


!classDefinition: #MotorState category: #'2.Replace-if-State'!
Object subclass: #MotorState
	instanceVariableNames: 'auto'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!MotorState methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 2:49:22 am (UTC)'!
!methodProperties: {}!
accelerate

	self subclassResponsibility! !

!MotorState methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 2:48:25 am (UTC)'!
!methodProperties: {}!
initializeForACar: aCar
	auto  := aCar.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MotorState class' category: #'2.Replace-if-State'!
MotorState class
	instanceVariableNames: ''!

!MotorState class methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 2:47:58 am (UTC)'!
!methodProperties: {}!
newFor: aCar
	^self initializeForACar: aCar.! !


!classDefinition: #MotorOff category: #'2.Replace-if-State'!
MotorState subclass: #MotorOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!MotorOff methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 2:50:20 am (UTC)'!
!methodProperties: {}!
accelerate
	auto accelerateWhenOff. ! !


!classDefinition: #MotorOn category: #'2.Replace-if-State'!
MotorState subclass: #MotorOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!MotorOn methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 2:50:36 am (UTC)'!
!methodProperties: {}!
accelerate
	auto accelerateWhenOn.! !
