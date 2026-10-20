!classDefinition: #MarsRover category: #'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head loggersDePosicion loggersDeOrientacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 30/Jun/2018, 10:48:45 pm (UTC)'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 30/Jun/2018, 10:50:26 pm (UTC)'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'HAW 19/Oct/2026, 8:09:16 pm (UTC)'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType followPositionChangesOn: self.
	
	loggersDePosicion := OrderedCollection new.
	
	loggersDeOrientacion := OrderedCollection new.! !


!MarsRover methodsFor: 'heading' stamp: 'HAW 19/Oct/2026, 8:09:16 pm (UTC)'!
headEast
	
	
	head := MarsRoverHeadingEast followPositionChangesOn: self.
	
	self printearNuevaOrientacion: 'East'.! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 19/Oct/2026, 8:09:16 pm (UTC)'!
headNorth
	
	head := MarsRoverHeadingNorth followPositionChangesOn: self.
	
	self printearNuevaOrientacion: 'North'.! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 19/Oct/2026, 8:09:16 pm (UTC)'!
headSouth
	
	head := MarsRoverHeadingSouth followPositionChangesOn: self.
	
	self printearNuevaOrientacion: 'South'.! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 19/Oct/2026, 8:09:16 pm (UTC)'!
headWest
	
	head := MarsRoverHeadingWest followPositionChangesOn: self.
	
	self printearNuevaOrientacion: 'West'.
	
	! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:14:20 pm (UTC)'!
rotateLeft
	
	head rotateLeft! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:14:44 pm (UTC)'!
rotateRight
	
	head rotateRight! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 7/Oct/2021, 11:16:32 pm (UTC)'!
isAt: aPosition heading: aHeadingType

	^position = aPosition and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 6/Jul/2018, 9:16:51 pm (UTC)'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 6/Jul/2018, 9:16:19 pm (UTC)'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 6/Jul/2018, 9:17:51 pm (UTC)'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 6/Jul/2018, 9:17:21 pm (UTC)'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:24 pm (UTC)'!
moveBackward
	
	head moveBackward! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 18/Oct/2026, 12:02:00 am (UTC)'!
moveEast
	
	position := position + (1@0).
	
	self notificarLogDePosicion.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:53 pm (UTC)'!
moveForward
	
	head moveForward! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 17/Oct/2026, 11:59:13 pm (UTC)'!
moveNorth
	
	position := position + (0@1).
	
	self notificarLogDePosicion. ! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 17/Oct/2026, 11:59:54 pm (UTC)'!
moveSouth
	
	position := position + (0@-1).
	
	self notificarLogDePosicion.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 18/Oct/2026, 12:03:06 am (UTC)'!
moveWest
	
	position := position + (-1@0).
	
	self notificarLogDePosicion.! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 30/Jun/2018, 10:48:26 pm (UTC)'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 22/Aug/2019, 3:08:50 pm (UTC)'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'logs' stamp: 'HAW 20/Oct/2026, 7:51:25 pm (UTC)'!
notificarLogDePosicion

	loggersDePosicion do: [ :aLog | aLog cambioDePosicion: position]! !

!MarsRover methodsFor: 'logs' stamp: 'HAW 20/Oct/2026, 7:50:12 pm (UTC)'!
printearNuevaOrientacion: unaNuevaOrientacion

	loggersDeOrientacion do: [:aLog | aLog cambioDeOrientacion: unaNuevaOrientacion].! !

!MarsRover methodsFor: 'logs' stamp: 'HAW 19/Oct/2026, 4:16:06 pm (UTC)'!
sigueTuOrientacionEsteLogger: unLog 
	
	loggersDeOrientacion add:​ unLog. ! !

!MarsRover methodsFor: 'logs' stamp: 'HAW 19/Oct/2026, 4:33:45 pm (UTC)'!
sigueTuPosicionEsteLogger: unLog 
	
	
	loggersDePosicion add: unLog. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 7/Oct/2021, 11:10:30 pm (UTC)'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverHeading category: #'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:14:20 pm (UTC)'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:14:44 pm (UTC)'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 7/Oct/2021, 11:15:38 pm (UTC)'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:24 pm (UTC)'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:53 pm (UTC)'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 7/Oct/2021, 11:11:59 pm (UTC)'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: #'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 19/Oct/2026, 8:09:16 pm (UTC)'!
followPositionChangesOn: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:24 pm (UTC)'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:53 pm (UTC)'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:14:20 pm (UTC)'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:14:44 pm (UTC)'!
rotateRight
	
	^marsRover headSouth! !


!classDefinition: #MarsRoverHeadingNorth category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:24 pm (UTC)'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:53 pm (UTC)'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:14:20 pm (UTC)'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:14:44 pm (UTC)'!
rotateRight
	
	^marsRover headEast! !


!classDefinition: #MarsRoverHeadingSouth category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:24 pm (UTC)'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:53 pm (UTC)'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:14:20 pm (UTC)'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:14:44 pm (UTC)'!
rotateRight
	
	^marsRover headWest! !


!classDefinition: #MarsRoverHeadingWest category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:24 pm (UTC)'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:53 pm (UTC)'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:14:20 pm (UTC)'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:14:44 pm (UTC)'!
rotateRight
	
	^marsRover headNorth! !


!classDefinition: #MarsRoverStalker category: #'MarsRover-WithHeading'!
Object subclass: #MarsRoverStalker
	instanceVariableNames: 'roverSeguido stream rover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverStalker methodsFor: 'initialization' stamp: 'HAW 20/Oct/2026, 7:20:39 pm (UTC)'!
initializeFor: unRover 
	
	rover := unRover.
	stream := WriteStream on: ''.
! !


!MarsRoverStalker methodsFor: 'log' stamp: 'HAW 20/Oct/2026, 7:50:12 pm (UTC)'!
cambioDeOrientacion: unCambio 
	 
	stream nextPutAll: unCambio asString; newLine.! !

!MarsRoverStalker methodsFor: 'log' stamp: 'HAW 20/Oct/2026, 7:50:49 pm (UTC)'!
cambioDePosicion: unCambio 
	 
	stream nextPutAll: unCambio asString; newLine.! !


!MarsRoverStalker methodsFor: 'getter' stamp: 'HAW 20/Oct/2026, 7:20:56 pm (UTC)'!
readStream
	
	^ ReadStream on: stream contents! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverStalker class' category: #'MarsRover-WithHeading'!
MarsRoverStalker class
	instanceVariableNames: ''!

!MarsRoverStalker class methodsFor: 'instance creation' stamp: 'HAW 20/Oct/2026, 7:25:12 pm (UTC)'!
followHeadingChangesOn: aMarsRover 
	|logger|
	logger := self new initializeFor: aMarsRover .
	aMarsRover sigueTuOrientacionEsteLogger: logger.
	^logger ! !

!MarsRoverStalker class methodsFor: 'instance creation' stamp: 'HAW 20/Oct/2026, 7:25:12 pm (UTC)'!
followPositionAndHeadingChangesOn: aMarsRover 
	
	| logger |
	logger := self new initializeFor: aMarsRover.
	aMarsRover sigueTuOrientacionEsteLogger: logger.
	aMarsRover sigueTuPosicionEsteLogger: logger.
	
	^logger ! !

!MarsRoverStalker class methodsFor: 'instance creation' stamp: 'HAW 20/Oct/2026, 7:25:12 pm (UTC)'!
followPositionChangesOn: unRover 
	
	|logger|
	logger := self new initializeFor: unRover .
	unRover sigueTuPosicionEsteLogger: logger.
	^logger 
! !


!classDefinition: #MarsRoverLogger category: #'MarsRover-WithHeading'!
MarsRoverStalker subclass: #MarsRoverLogger
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!


!classDefinition: #MarsRoverStatusWindow category: #'MarsRover-WithHeading'!
MarsRoverStalker subclass: #MarsRoverStatusWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverStatusWindow methodsFor: 'log' stamp: 'HAW 20/Oct/2026, 7:50:12 pm (UTC)'!
cambioDeOrientacion: position1 
	
	| campoOrientacion |
	campoOrientacion := ', Apuntando a '.
	
	stream nextPutAll: 'Posicion: '.
	stream nextPutAll: position1 asString.
	
	position1 = 'West' ifTrue: [campoOrientacion := campoOrientacion , 'Oeste'].
	
	stream nextPutAll: campoOrientacion; newLine.! !



!classDefinition: #MarsRoverLoggerTests category: #'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverLoggerTests
	instanceVariableNames: 'marsRover readLog anotherReadLog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 17/Oct/2026, 11:37:26 pm (UTC)'!
initializeMarsRoverEn: unaPosicion yUnaOrientacion: aOrientation
	
	marsRover := MarsRover at: unaPosicion heading: aOrientation. ! !

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 19/Oct/2026, 5:29:59 pm (UTC)'!
test01RoverLogeaAvanceAlNorte
	
	| unLog|
	self initializeMarsRoverEn: (0@0) yUnaOrientacion: self north.
	unLog := self getLogDePosicion: marsRover.
	
	marsRover process: 'f'.
	
	readLog := self obtenerReadStreamOf: unLog.
	
	self assert: readLog nextLine equals: '0@1'.
	! !

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 19/Oct/2026, 5:30:05 pm (UTC)'!
test02RoverLogeaAvanceAlSur
	
	| unLog|
	self initializeMarsRoverEn: (0@0) yUnaOrientacion: self south.
	unLog := self getLogDePosicion: marsRover.
	
	marsRover process: 'f'.
	
	readLog := self obtenerReadStreamOf: unLog.
	
	self assert: readLog nextLine equals: (0@-1) asString.
	! !

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 19/Oct/2026, 5:30:11 pm (UTC)'!
test03RoverLogeaAvanceAlEste
	
	| unLog|
	self initializeMarsRoverEn: (0@0) yUnaOrientacion: self east.
	unLog := self getLogDePosicion: marsRover.
	
	marsRover process: 'f'.
	
	readLog := self obtenerReadStreamOf: unLog.
	
	self assert: readLog nextLine equals: (1@0) asString.
	! !

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 19/Oct/2026, 5:30:18 pm (UTC)'!
test04RoverLogeaAvanceAlOeste
	
	| unLog|
	self initializeMarsRoverEn: (0@0) yUnaOrientacion: self west.
	unLog := self getLogDePosicion: marsRover.
	
	marsRover process: 'f'.
	
	readLog := self obtenerReadStreamOf: unLog.
	
	self assert: readLog nextLine equals: (-1@0) asString.
	! !

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 19/Oct/2026, 5:36:07 pm (UTC)'!
test05RoverLogeaRotacionAlEste
	
	| unLog|
	self initializeMarsRoverEn: (0@0) yUnaOrientacion: self north.
	unLog := self getLogDeRotacion: marsRover.
	
	marsRover process: 'r'.
	
	readLog := self obtenerReadStreamOf: unLog.
	
	self assert: readLog nextLine equals: 'East'.
	! !

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 19/Oct/2026, 5:37:27 pm (UTC)'!
test06RoverLogeaRotacionAlOeste
	
	| unLog|
	self initializeMarsRoverEn: (0@0) yUnaOrientacion: self north.
	unLog := self getLogDeRotacion: marsRover.
	
	marsRover process: 'l'.
	
	readLog := self obtenerReadStreamOf: unLog.
	
	self assert: readLog nextLine equals: 'West'.
	! !

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 19/Oct/2026, 5:37:34 pm (UTC)'!
test07RoverLogeaRotacionAlSur
	
	| unLog|
	self initializeMarsRoverEn: (0@0) yUnaOrientacion: self west.
	unLog := self getLogDeRotacion: marsRover.
	
	marsRover process: 'l'.
	
	readLog := self obtenerReadStreamOf: unLog.
	
	self assert: readLog nextLine equals: 'South'.
	! !

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 19/Oct/2026, 5:37:38 pm (UTC)'!
test08RoverLogeaRotacionAlNorte
	
	| unLog|
	self initializeMarsRoverEn: (0@0) yUnaOrientacion: self west.
	
	unLog := self getLogDeRotacion: marsRover.
	
	
	marsRover process: 'r'.
	
	readLog := self obtenerReadStreamOf: unLog.
	
	self assert: readLog nextLine equals: 'North'.
	! !

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 19/Oct/2026, 5:30:44 pm (UTC)'!
test09RoverPuedeTenerMasDeUnLogDePosicion
	| unLog otroLog posicionEsperada |
	self initializeMarsRoverEn: (0@0) yUnaOrientacion: self north.
	unLog := self getLogDePosicion: marsRover.
	otroLog := self getLogDePosicion: marsRover.
	
	marsRover process: 'f'.
	
	readLog := self obtenerReadStreamOf: unLog.
	anotherReadLog := self obtenerReadStreamOf: otroLog.
	
	posicionEsperada := (0@1) asString.
	self assert: readLog nextLine equals: posicionEsperada.
	self assert: anotherReadLog nextLine equals: posicionEsperada.! !

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 19/Oct/2026, 5:37:51 pm (UTC)'!
test10RoverPuedeTenerMasDeUnLogDeOrientacion
	| unLog otroLog |
	self initializeMarsRoverEn: (0@0) yUnaOrientacion: self west.
	unLog := self getLogDeRotacion: marsRover.
	otroLog := self getLogDeRotacion: marsRover.
	
	marsRover process: 'r'.
	
	readLog := self obtenerReadStreamOf: unLog.
	anotherReadLog := self obtenerReadStreamOf: otroLog.
	
	self assert: readLog nextLine equals: 'North'.
	self assert: anotherReadLog nextLine equals: 'North'.! !

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 19/Oct/2026, 5:38:05 pm (UTC)'!
test11RoverPuedeTenerUnMismoLoggerDeOrientacionYPosicion
	| unLog |
	self initializeMarsRoverEn: (0@0) yUnaOrientacion: self north.
	unLog := self getLogDePosicionYOrientacion: marsRover.
	
	marsRover process: 'fr'.
	
	readLog := self obtenerReadStreamOf: unLog.
	
	self assert: readLog nextLine equals: (0@1) asString.
	self assert: readLog nextLine equals: 'East'.! !

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 20/Oct/2026, 7:38:43 pm (UTC)'!
test12RoverVentanaRegistraCambioDePosicion
	| unLog |
	self initializeMarsRoverEn: (0@0) yUnaOrientacion: self north.
	unLog := self getVentanaDePosicion: marsRover.
	
	marsRover process: 'f'.
	
	readLog := self obtenerReadStreamOf: unLog.
	
	self assert: readLog nextLine equals: 'Posicion: ', (0@1) asString, ', Apuntando a'.! !

!MarsRoverLoggerTests methodsFor: 'tests' stamp: 'HAW 20/Oct/2026, 7:44:51 pm (UTC)'!
test13RoverVentanaRegistraCambioDeOrientacion
	| unLog |
	self initializeMarsRoverEn: (0@0) yUnaOrientacion: self north.
	unLog := self getVentanaDeOrientacion: marsRover.
	
	marsRover process: 'l'.
	
	readLog := self obtenerReadStreamOf: unLog.
	
	self assert: readLog nextLine equals: 'Posicion: ', (0@1) asString, ', Apuntando a Oeste'.! !


!MarsRoverLoggerTests methodsFor: 'orientation' stamp: 'HAW 18/Oct/2026, 12:01:37 am (UTC)'!
east
	
	^ MarsRoverHeadingEast ! !

!MarsRoverLoggerTests methodsFor: 'orientation' stamp: 'HAW 17/Oct/2026, 11:43:26 pm (UTC)'!
north
	^ MarsRoverHeadingNorth! !

!MarsRoverLoggerTests methodsFor: 'orientation' stamp: 'HAW 18/Oct/2026, 12:00:47 am (UTC)'!
south
	
	^ MarsRoverHeadingSouth ! !

!MarsRoverLoggerTests methodsFor: 'orientation' stamp: 'HAW 18/Oct/2026, 12:02:38 am (UTC)'!
west
	
	^ MarsRoverHeadingWest ! !


!MarsRoverLoggerTests methodsFor: 'logger' stamp: 'HAW 19/Oct/2026, 8:09:41 pm (UTC)'!
getLogDePosicion: unRover
	
	
	^ MarsRoverLogger followPositionChangesOn: unRover 
	! !

!MarsRoverLoggerTests methodsFor: 'logger' stamp: 'HAW 19/Oct/2026, 8:10:09 pm (UTC)'!
getLogDePosicionYOrientacion: aMarsRover 
	
	^ MarsRoverLogger followPositionAndHeadingChangesOn: aMarsRover ! !

!MarsRoverLoggerTests methodsFor: 'logger' stamp: 'HAW 19/Oct/2026, 8:09:46 pm (UTC)'!
getLogDeRotacion: aMarsRover 
	
	^ MarsRoverLogger followHeadingChangesOn: aMarsRover ! !

!MarsRoverLoggerTests methodsFor: 'logger' stamp: 'HAW 20/Oct/2026, 7:39:21 pm (UTC)'!
getVentanaDeOrientacion: aMarsRover 
	
	^ MarsRoverStatusWindow followHeadingChangesOn: aMarsRover ! !

!MarsRoverLoggerTests methodsFor: 'logger' stamp: 'HAW 20/Oct/2026, 7:38:43 pm (UTC)'!
getVentanaDePosicion: aMarsRover 
	
	^ MarsRoverStatusWindow followPositionChangesOn: aMarsRover ! !

!MarsRoverLoggerTests methodsFor: 'logger' stamp: 'HAW 20/Oct/2026, 7:20:56 pm (UTC)'!
obtenerReadStreamOf: unLog 
	
	"^ ReadStream on: unLog contents" 
	^ unLog readStream! !


!classDefinition: #MarsRoverTest category: #'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:21:23 pm (UTC)'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:28:12 pm (UTC)'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:28:31 pm (UTC)'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:30:17 pm (UTC)'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:30:11 pm (UTC)'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:29:59 pm (UTC)'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:29:51 pm (UTC)'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:29:45 pm (UTC)'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:29:39 pm (UTC)'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:29:31 pm (UTC)'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:29:19 pm (UTC)'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:29:14 pm (UTC)'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:29:05 pm (UTC)'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:29:00 pm (UTC)'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/Oct/2021, 11:28:52 pm (UTC)'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 7/Oct/2021, 11:09:31 pm (UTC)'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 7/Oct/2021, 11:09:38 pm (UTC)'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 7/Oct/2021, 11:09:45 pm (UTC)'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 7/Oct/2021, 11:09:54 pm (UTC)'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 7/Oct/2021, 11:20:47 pm (UTC)'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !
