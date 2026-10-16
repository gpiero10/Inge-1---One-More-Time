!classDefinition: #VehicleTests category: #'4.Replace-if-All'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!VehicleTests methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 4:04:39 pm (UTC)'!
!methodProperties: {}!
test01LandVehicleCannotAccelerateWhileTurnedOff

	| landVehicle |
	
	landVehicle := self newElectricMotorcycycle.
	
	self should: [ landVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not run when turned off'.
		self assert: (landVehicle speedAt: (0 * kilometer / hour)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 4:19:27 pm (UTC)'!
!methodProperties: {}!
test02AirVehicleCannotAccelerateWhileTurnedOff

	| airVehicle |
	
	airVehicle := self newHelicopter.
	
	self should: [ airVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not fly when turned off'.
		self assert: (airVehicle speedAt: (0 * kilometer / hour)).
		self assert: (airVehicle altitudeAt: (0 * meter)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 4:23:43 pm (UTC)'!
!methodProperties: {}!
test03ElectricVehicleAccelerateAsIntended
	| electricVehicle |
	electricVehicle := self newElectricMotorcycycle.
	
	electricVehicle turnOn.
	self assert: (electricVehicle speedAt: 0 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 10 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 40 * kilometer / hour).! !

!VehicleTests methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 6:07:31 pm (UTC)'!
!methodProperties: {}!
test04GasolineVehicleAccelerateAsIntended
	| gasolineVehicle |
	gasolineVehicle := self newGasolineMotoTaxiInCity.
	
	gasolineVehicle turnOn.
	self assert: (gasolineVehicle speedAt: 0 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 10 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 20 * kilometer / hour).! !

!VehicleTests methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 4:19:27 pm (UTC)'!
!methodProperties: {}!
test05JetFueledVehicleAccelerateAsIntended

	| jetFueledVehicle |
	
	jetFueledVehicle := self newHelicopter.
	
	jetFueledVehicle turnOn.
	self assert: (jetFueledVehicle speedAt: 0 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 1 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 5 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 41 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 5:03:15 pm (UTC)'!
!methodProperties: {}!
test06AirVehicleGoesUpAsItAcceleratesAsExpected

	| airVehicle |	
	airVehicle := self newHelicopter.
	
	airVehicle turnOn.
	self assert: (airVehicle altitudeAt: 0 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 5 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 10 * meter)
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 5:21:24 pm (UTC)'!
!methodProperties: {}!
test07SpeedLimiterForCityLimitsSpeedAt70Kmh
	| cityVehicle |
	cityVehicle := self newElectricMotorcycycleInCity.
	cityVehicle turnOn.
	
	self assert: (cityVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ cityVehicle accelerate ].
	self assert: (cityVehicle speedAt: 70 * kilometer / hour).! !

!VehicleTests methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 6:08:54 pm (UTC)'!
!methodProperties: {}!
test08SpeedLimiterForOpenRoadLimitsSpeedAt130Kmh
	| openRoadVehicle |
	openRoadVehicle := self newGasolineMotoTaxiInOpenRoad.
	
	openRoadVehicle turnOn.
	self assert: (openRoadVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ openRoadVehicle accelerate ].
	
	self assert: (openRoadVehicle speedAt: 130 * kilometer / hour).
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'gs 30/Aug/2026, 5:01:58 pm (UTC)'!
!methodProperties: {}!
test09SpeedLimiterForAirTrafficLimitsSpeedAt500Kmh
	| vehicleInAir |
	vehicleInAir := self newHelicopter.
	
	vehicleInAir turnOn.
	self assert: (vehicleInAir speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ vehicleInAir accelerate ].
	
	self assert: (vehicleInAir speedAt: 500 * kilometer / hour).! !


!VehicleTests methodsFor: 'factory' stamp: 'gs 30/Aug/2026, 4:05:09 pm (UTC)'!
!methodProperties: {}!
newElectricMotorcycycle

	^ Motorcycle initializeNewElectricMotorcycle! !

!VehicleTests methodsFor: 'factory' stamp: 'gs 30/Aug/2026, 6:14:18 pm (UTC)'!
!methodProperties: {}!
newElectricMotorcycycleInCity
	^ (self newElectricMotorcycycle in: SpeedLimitInCity new)! !

!VehicleTests methodsFor: 'factory' stamp: 'gs 30/Aug/2026, 4:46:28 pm (UTC)'!
!methodProperties: {}!
newGasolineMotoTaxi

	^ Motorcycle initializeNewGasolineMotorcycle! !

!VehicleTests methodsFor: 'factory' stamp: 'gs 30/Aug/2026, 6:14:52 pm (UTC)'!
!methodProperties: {}!
newGasolineMotoTaxiInCity
	^ self newGasolineMotoTaxi in: SpeedLimitInCity new.! !

!VehicleTests methodsFor: 'factory' stamp: 'gs 30/Aug/2026, 6:13:23 pm (UTC)'!
!methodProperties: {}!
newGasolineMotoTaxiInOpenRoad
	^self newGasolineMotoTaxi in: SpeedLimitInOpenRoads new. ! !

!VehicleTests methodsFor: 'factory' stamp: 'gs 30/Aug/2026, 4:20:06 pm (UTC)'!
!methodProperties: {}!
newHelicopter

	^ Helicopter newHelicopter! !
