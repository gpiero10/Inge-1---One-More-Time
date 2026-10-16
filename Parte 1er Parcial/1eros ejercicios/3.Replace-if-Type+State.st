!classDefinition: #EngineState category: #'3.Replace-if-Type+State'!
Object subclass: #EngineState
	instanceVariableNames: 'vehicle'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!EngineState methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 1:49:23 pm (UTC)'!
!methodProperties: {}!
accelerate

	self subclassResponsibility! !

!EngineState methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 3:10:10 pm (UTC)'!
!methodProperties: {}!
initFor: aVehicle
	vehicle  := aVehicle ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EngineState class' category: #'3.Replace-if-Type+State'!
EngineState class
	instanceVariableNames: ''!

!EngineState class methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 3:09:45 pm (UTC)'!
!methodProperties: {}!
initializeEngineStateFor: aVehicle
	^ self new initFor: aVehicle ! !


!classDefinition: #EngineOff category: #'3.Replace-if-Type+State'!
EngineState subclass: #EngineOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!EngineOff methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 2:48:02 pm (UTC)'!
!methodProperties: {}!
accelerate
	vehicle accelerateWhenEngineIsOff.! !


!classDefinition: #EngineOn category: #'3.Replace-if-Type+State'!
EngineState subclass: #EngineOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!EngineOn methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 1:49:18 pm (UTC)'!
!methodProperties: {}!
accelerate! !


!classDefinition: #SpeedLimiter category: #'3.Replace-if-Type+State'!
Object subclass: #SpeedLimiter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!SpeedLimiter methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 5:11:41 pm (UTC)'!
!methodProperties: {}!
checkLimitFor: aSpeed
	self subclassResponsibility ! !


!classDefinition: #SpeedLimitInAir category: #'3.Replace-if-Type+State'!
SpeedLimiter subclass: #SpeedLimitInAir
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!SpeedLimitInAir methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 5:14:08 pm (UTC)'!
!methodProperties: {}!
checkLimitFor: aSpeed 

	aSpeed > (500 * (kilómetro / hour)) 
		ifTrue: [^500 * (kilómetro / hour)].
	
	^aSpeed.! !


!classDefinition: #SpeedLimitInCity category: #'3.Replace-if-Type+State'!
SpeedLimiter subclass: #SpeedLimitInCity
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!SpeedLimitInCity methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 5:14:33 pm (UTC)'!
!methodProperties: {}!
checkLimitFor: aSpeed 

	aSpeed > (70 * (kilómetro / hour)) 
		ifTrue: [^70 * (kilómetro / hour)].
	
	^aSpeed.! !


!classDefinition: #SpeedLimitInOpenRoads category: #'3.Replace-if-Type+State'!
SpeedLimiter subclass: #SpeedLimitInOpenRoads
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!SpeedLimitInOpenRoads methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 5:14:48 pm (UTC)'!
!methodProperties: {}!
checkLimitFor: aSpeed 

	aSpeed > (130 * (kilómetro / hour)) 
		ifTrue: [^130 * (kilómetro / hour)].
	
	^aSpeed.! !


!classDefinition: #Vehicle category: #'3.Replace-if-Type+State'!
Object subclass: #Vehicle
	instanceVariableNames: 'state type speed limiter'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Vehicle methodsFor: 'initialization' stamp: 'gs 30/Aug/2026, 3:07:31 pm (UTC)'!
!methodProperties: {}!
initializeVehicle

	self subclassResponsibility! !


!Vehicle methodsFor: 'move' stamp: 'gs 30/Aug/2026, 3:02:03 pm (UTC)'!
!methodProperties: {}!
accelerate
	
	self subclassResponsibility. ! !


!Vehicle methodsFor: 'on/off' stamp: 'gs 30/Aug/2026, 3:10:43 pm (UTC)'!
!methodProperties: {}!
turnOff

	state := EngineOff initializeEngineStateFor: self.! !

!Vehicle methodsFor: 'on/off' stamp: 'gs 30/Aug/2026, 3:10:53 pm (UTC)'!
!methodProperties: {}!
turnOn

	state := EngineOn initializeEngineStateFor: self.! !


!Vehicle methodsFor: 'error messages' stamp: 'gs 30/Aug/2026, 3:01:16 pm (UTC)'!
!methodProperties: {}!
accelerateWhenEngineIsOff
	
	self error: self canNotAccelerateErrorMessage.! !

!Vehicle methodsFor: 'error messages' stamp: 'gs 30/Aug/2026, 3:01:12 pm (UTC)'!
!methodProperties: {}!
canNotAccelerateErrorMessage

	self subclassResponsibility.! !


!Vehicle methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 4:21:57 pm (UTC)'!
!methodProperties: {}!
speedAt: aSpeed 
	^ speed = aSpeed ! !


!Vehicle methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 6:10:53 pm (UTC)'!
!methodProperties: {}!
in: lugar 
	limiter :=lugar. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'3.Replace-if-Type+State'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'gs 30/Aug/2026, 3:06:15 pm (UTC)'!
!methodProperties: {}!
initializeNewVehicle

	^self new initializeVehicle! !


!classDefinition: #Helicopter category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Helicopter methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 6:18:22 pm (UTC)'!
!methodProperties: {}!
accelerate
	
	state accelerate.
	
	speed := limiter checkLimitFor: (type calcularNuevaVelocidad: speed).
	altitude := altitude + (5 * meter).
	 ! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 3:00:22 pm (UTC)'!
!methodProperties: {}!
canNotAccelerateErrorMessage

	^'Can not fly when turned off'.! !


!Helicopter methodsFor: 'initialization' stamp: 'gs 30/Aug/2026, 6:15:55 pm (UTC)'!
!methodProperties: {}!
initializeNewHelicopter
	self initializeVehicle.
	type := MotorJetFueled new.
	limiter := SpeedLimitInAir new.! !

!Helicopter methodsFor: 'initialization' stamp: 'gs 30/Aug/2026, 3:11:13 pm (UTC)'!
!methodProperties: {}!
initializeVehicle

	state := EngineOff initializeEngineStateFor: self.
	speed := 0 * kilometer / hour.
	altitude := 0 * meter.! !


!Helicopter methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 4:22:40 pm (UTC)'!
!methodProperties: {}!
altitudeAt: unaAltitud 
	^altitude = unaAltitud ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Helicopter class' category: #'3.Replace-if-Type+State'!
Helicopter class
	instanceVariableNames: ''!

!Helicopter class methodsFor: 'instance creation' stamp: 'gs 30/Aug/2026, 4:20:18 pm (UTC)'!
!methodProperties: {}!
newHelicopter
	
	^self new initializeNewHelicopter! !


!classDefinition: #Motorcycle category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 5:20:44 pm (UTC)'!
!methodProperties: {}!
accelerate

	state accelerate.
	speed := limiter checkLimitFor: (type calcularNuevaVelocidad: speed). ! !

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 3:00:52 pm (UTC)'!
!methodProperties: {}!
canNotAccelerateErrorMessage

	^'Can not run when turned off'.! !


!Motorcycle methodsFor: 'initialization' stamp: 'gs 30/Aug/2026, 5:19:42 pm (UTC)'!
!methodProperties: {}!
initializeInitializeNewElectricMotorcycle
	self initializeVehicle.
	type := MotorElectrico new. 
	limiter := SpeedLimitInCity new.! !

!Motorcycle methodsFor: 'initialization' stamp: 'gs 30/Aug/2026, 4:47:25 pm (UTC)'!
!methodProperties: {}!
initializeInitializeNewGasolineMotorcycle
	self initializeVehicle.
	type := MotorGasolina new.! !

!Motorcycle methodsFor: 'initialization' stamp: 'gs 30/Aug/2026, 3:11:19 pm (UTC)'!
!methodProperties: {}!
initializeVehicle

	state := EngineOff initializeEngineStateFor: self.
	speed := 0 * kilometer / hour.
	! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Motorcycle class' category: #'3.Replace-if-Type+State'!
Motorcycle class
	instanceVariableNames: ''!

!Motorcycle class methodsFor: 'instance creation' stamp: 'gs 30/Aug/2026, 4:06:02 pm (UTC)'!
!methodProperties: {}!
initializeNewElectricMotorcycle
	
	^self new initializeInitializeNewElectricMotorcycle! !

!Motorcycle class methodsFor: 'instance creation' stamp: 'gs 30/Aug/2026, 4:46:50 pm (UTC)'!
!methodProperties: {}!
initializeNewGasolineMotorcycle
	
	^self new initializeInitializeNewGasolineMotorcycle! !
