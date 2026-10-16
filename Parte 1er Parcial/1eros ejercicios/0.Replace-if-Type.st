!classDefinition: #Helicoptero category: #'0.Replace-if-Type'!
Vehicle subclass: #Helicoptero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '0.Replace-if-Type'!

!Helicoptero methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 1:03:46 am (UTC)'!
!methodProperties: {}!
accelerate
	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter).! !


!Helicoptero methodsFor: 'initialization' stamp: 'gs 30/Aug/2026, 3:07:31 pm (UTC)'!
!methodProperties: {}!
initializeVehicle

	state := EngineOff new.
	speed := 0 * kilometer / hour.
	altitude := 0 * meter! !


!classDefinition: #Moto category: #'0.Replace-if-Type'!
Vehicle subclass: #Moto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '0.Replace-if-Type'!

!Moto methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 1:04:06 am (UTC)'!
!methodProperties: {}!
accelerate
	speed := speed + (20 * kilometer / hour).
	 ! !


!Moto methodsFor: 'initialization' stamp: 'gs 30/Aug/2026, 3:07:31 pm (UTC)'!
!methodProperties: {}!
initializeVehicle

	state := EngineOff new.
	speed := 0 * kilometer / hour.
	altitude := 0 * meter! !
