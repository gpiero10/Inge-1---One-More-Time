!classDefinition: #BrazoDelRover category: 'Rover Marino'!
Object subclass: #BrazoDelRover
	instanceVariableNames: 'rangoDeAlcance puntoDeInicio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!BrazoDelRover methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 1:18:42 pm (UTC)'!
capturasEnUnAmbiente: unTipoDeAmbiente conUnMapa: unMapa paraUnRover: unRover

	self subclassResponsibility! !

!BrazoDelRover methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 3:05:18 pm (UTC)'!
perdesAlcanceEn: unDisminucion
	rangoDeAlcance := Rectangle origin: puntoDeInicio 
		corner: ((puntoDeInicio) + (3@3) + (unDisminucion)).! !

!BrazoDelRover methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 1:51:03 pm (UTC)'!
podesCapturarBichoEnEstaPosicion: unaPosicion
	
	^ rangoDeAlcance containsPoint: unaPosicion! !


!BrazoDelRover methodsFor: 'initialization' stamp: 'HAW 19/Sep/2026, 1:58:24 pm (UTC)'!
initializeConEjeEn: unPunto 
	
	puntoDeInicio := unPunto.
	rangoDeAlcance := Rectangle origin: (puntoDeInicio) corner: ((puntoDeInicio) + (3@3))! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BrazoDelRover class' category: 'Rover Marino'!
BrazoDelRover class
	instanceVariableNames: ''!

!BrazoDelRover class methodsFor: 'instance creation' stamp: 'HAW 19/Sep/2026, 1:57:14 pm (UTC)'!
conEjeEn: unPunto 
	
	^self new initializeConEjeEn: unPunto ! !


!classDefinition: #BrazoAspirador category: 'Rover Marino'!
BrazoDelRover subclass: #BrazoAspirador
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!BrazoAspirador methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 3:14:39 pm (UTC)'!
capturasEnUnAmbiente: unTipoDeAmbiente conUnMapa: unMapa paraUnRover: unRover

	unTipoDeAmbiente unBrazoAspirador: self deUnRover: unRover 
		queCapturaConMapa: unMapa. 
! !


!classDefinition: #BrazoRed category: 'Rover Marino'!
BrazoDelRover subclass: #BrazoRed
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!BrazoRed methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 3:14:44 pm (UTC)'!
capturasEnUnAmbiente: unTipoDeAmbiente conUnMapa: unMapa paraUnRover: unRover

	unTipoDeAmbiente unBrazoRed: self deUnRover: unRover 
		queCapturaConMapa: unMapa. 
! !

!BrazoRed methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 3:00:30 pm (UTC)'!
teRompesAlCapturarEnAmbienteRocoso

	rangoDeAlcance := Rectangle origin: (puntoDeInicio) 
					corner: (puntoDeInicio + (1@1)). ! !


!classDefinition: #Especimen category: 'Rover Marino'!
Object subclass: #Especimen
	instanceVariableNames: 'tipoDeEspecimen'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!Especimen methodsFor: 'initialization' stamp: 'giann 18/Sep/2026, 11:41:28 pm (UTC)'!
initializeDeTipo: untipoDeEspecimen 
	
	tipoDeEspecimen := untipoDeEspecimen.! !



!Especimen methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 4:25:20 pm (UTC)'!
unRover: unRover conBrazoAspiradorEnAmbienteFangosoTeIntentaCapturarUsandoUnMapa: unMapa

	self subclassResponsibility! !

!Especimen methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 4:27:07 pm (UTC)'!
unRover: unRover conBrazoRedEnAmbienteFangosoTeIntentaCapturarUsandoUnMapa: unMapa

	self subclassResponsibility! !

!Especimen methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 3:48:20 pm (UTC)'!
unRoverConBrazoAspiradorEnAmbienteRocosoTeIntentaCapturarUsandoUnMapa: unMapa

	self subclassResponsibility! !

!Especimen methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 3:48:25 pm (UTC)'!
unRoverConBrazoRedEnAmbienteRocosoTeIntentaCapturarUsandoUnMapa: unMapa

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Especimen class' category: 'Rover Marino'!
Especimen class
	instanceVariableNames: ''!

!Especimen class methodsFor: 'instance creation' stamp: 'giann 18/Sep/2026, 11:41:08 pm (UTC)'!
deTipo: tipoDeEspecimen 
	
	^self new initializeDeTipo: tipoDeEspecimen ! !


!classDefinition: #EspecimenEscurridizo category: 'Rover Marino'!
Especimen subclass: #EspecimenEscurridizo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!EspecimenEscurridizo methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 4:25:20 pm (UTC)'!
unRover: unRover conBrazoAspiradorEnAmbienteFangosoTeIntentaCapturarUsandoUnMapa: unMapa

	|nuevaPosicion |
	nuevaPosicion := (unMapa at: self) + (1@1).
	unMapa at: self put: nuevaPosicion.! !

!EspecimenEscurridizo methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 4:27:07 pm (UTC)'!
unRover: unRover conBrazoRedEnAmbienteFangosoTeIntentaCapturarUsandoUnMapa: unMapa
	
	|nuevaPosicion |
					
	nuevaPosicion := (unMapa at: self) + (-1@0).
	unMapa at: self put: nuevaPosicion.
	
	! !

!EspecimenEscurridizo methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 3:58:52 pm (UTC)'!
unRoverConBrazoAspiradorEnAmbienteRocosoTeIntentaCapturarUsandoUnMapa: unMapa
	
	|nuevaPosicion |
					
	nuevaPosicion := (unMapa at: self) + (0@1).
	unMapa at: self put: nuevaPosicion .! !

!EspecimenEscurridizo methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 3:50:46 pm (UTC)'!
unRoverConBrazoRedEnAmbienteRocosoTeIntentaCapturarUsandoUnMapa: unMapa
	
	! !


!classDefinition: #EspecimenPerezoso category: 'Rover Marino'!
Especimen subclass: #EspecimenPerezoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!EspecimenPerezoso methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 4:25:20 pm (UTC)'!
unRover: unRover conBrazoAspiradorEnAmbienteFangosoTeIntentaCapturarUsandoUnMapa: unMapa
	"nothing!! Soy Flojo ps" ! !

!EspecimenPerezoso methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 4:27:23 pm (UTC)'!
unRover: unRover conBrazoRedEnAmbienteFangosoTeIntentaCapturarUsandoUnMapa: unMapa
	
	unRover 
	soyPerezosoYMeSumergiEnElFangoCuandoIntentasteCapturarmeConTuBrazoRed.! !

!EspecimenPerezoso methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 3:48:57 pm (UTC)'!
unRoverConBrazoAspiradorEnAmbienteRocosoTeIntentaCapturarUsandoUnMapa: unMapa
	
	! !

!EspecimenPerezoso methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 3:50:41 pm (UTC)'!
unRoverConBrazoRedEnAmbienteRocosoTeIntentaCapturarUsandoUnMapa: unMapa
	
	! !


!classDefinition: #EstadoDelRover category: 'Rover Marino'!
Object subclass: #EstadoDelRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!EstadoDelRover methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 4:38:23 pm (UTC)'!
intenteCapturar: unRover EnAmbienteRocosoConMiBrazoRed: tipoDeBrazo

	self subclassResponsibility! !

!EstadoDelRover methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 4:33:23 pm (UTC)'!
intenteCapturarEnAmbienteRocosoConMiBrazoRed

	self subclassResponsibility! !


!classDefinition: #EstadoContingencia category: 'Rover Marino'!
EstadoDelRover subclass: #EstadoContingencia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!EstadoContingencia methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 4:40:38 pm (UTC)'!
intenteCapturar: unRover EnAmbienteRocosoConMiBrazoRed: tipoDeBrazo 
	! !


!classDefinition: #EstadoNormal category: 'Rover Marino'!
EstadoDelRover subclass: #EstadoNormal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!EstadoNormal methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 4:40:25 pm (UTC)'!
intenteCapturar: unRover EnAmbienteRocosoConMiBrazoRed: tipoDeBrazo 
	
	tipoDeBrazo teRompesAlCapturarEnAmbienteRocoso.
	unRover entrasEnEstadoDeContingencia. 
	! !


!classDefinition: #RoverMarino category: 'Rover Marino'!
Object subclass: #RoverMarino
	instanceVariableNames: 'brazo mapa puntoDeInicio capturados estado condicionDeCaptura'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!RoverMarino methodsFor: 'initialization' stamp: 'HAW 19/Sep/2026, 4:46:17 pm (UTC)'!
initializeConBrazo: unTipoDeBrazo conMapa: unMapa conPosicionInicial: unPunto 
	
	capturados := OrderedCollection new.
	
	brazo := unTipoDeBrazo.
	mapa := unMapa.
	puntoDeInicio := unPunto.
	
	condicionDeCaptura := [:key | brazo podesCapturarBichoEnEstaPosicion: 
										(mapa at:  key)].
	
	estado := EstadoNormal new.! !


!RoverMarino methodsFor: 'captura' stamp: 'HAW 19/Sep/2026, 3:11:23 am (UTC)'!
capturoAEsteEspecimen: unEspecimen 
	
	^ capturados includes: unEspecimen ! !

!RoverMarino methodsFor: 'captura' stamp: 'HAW 19/Sep/2026, 4:46:17 pm (UTC)'!
iniciarCapturaEnAmbiente: unTipoDeAmbiente conMapa: unMapa 
	
	brazo capturasEnUnAmbiente: unTipoDeAmbiente 
			conUnMapa: unMapa paraUnRover: self.
	
	self realizarCaptura.
! !

!RoverMarino methodsFor: 'captura' stamp: 'HAW 19/Sep/2026, 4:46:17 pm (UTC)'!
intentasCapturarEnAmbienteRocosoConTuBrazoRed
	
	estado intenteCapturar: self EnAmbienteRocosoConMiBrazoRed: brazo .
	! !

!RoverMarino methodsFor: 'captura' stamp: 'HAW 19/Sep/2026, 4:21:07 pm (UTC)'!
realizarCaptura
	
	mapa  keysDo: [:key | (condicionDeCaptura value: key)
		ifTrue: [ 
			capturados add: key.
			mapa removeKey: key]
	].
	! !

!RoverMarino methodsFor: 'captura' stamp: 'HAW 19/Sep/2026, 4:29:07 pm (UTC)'!
soyPerezosoYMeSumergiEnElFangoCuandoIntentasteCapturarmeConTuBrazoRed
	
	condicionDeCaptura := [:key | false]! !


!RoverMarino methodsFor: 'estado' stamp: 'HAW 19/Sep/2026, 4:46:12 pm (UTC)'!
entrasEnEstadoDeContingencia

	estado := EstadoContingencia new.
	^self error: RoverMarino brazoDañadoErrorMessage .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RoverMarino class' category: 'Rover Marino'!
RoverMarino class
	instanceVariableNames: ''!

!RoverMarino class methodsFor: 'error messages' stamp: 'NR 3/Oct/2025, 9:08:53 am (UTC)'!
brazoDañadoErrorMessage

	^ 'El brazo se ha dañado. Imposible capturar' ! !

!RoverMarino class methodsFor: 'error messages' stamp: 'NR 3/Oct/2025, 9:08:35 am (UTC)'!
elMapaDebeTenerEspecimenesErrorMessage

	^ 'El mapa debe tener al menos un especimen para capturar'! !


!RoverMarino class methodsFor: 'instance creation' stamp: 'giann 18/Sep/2026, 11:01:22 pm (UTC)'!
conBrazo: unTipoDeBrazo conMapa: unMapa conPosicionInicial: unPunto 
	
	unMapa isEmpty ifTrue: [^ self error: self elMapaDebeTenerEspecimenesErrorMessage ].
	
	^self new initializeConBrazo: unTipoDeBrazo conMapa: unMapa conPosicionInicial: unPunto ! !


!classDefinition: #TipoDeAmbiente category: 'Rover Marino'!
Object subclass: #TipoDeAmbiente
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!TipoDeAmbiente methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 2:47:25 pm (UTC)'!
unBrazoAspirador: brazoDelRover deUnRover: unRover queCapturaConMapa: unMapa

	self subclassResponsibility! !

!TipoDeAmbiente methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 2:57:43 pm (UTC)'!
unBrazoRed: unBrazoRed deUnRover: unRover queCapturaConMapa: unMapa

	self subclassResponsibility! !


!classDefinition: #AmbienteFangoso category: 'Rover Marino'!
TipoDeAmbiente subclass: #AmbienteFangoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!AmbienteFangoso methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 4:30:20 pm (UTC)'!
unBrazoAspirador: brazoDelRover deUnRover: unRover queCapturaConMapa: unMapa 
	
	unMapa keysDo: [:key | key unRover: unRover 
		conBrazoAspiradorEnAmbienteFangosoTeIntentaCapturarUsandoUnMapa: unMapa.
	].
	
! !

!AmbienteFangoso methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 4:30:30 pm (UTC)'!
unBrazoRed: unBrazoRed deUnRover: unRover queCapturaConMapa: unMapa
	
	unMapa keysDo: [:key | 
		key unRover: unRover 
		conBrazoRedEnAmbienteFangosoTeIntentaCapturarUsandoUnMapa: 
		unMapa ].		! !


!classDefinition: #AmbienteRocoso category: 'Rover Marino'!
TipoDeAmbiente subclass: #AmbienteRocoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!AmbienteRocoso methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 4:30:41 pm (UTC)'!
unBrazoAspirador: brazoDelRover deUnRover: unRover queCapturaConMapa: unMapa 
	
	brazoDelRover perdesAlcanceEn: (0@-1).
		
	unMapa keysDo: [:bicho |  
	bicho 
	unRoverConBrazoAspiradorEnAmbienteRocosoTeIntentaCapturarUsandoUnMapa: 
	unMapa. 		
	].
	
! !

!AmbienteRocoso methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 3:42:15 pm (UTC)'!
unBrazoRed: unBrazoRed deUnRover: unRover queCapturaConMapa: unMapa 
	
	unRover intentasCapturarEnAmbienteRocosoConTuBrazoRed.
	! !


!classDefinition: #CapturaSubmarinaTest category: 'Rover Marino'!
TestCase subclass: #CapturaSubmarinaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover Marino'!

!CapturaSubmarinaTest methodsFor: 'especimenes' stamp: 'HAW 19/Sep/2026, 3:53:52 pm (UTC)'!
especimenEscurridizo

	^ EspecimenEscurridizo new.! !

!CapturaSubmarinaTest methodsFor: 'especimenes' stamp: 'HAW 19/Sep/2026, 3:53:40 pm (UTC)'!
especimenPerezoso

	^ EspecimenPerezoso new.! !


!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:08 am (UTC)'!
test01LasSimulacionesDebenTenerEspecimenesACapturar

	self should: [ self roverConAspiradorUtilizando: self mapaVacio paradoSobre: 0@0 ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :exception | self assert: exception messageText = RoverMarino elMapaDebeTenerEspecimenesErrorMessage ]


! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:15 am (UTC)'!
test02ElRoverUtilizandoBrazoAspiradorEnSueloFangosoCapturaUnEspecimenPerezosoEnSuAreaDeAgarre

	|unRoverMaritimo unMapa unEspecimenPerezoso |

	unEspecimenPerezoso:= self especimenPerezoso.
	unMapa := self mapaCon: unEspecimenPerezoso en: 0@1.
	unRoverMaritimo := self roverConAspiradorUtilizando: unMapa paradoSobre: 0@0.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMaritimo.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMaritimo).
	self deny: (self mapa: unMapa contiene: unEspecimenPerezoso)

	"   0 1 2 3 4
	0  x x x o o
	1  P x x o o
	2  x x x o o
	3  o o o o o
	4  o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:19 am (UTC)'!
test03ElRoverUtilizandoBrazoAspiradorEnSueloFangosoNoCapturaUnEspecimenPerezosoFueraDelAreaDeAgarre

	|unRoverMarino unMapa unEspecimenPerezoso |

	unEspecimenPerezoso:= self especimenPerezoso.
	unMapa := self mapaCon: unEspecimenPerezoso en: 0@1.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 1@1.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self deny: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
	self assert: (self mapa: unMapa contiene: unEspecimenPerezoso en: 0@1)

	"   0 1 2 3 4
	0  o o o o o
	1  P x x x o
	2  o x x x o
	3  o x x x o
	4  o o o o o

	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:22 am (UTC)'!
test04ElRoverUtilizandoBrazoAspiradorEnSueloFangosoNoCapturaUnEspecimenEscurridizoQueSeMueveFueraDelAreaDeAgarre

	|unRoverMarino unMapa unEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unMapa := self mapaCon: unEspecimenEscurridizo en: 1@2.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 1@0.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self deny: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self assert: (self mapa: unMapa contiene: unEspecimenEscurridizo en: 2@3)

	"   0 1 2 3 4 5               0 1 2 3 4 5
	0  o x x x o o           0  o x x x o o
	1  o x x x o o           1  o x x x o o
	2  o E x x o o   ->  2  o x x x o o
	3  o o o o o o          3  o o E o o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:25 am (UTC)'!
test05ElRoverUtilizandoBrazoAspiradorEnSueloFangosoCapturaUnEspecimenEscurridizoQueSeMueveDentroDelAreaDeAgarre

	|unRoverMarino unMapa unEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unMapa := self mapaCon: unEspecimenEscurridizo en: 1@2.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 1@1.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenEscurridizo)

	"   0 1 2 3 4 5               0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  o x x x o o           1  o x x x o o
	2  o E x x o o   ->  2  o x x x o o
	3  o x x x o o          3  o x E x o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:28 am (UTC)'!
test06ElRoverUtilizandoBrazoAspiradorEnSueloRocosoNoCapturaUnEspecimenPerezosoEnAreaDeAgarreReducida

	|unRoverMarino unMapa unEspecimenPerezoso |

	unEspecimenPerezoso:= self especimenPerezoso.
	unMapa := self mapaCon: unEspecimenPerezoso en: 2@2.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 0@0.

	self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self deny: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
	self assert: (self mapa: unMapa contiene: unEspecimenPerezoso en: 2@2)

	"   0 1 2 3 4 5
	0  x x x o o o
	1  x x x o o o
	2  o o P o o o
	3  o o o o o o
	4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:31 am (UTC)'!
test07ElRoverUtilizandoBrazoAspiradorEnSueloRocosoCapturaUnEspecimenPerezosoEnAreaDeAgarreReducida

	|unRoverMarino unMapa unEspecimenPerezoso |

	unEspecimenPerezoso:= self especimenPerezoso.
	unMapa := self mapaCon: unEspecimenPerezoso en: 2@2.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 0@1.

	self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenPerezoso)

      "   0 1 2 3 4 5
	0  o o o o o o
	1  x x x o o o
	2  x x P o o o
	3  o o o o o o
	4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:34 am (UTC)'!
test08ElRoverUtilizandoBrazoAspiradorEnSueloRocosoNoCapturaUnEspecimenEscurridizoQueSeMueveFueraDeAreaDeAgarreReducida

	|unRoverMarino unMapa unEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unMapa := self mapaCon: unEspecimenEscurridizo en: 2@1.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 0@0.

	self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self deny: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self assert: (self mapa: unMapa contiene: unEspecimenEscurridizo en: 2@2)

      "   0 1 2 3 4 5               0 1 2 3 4 5
	0  x x x o o o           0  x x x o o o
	1  x x E o o o           1  x x x o o o
	2  o o o o o o   ->  2  o o E o o o
	3  o o o o o o          3  o o o o o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:37 am (UTC)'!
test09ElRoverUtilizandoBrazoApiradorEnSueloRocosoCapturaUnEspecimenEscurridizoQueSeMueveFueraDeAreaDeAgarreReducida

	|unRoverMarino unMapa unEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unMapa := self mapaCon: unEspecimenEscurridizo en: 2@1.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 0@1.

	self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenEscurridizo)

     "     0 1 2 3 4 5              0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  x x E o o o           1  x x x o o o
	2  x x x o o o   ->  2  x x E o o o
	3  o o o o o o          3  o o o o o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:42 am (UTC)'!
test10ElRoverUtilizandoBrazoRedEnSueloFangosoNoCapturaUnEspecimenPerezoso

	|unRoverMarino unMapa unEspecimenPerezoso |

	unEspecimenPerezoso:= self especimenPerezoso.
	unMapa := self mapaCon: unEspecimenPerezoso en: 0@1.
	unRoverMarino := self roverConRedUtilizando: unMapa paradoSobre: 0@1.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self deny: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
	self assert: (self mapa: unMapa contiene: unEspecimenPerezoso en: 0@1)

	"   0 1 2 3 4
	0  o o o o o
	1  P x x x o
	2  o o o o o
	3  o o o o o
	4  o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:45 am (UTC)'!
test11ElRoverUtilizandoBrazoRedEnSueloFangosoNoCapturaUnEspecimenEscurridizoQueSeMueveFueraDelAreaDeAgarre

	|unRoverMarino unMapa unEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unMapa := self mapaCon: unEspecimenEscurridizo en: 1@2.
	unRoverMarino := self roverConRedUtilizando: unMapa paradoSobre: 1@2.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self deny: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self assert: (self mapa: unMapa contiene: unEspecimenEscurridizo en: 0@2)

      "   0 1 2 3 4 5               0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  o o o o o o           1  o o o o o o
	2  o E x x x o   ->  2  E x x x x o
	3  o o o o o o          3  o o o o o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:49 am (UTC)'!
test12ElRoverUtilizandoBrazoRedEnSueloFangosoCapturaUnEspecimenEscurridizoQueSeMueveDentroDelAreaDeAgarre

	|unRoverMarino unMapa unEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unMapa := self mapaCon: unEspecimenEscurridizo en: (1@2).
	unRoverMarino := self roverConRedUtilizando: unMapa paradoSobre: 0@2.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenEscurridizo)

      "   0 1 2 3 4 5               0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  o o o o o o          1  o o o o o o
	2  x E x x o o   ->  2  E x x x o o
	3  o o o o o o          3  o o o o o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:52 am (UTC)'!
test13ElRoverUtilizandoBrazoRedEnSueloRocosoNoCapturaNingunEspecimenYRompeLaRed

	|unRoverMarino unMapa unEspecimenEscurridizo unEspecimenPerezoso |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unEspecimenPerezoso := self especimenPerezoso.

	unMapa := self mapaCon: unEspecimenEscurridizo en: 0@2 y: unEspecimenPerezoso en: 1@2.
	unRoverMarino := self roverConRedUtilizando: unMapa paradoSobre: 0@2.

	self should: [self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:exception |
		self deny: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
		self deny: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
		self assert: (self mapa: unMapa contiene: unEspecimenEscurridizo en: 0@2).
		self assert: (self mapa: unMapa contiene: unEspecimenPerezoso en: 1@2).

		self assert: exception messageText = RoverMarino brazoDañadoErrorMessage
	]

	"   0 1 2 3 4 5 6
	0  o o o o o o o
	1  o o o o o o o
	2  E P x x x x o
	3  o o o o o o o
	4  o o o o o	 o o
	"
! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:56 am (UTC)'!
test14ElRoverCapturaTodosLosEspecimenesDentroDelAreaDeAgarre

	|unRoverMarino unMapa unEspecimenEscurridizo otroEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	otroEspecimenEscurridizo:= self especimenEscurridizo.

	unMapa := self mapaCon: unEspecimenEscurridizo en: 1@2 y: otroEspecimenEscurridizo en: 2@2.

	unRoverMarino := self roverConRedUtilizando: unMapa paradoSobre: 0@2.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self assert: (self verificarCapturaDeEspecimen: otroEspecimenEscurridizo por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenEscurridizo).
	self deny: (self mapa: unMapa contiene: otroEspecimenEscurridizo)

      "   0 1 2 3 4 5               0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  o o o o o o          1   o o o o o o
	2  x E E x x x   ->  2  x x x o o o
	3  o o o o o o          3  o o o o o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:00:59 am (UTC)'!
test15ElRoverCapturaTodosLosEspecimenesAunSiEstanEnLaMismaPosicion

	|unRoverMarino unMapa unEspecimenEscurridizo otroEspecimenPerezoso |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	otroEspecimenPerezoso:= self especimenPerezoso.

	unMapa := self mapaCon:  unEspecimenEscurridizo en: 1@2 y: otroEspecimenPerezoso en: 2@3.

	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 1@1.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self assert: (self verificarCapturaDeEspecimen: otroEspecimenPerezoso por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenEscurridizo).
	self deny: (self mapa: unMapa contiene: otroEspecimenPerezoso)

	"   0 1 2 3 4 5               0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  o x x x o o           1  o x x x o o
	2  o E x x o o   ->  2  o x x x o o
	3  o x P x o o          3  o x x x o o
	4  o o o o o o          4  o o o o o o
	"

	! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 3/Oct/2025, 9:01:02 am (UTC)'!
test16ElRoverUtilizandoBrazoRedEnSueloRocosoSeRompeYCambiaAModoContingencia

	|unRoverMarino unMapa unEspecimenEscurridizo unEspecimenPerezoso |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unEspecimenPerezoso := self especimenPerezoso.

	unMapa := self mapaCon: unEspecimenEscurridizo en: 0@2 y: unEspecimenPerezoso en: 1@2.
	unRoverMarino := self roverConRedUtilizando: unMapa paradoSobre: 0@2.

	self should: [self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:exception |
		self deny: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
		self deny: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
		self assert: (self mapa: unMapa contiene: unEspecimenEscurridizo en: 0@2).
		self assert: (self mapa: unMapa contiene: unEspecimenPerezoso en: 1@2).

		self assert: exception messageText = RoverMarino brazoDañadoErrorMessage .
	].

	 "  0 1 2 3 4 5              0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  o o o o o o           1  o o o o o o
	2  E P x x x x   ->  2  x P x x x x
	3  o o o o o o          3  o o o o o o
	4  o o o o o o          4  o o o o o o
	"

	"Se hacen las capturas en modo contingencia"

	self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self deny: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenEscurridizo).
	self assert: (self mapa: unMapa contiene: unEspecimenPerezoso en: 1@2)
! !


!CapturaSubmarinaTest methodsFor: 'simulaciones' stamp: 'HAW 3/Oct/2025, 7:30:59 pm (UTC)'!
simularCapturaUtilizando: unMapa capturandoCon: unRover enAmbiente: unAmbiente

	self halt: 'Implementar!!'

! !


!CapturaSubmarinaTest methodsFor: 'mapas' stamp: 'giann 18/Sep/2026, 11:57:02 pm (UTC)'!
mapaCon: unEspecimen en: unaPosicion
	
	|d|
	d := Dictionary new. 
	d at: unEspecimen put: unaPosicion.
	
	^d! !

!CapturaSubmarinaTest methodsFor: 'mapas' stamp: 'HAW 19/Sep/2026, 12:21:55 pm (UTC)'!
mapaCon: unEspecimen en: unaPosicion y: otroEspecimen en: otraPosicion
	|nuevoMapa|
	nuevoMapa := Dictionary new.
	nuevoMapa at: unEspecimen put: unaPosicion. 
	nuevoMapa at: otroEspecimen put: otraPosicion.
	^ nuevoMapa 
	 ! !

!CapturaSubmarinaTest methodsFor: 'mapas' stamp: 'giann 18/Sep/2026, 10:59:54 pm (UTC)'!
mapaVacio

	^Dictionary new.! !


!CapturaSubmarinaTest methodsFor: 'assertions' stamp: 'HAW 19/Sep/2026, 3:12:51 pm (UTC)'!
mapa: unMapa contiene: unEspecimen

	"unMapa keysDo: [:key | ((unMapa at: key) = unEspecimen) ifTrue: [^true]]."
	^unMapa keys includes: unEspecimen. 
	! !

!CapturaSubmarinaTest methodsFor: 'assertions' stamp: 'giann 19/Sep/2026, 12:00:58 am (UTC)'!
mapa: unMapa contiene: unEspecimen en: unPunto

	^ (unMapa at: unEspecimen) = unPunto ! !

!CapturaSubmarinaTest methodsFor: 'assertions' stamp: 'giann 18/Sep/2026, 11:15:42 pm (UTC)'!
verificarCapturaDeEspecimen: unEspecimen por: unRover

	^unRover capturoAEsteEspecimen: unEspecimen. ! !


!CapturaSubmarinaTest methodsFor: 'rover' stamp: 'HAW 19/Sep/2026, 1:56:34 pm (UTC)'!
roverConAspiradorUtilizando: unMapa paradoSobre: unPunto
	
	"RoverMarino conBrazo: #Aspirador conMapa: unMapa conPosicionInicial: unPunto."
	^ RoverMarino conBrazo: (BrazoAspirador conEjeEn: unPunto) conMapa: unMapa conPosicionInicial: 
	unPunto.! !

!CapturaSubmarinaTest methodsFor: 'rover' stamp: 'HAW 19/Sep/2026, 2:01:27 pm (UTC)'!
roverConRedUtilizando: unMapa paradoSobre: unPunto
	
	"RoverMarino conBrazo: #Red conMapa: unMapa  conPosicionInicial: unPunto "
	^ RoverMarino conBrazo: (BrazoRed conEjeEn: unPunto ) conMapa: unMapa  
	conPosicionInicial: unPunto.
	! !


!CapturaSubmarinaTest methodsFor: 'ambientes' stamp: 'HAW 19/Sep/2026, 3:04:26 pm (UTC)'!
simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRover

	unRover iniciarCapturaEnAmbiente: (AmbienteFangoso new) conMapa: unMapa ! !

!CapturaSubmarinaTest methodsFor: 'ambientes' stamp: 'HAW 19/Sep/2026, 3:04:13 pm (UTC)'!
simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRover

	unRover  iniciarCapturaEnAmbiente: (AmbienteRocoso new) conMapa: unMapa ! !
