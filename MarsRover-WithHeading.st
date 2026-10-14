!classDefinition: #MarsRover category: #'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head logDePosicion logDeOrientacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 30/Jun/2018, 10:48:45 pm (UTC)'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 30/Jun/2018, 10:50:26 pm (UTC)'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'HAW 14/Oct/2026, 12:32:06 am (UTC)'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType for: self.
	
	logDePosicion := WriteStream on: ''.
	logDeOrientacion := WriteStream on: ''.! !


!MarsRover methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:17:02 pm (UTC)'!
headEast
	
	head := MarsRoverHeadingEast for: self! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:17:12 pm (UTC)'!
headNorth
	
	head := MarsRoverHeadingNorth for: self ! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 7/Oct/2021, 11:17:17 pm (UTC)'!
headSouth
	
	head := MarsRoverHeadingSouth for: self! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 14/Oct/2026, 12:33:19 am (UTC)'!
headWest
	
	head := MarsRoverHeadingWest for: self.
	logDeOrientacion print: 'West'; newLine.! !

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


!MarsRover methodsFor: 'moving' stamp: 'HAW 13/Oct/2026, 11:52:10 pm (UTC)'!
moveBackward
	
	head moveBackward.
	! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 14/Oct/2026, 12:32:06 am (UTC)'!
moveEast
	
	position := position + (1@0).
	
	logDePosicion print: position asString; newLine. ! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 7/Oct/2021, 11:13:53 pm (UTC)'!
moveForward
	
	head moveForward! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 14/Oct/2026, 12:32:06 am (UTC)'!
moveNorth
	
	position := position + (0@1).
	
	logDePosicion print: position asString; newLine. ! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 14/Oct/2026, 12:32:06 am (UTC)'!
moveSouth
	
	position := position + (0@-1).
	
	logDePosicion print: position asString; newLine. ! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 14/Oct/2026, 12:32:06 am (UTC)'!
moveWest
	
	position := position + (-1@0).
	
	logDePosicion print: position asString; newLine. ! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 30/Jun/2018, 10:48:26 pm (UTC)'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 13/Oct/2026, 11:49:25 pm (UTC)'!
processCommand: aCommand
	
	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].
	
	

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'logs' stamp: 'HAW 14/Oct/2026, 12:34:05 am (UTC)'!
orientationLogsIsEqualTo: streamDeLogsEsperado 
	
	^ (ReadStream on: logDeOrientacion contents) nextLine = streamDeLogsEsperado nextLine ! !

!MarsRover methodsFor: 'logs' stamp: 'HAW 14/Oct/2026, 12:32:06 am (UTC)'!
positionalLogsIsEqualTo: unStreamDeLogsEsperado 
	
	| streamDeLectuira |
	streamDeLectuira := ReadStream on: logDePosicion contents.
	
	^ streamDeLectuira nextLine = unStreamDeLogsEsperado nextLine ! !

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


!classDefinition: #LogsTestCase category: #'MarsRover-WithHeading'!
TestCase subclass: #LogsTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!LogsTestCase methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 11:53:53 pm (UTC)'!
test01LogsDeRoverEstaVacioSiNoRealizoNingunaAccion
	
	| rover |
	
	
	rover := MarsRover at: 0@0 heading: (self north).
	
	self assert: (rover positionalLogsIsEqualTo: (ReadStream on: String new)). ! !

!LogsTestCase methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 11:57:30 pm (UTC)'!
test02LogDeRoverRegistraAvanceAlNorte
	
	| rover log |
	log := WriteStream on: ''.
	log print: '0@1'; newLine.
	
	rover := MarsRover at: 0@0 heading: (self north).
	rover process: 'f'.
	
	self assert: (rover positionalLogsIsEqualTo: (ReadStream on: log contents)). 
	self deny: (rover positionalLogsIsEqualTo: (ReadStream on: '')). ! !

!LogsTestCase methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 11:57:21 pm (UTC)'!
test03LogDeRoverRegistraRetrocesoAlSur
	
	| rover log |
	log := WriteStream on: ''.
	log print: (0@-1) asString ; newLine.
	
	rover := MarsRover at: 0@0 heading: (self north).
	rover process: 'b'.
	
	self assert: (rover positionalLogsIsEqualTo: (ReadStream on: log contents)). ! !

!LogsTestCase methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 11:58:04 pm (UTC)'!
test04LogDeRoverRegistraAvanceAlEste
	
	| rover log |
	log := WriteStream on: ''.
	log print: (1@0) asString ; newLine.
	
	rover := MarsRover at: 0@0 heading: (self east).
	rover process: 'f'.
	
	self assert: (rover positionalLogsIsEqualTo: (ReadStream on: log contents)). ! !

!LogsTestCase methodsFor: 'tests' stamp: 'HAW 14/Oct/2026, 12:20:06 am (UTC)'!
test05LogDeRoverRegistraAvanceAlOeste
	
	| rover log |
	log := WriteStream on: ''.
	log print: (-1@0) asString ; newLine.
	
	rover := MarsRover at: 0@0 heading: (self west).
	rover process: 'f'.
	
	self assert: (rover positionalLogsIsEqualTo: (ReadStream on: log contents)). ! !

!LogsTestCase methodsFor: 'tests' stamp: 'HAW 14/Oct/2026, 12:30:41 am (UTC)'!
test06LogDeRoverRegistraCambioDeOrientacion
	
	| rover log |
	log := WriteStream on: ''.
	log print: 'West' ; newLine.
	
	rover := MarsRover at: 0@0 heading: (self north).
	rover process: 'l'.
	
	self assert: (rover orientationLogsIsEqualTo: (ReadStream on: log contents)). ! !

!LogsTestCase methodsFor: 'tests' stamp: 'HAW 14/Oct/2026, 12:34:37 am (UTC)'!
test07
	
	| rover log |
	log := WriteStream on: ''.
	log print: 'East' ; newLine.
	
	rover := MarsRover at: 0@0 heading: (self north).
	rover process: 'r'.
	
	self assert: (rover orientationLogsIsEqualTo: (ReadStream on: log contents)). ! !


!LogsTestCase methodsFor: 'cardinal points' stamp: 'HAW 13/Oct/2026, 11:57:47 pm (UTC)'!
east
	^ MarsRoverHeadingEast ! !

!LogsTestCase methodsFor: 'cardinal points' stamp: 'HAW 13/Oct/2026, 11:10:33 pm (UTC)'!
north
	^ MarsRoverHeadingNorth ! !

!LogsTestCase methodsFor: 'cardinal points' stamp: 'HAW 14/Oct/2026, 12:18:55 am (UTC)'!
south
	^ MarsRoverHeadingSouth ! !

!LogsTestCase methodsFor: 'cardinal points' stamp: 'HAW 14/Oct/2026, 12:18:42 am (UTC)'!
west
	^ MarsRoverHeadingWest ! !


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
