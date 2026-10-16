!classDefinition: #LoggerDelMarsRover category: #'MarsRover-WithHeading'!
Object subclass: #LoggerDelMarsRover
	instanceVariableNames: 'marsRover tipo logs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!LoggerDelMarsRover methodsFor: 'init' stamp: 'HAW 16/Oct/2026, 11:06:49 pm (UTC)'!
iniciarReconocimiento
	
	marsRover teSigo: self ySoyDeTipo: tipo.! !

!LoggerDelMarsRover methodsFor: 'init' stamp: 'HAW 16/Oct/2026, 11:10:02 pm (UTC)'!
initializeInitializeForAMarsRover: unMarsRover conUnTipoDeSeguimiento: unTipoDeSeguimiento  
	
	marsRover := unMarsRover.
	tipo :=  unTipoDeSeguimiento.
	
	logs := WriteStream on: ''.
		
	self iniciarReconocimiento. ! !


!LoggerDelMarsRover methodsFor: 'loggear' stamp: 'HAW 16/Oct/2026, 11:17:29 pm (UTC)'!
registrarCambio: unCambio 
	
	logs nextPutAll: unCambio asString; newLine. ! !


!LoggerDelMarsRover methodsFor: 'getter' stamp: 'HAW 16/Oct/2026, 11:11:38 pm (UTC)'!
dameTusLogs
	^ ReadStream on: logs contents ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LoggerDelMarsRover class' category: #'MarsRover-WithHeading'!
LoggerDelMarsRover class
	instanceVariableNames: ''!

!LoggerDelMarsRover class methodsFor: 'instance creation' stamp: 'HAW 16/Oct/2026, 11:05:43 pm (UTC)'!
initializeForAMarsRover: unMarsRover conUnTipoDeSeguimiento: unTipoDeSeguimiento  
	
	^self new initializeInitializeForAMarsRover: unMarsRover conUnTipoDeSeguimiento: unTipoDeSeguimiento ! !


!classDefinition: #MarsRover category: #'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head logDePosicion logDeOrientacion observadores'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 30/Jun/2018, 10:48:45 pm (UTC)'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 30/Jun/2018, 10:50:26 pm (UTC)'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'HAW 16/Oct/2026, 11:36:39 pm (UTC)'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType for: self.
	
	observadores := OrderedCollection new.! !


!MarsRover methodsFor: 'heading' stamp: 'HAW 16/Oct/2026, 6:32:57 pm (UTC)'!
headEast
	
	head := MarsRoverHeadingEast for: self.
	
	self logearOrientacionAUnaDireccion: 'East'.! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 16/Oct/2026, 6:32:45 pm (UTC)'!
headNorth
	
	head := MarsRoverHeadingNorth for: self.
	
	self logearOrientacionAUnaDireccion: 'North'.! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 16/Oct/2026, 6:32:17 pm (UTC)'!
headSouth
	
	head := MarsRoverHeadingSouth for: self.
	
	self logearOrientacionAUnaDireccion: 'South'.! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 16/Oct/2026, 6:32:29 pm (UTC)'!
headWest
	
	head := MarsRoverHeadingWest for: self.
	
	self logearOrientacionAUnaDireccion: 'West'.! !

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

!MarsRover methodsFor: 'moving' stamp: 'HAW 16/Oct/2026, 6:33:23 pm (UTC)'!
moveEast
	
	position := position + (1@0).
	
	self logearPosicion.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:53 pm (UTC)'!
moveForward
	
	head moveForward! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 16/Oct/2026, 6:33:17 pm (UTC)'!
moveNorth
	
	position := position + (0@1).
	
	self logearPosicion.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 16/Oct/2026, 6:33:29 pm (UTC)'!
moveSouth
	
	position := position + (0@-1).
	
	self logearPosicion.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 16/Oct/2026, 6:33:31 pm (UTC)'!
moveWest
	
	position := position + (-1@0).
	
	self logearPosicion.! !


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


!MarsRover methodsFor: 'logs' stamp: 'HAW 16/Oct/2026, 11:19:28 pm (UTC)'!
empezaARegistrarMovimientosCon: unLogger 

	logDePosicion := unLogger ! !

!MarsRover methodsFor: 'logs' stamp: 'HAW 16/Oct/2026, 2:06:52 am (UTC)'!
empezaARegistrarOrientacionCon: unLogger 
	
	logDeOrientacion := unLogger. ! !

!MarsRover methodsFor: 'logs' stamp: 'HAW 16/Oct/2026, 11:50:08 pm (UTC)'!
logearOrientacionAUnaDireccion: unaDireccion

	"logDeOrientacion ifNotNil: [logDeOrientacion registrarCambio: unaDireccion]."
	observadores do: [:unLogger | unLogger registrarCambio: unaDireccion.]
	! !

!MarsRover methodsFor: 'logs' stamp: 'HAW 16/Oct/2026, 11:41:57 pm (UTC)'!
logearPosicion

	observadores do: [:unLogger | unLogger registrarCambio: position ].! !

!MarsRover methodsFor: 'logs' stamp: 'HAW 16/Oct/2026, 11:48:51 pm (UTC)'!
teSigo: aLoggerDelMarsRover ySoyDeTipo: unTipo  

	"unTipo =  #Posicion ifTrue: [].
	unTipo =  #Orientacion ifTrue: [logDeOrientacion := aLoggerDelMarsRover].
	"
	observadores add:​ aLoggerDelMarsRover.
	! !

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

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 7/Oct/2021, 11:11:35 pm (UTC)'!
for: aMarsRover 
	
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


!classDefinition: #LoggerDelMarsRoverTests category: #'MarsRover-WithHeading'!
TestCase subclass: #LoggerDelMarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!LoggerDelMarsRoverTests methodsFor: 'cardinal' stamp: 'HAW 16/Oct/2026, 12:52:54 am (UTC)'!
east

	^ MarsRoverHeadingEast ! !

!LoggerDelMarsRoverTests methodsFor: 'cardinal' stamp: 'HAW 16/Oct/2026, 12:52:41 am (UTC)'!
north

	^ MarsRoverHeadingNorth ! !

!LoggerDelMarsRoverTests methodsFor: 'cardinal' stamp: 'HAW 16/Oct/2026, 12:52:48 am (UTC)'!
south

	^ MarsRoverHeadingSouth ! !

!LoggerDelMarsRoverTests methodsFor: 'cardinal' stamp: 'HAW 16/Oct/2026, 12:53:06 am (UTC)'!
west

	^ MarsRoverHeadingWest ! !


!LoggerDelMarsRoverTests methodsFor: 'tests' stamp: 'HAW 16/Oct/2026, 11:23:30 pm (UTC)'!
test01LoggerDePosicionamientoRegistraAvanceDelRover
	
	| marsRover unLogger read |
	marsRover := MarsRover at: (0@0) heading: self north.
	unLogger := self getLogger: marsRover deTipo: self loggerPosicionTipo.

	
	marsRover process: 'f'.
	read := self obtenerLectorDe: unLogger.
	
	self assert: read nextLine equals: (0@1) asString.
	
	! !

!LoggerDelMarsRoverTests methodsFor: 'tests' stamp: 'HAW 16/Oct/2026, 11:23:18 pm (UTC)'!
test02LoggerDePosicionamientoRegistraRetrocesoDelRover
	
	| marsRover unLogger read |
	marsRover := MarsRover at: (0@0) heading: self north.
	unLogger := self getLogger: marsRover deTipo: self loggerPosicionTipo.
	
	
	marsRover process: 'b'.
	
	read := self obtenerLectorDe: unLogger. 
	self assert: read nextLine equals: (0@-1) asString.! !

!LoggerDelMarsRoverTests methodsFor: 'tests' stamp: 'HAW 16/Oct/2026, 11:23:55 pm (UTC)'!
test03LoggerDePosicionamientoRegistraAvanceAlOesteDelRover
	
	| marsRover unLogger read |
	marsRover := MarsRover at: (0@0) heading: self west.
	unLogger := self getLogger: marsRover deTipo: self loggerPosicionTipo.

	
	marsRover process: 'f'.
	
	read := self obtenerLectorDe: unLogger. 
	self assert: read nextLine equals: (-1@0) asString.! !

!LoggerDelMarsRoverTests methodsFor: 'tests' stamp: 'HAW 16/Oct/2026, 11:24:05 pm (UTC)'!
test04LoggerDePosicionamientoRegistraAvanceAlEsteDelRover
	
	| marsRover unLogger read |
	marsRover := MarsRover at: (0@0) heading: self east.
	unLogger := self getLogger: marsRover deTipo: self loggerPosicionTipo.
	
	marsRover process: 'f'.
	
	read := self obtenerLectorDe: unLogger. 
	self assert: read nextLine equals: (1@0) asString.! !

!LoggerDelMarsRoverTests methodsFor: 'tests' stamp: 'HAW 16/Oct/2026, 11:24:46 pm (UTC)'!
test05LoggerDeOrientacionRegistraRotacionAlOesteDelRover
	
	| marsRover unLogger read |
	marsRover := MarsRover at: (0@0) heading: self north.
	unLogger := self getLogger: marsRover deTipo: self loggerOrientacionTipo.
	
	
	marsRover process: 'l'.
	
	read := self obtenerLectorDe: unLogger. 
	self assert: read nextLine equals: 'West'.! !

!LoggerDelMarsRoverTests methodsFor: 'tests' stamp: 'HAW 16/Oct/2026, 11:25:10 pm (UTC)'!
test06LoggerDeOrientacionRegistraRotacionAlSurDelRover
	
	| marsRover unLogger read |
	marsRover := MarsRover at: (0@0) heading: self west.
	unLogger := self getLogger: marsRover deTipo: self loggerOrientacionTipo.
	
	
	
	marsRover process: 'l'.
	
	read := self obtenerLectorDe: unLogger. 
	self assert: read nextLine equals: 'South'.! !

!LoggerDelMarsRoverTests methodsFor: 'tests' stamp: 'HAW 16/Oct/2026, 11:25:23 pm (UTC)'!
test07LoggerDeOrientacionRegistraRotacionAlEsteDelRover
	
	| marsRover unLogger read |
	marsRover := MarsRover at: (0@0) heading: self south.
	unLogger := self getLogger: marsRover deTipo: self loggerOrientacionTipo.
	
	marsRover process: 'l'.
	
	read := self obtenerLectorDe: unLogger. 
	self assert: read nextLine equals: 'East'.! !

!LoggerDelMarsRoverTests methodsFor: 'tests' stamp: 'HAW 16/Oct/2026, 11:25:37 pm (UTC)'!
test08LoggerDeOrientacionRegistraRotacionAlNorteDelRover
	
	| marsRover unLogger read |
	marsRover := MarsRover at: (0@0) heading: self east.
	unLogger := self getLogger: marsRover deTipo: self loggerOrientacionTipo.
	
	marsRover process: 'l'.
	
	read := self obtenerLectorDe: unLogger. 
	self assert: read nextLine equals: 'North'.! !

!LoggerDelMarsRoverTests methodsFor: 'tests' stamp: 'HAW 16/Oct/2026, 11:44:45 pm (UTC)'!
test09RoverPuedeTenerMasDeUnLoggerDePosicionamiento
	| marsRover unLogger unReadStream otroLogger otroReadStream unaPosicionEsperada |
	marsRover := MarsRover at: (0@0) heading: self north.
	
	unLogger := self getLogger: marsRover deTipo: self loggerPosicionTipo .
	otroLogger := self getLogger: marsRover deTipo: self loggerPosicionTipo .
	
	marsRover process: 'f'.
	
	unReadStream := self obtenerLectorDe: unLogger. 
	otroReadStream := self obtenerLectorDe: otroLogger. 
	
	unaPosicionEsperada := (0@1) asString.
	self assert: unReadStream nextLine equals: unaPosicionEsperada.
	self assert: otroReadStream nextLine equals: unaPosicionEsperada.! !

!LoggerDelMarsRoverTests methodsFor: 'tests' stamp: 'HAW 16/Oct/2026, 11:50:23 pm (UTC)'!
test10RoverPuedeTenerMasDeUnLoggerDeOrientacion
	| marsRover unLogger unReadStream otroLogger otroReadStream unaPosicionEsperada |
	marsRover := MarsRover at: (0@0) heading: self north.
	
	unLogger := self getLogger: marsRover deTipo: self loggerOrientacionTipo .
	otroLogger := self getLogger: marsRover deTipo: self loggerOrientacionTipo .
	
	marsRover process: 'l'.
	
	unReadStream := self obtenerLectorDe: unLogger. 
	otroReadStream := self obtenerLectorDe: otroLogger. 
	
	unaPosicionEsperada := 'West'.
	self assert: unReadStream nextLine equals: unaPosicionEsperada.
	self assert: otroReadStream nextLine equals: unaPosicionEsperada.! !

!LoggerDelMarsRoverTests methodsFor: 'tests' stamp: 'HAW 16/Oct/2026, 11:50:39 pm (UTC)'!
test11
	| marsRover unLogger unReadStream otroLogger otroReadStream unaPosicionEsperada |
	marsRover := MarsRover at: (0@0) heading: self north.
	
	unLogger := self getLogger: marsRover deTipo: self loggerOrientacionTipo .
	otroLogger := self getLogger: marsRover deTipo: self loggerOrientacionTipo .
	
	marsRover process: 'l'.
	
	unReadStream := self obtenerLectorDe: unLogger. 
	otroReadStream := self obtenerLectorDe: otroLogger. 
	
	unaPosicionEsperada := 'West'.
	self assert: unReadStream nextLine equals: unaPosicionEsperada.
	self assert: otroReadStream nextLine equals: unaPosicionEsperada.! !


!LoggerDelMarsRoverTests methodsFor: 'lectorDeStream' stamp: 'HAW 16/Oct/2026, 11:05:01 pm (UTC)'!
getLogger: unMarsRover deTipo: tipoDeSeguimiento 

	^ LoggerDelMarsRover initializeForAMarsRover: unMarsRover conUnTipoDeSeguimiento: tipoDeSeguimiento.! !

!LoggerDelMarsRoverTests methodsFor: 'lectorDeStream' stamp: 'HAW 16/Oct/2026, 11:21:03 pm (UTC)'!
loggerOrientacionTipo

	^ #Orientacion! !

!LoggerDelMarsRoverTests methodsFor: 'lectorDeStream' stamp: 'HAW 16/Oct/2026, 11:20:43 pm (UTC)'!
loggerPosicionTipo

	^ #Posicion! !

!LoggerDelMarsRoverTests methodsFor: 'lectorDeStream' stamp: 'HAW 16/Oct/2026, 11:11:46 pm (UTC)'!
obtenerLectorDe: unLogger

	^ unLogger dameTusLogs.! !


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
