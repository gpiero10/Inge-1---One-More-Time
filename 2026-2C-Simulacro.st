!classDefinition: #Especimen category: #'2026-2C-Simulacro'!
Object subclass: #Especimen
	instanceVariableNames: 'tipoDeEspecimen'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-Simulacro'!

!Especimen methodsFor: 'initialization' stamp: 'giann 18/Sep/2026, 11:41:28 pm (UTC)'!
initializeDeTipo: untipoDeEspecimen 
	
	tipoDeEspecimen := untipoDeEspecimen.! !


!Especimen methodsFor: 'getter' stamp: 'giann 18/Sep/2026, 11:45:57 pm (UTC)'!
tipo
	^ tipoDeEspecimen ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Especimen class' category: #'2026-2C-Simulacro'!
Especimen class
	instanceVariableNames: ''!

!Especimen class methodsFor: 'instance creation' stamp: 'giann 18/Sep/2026, 11:41:08 pm (UTC)'!
deTipo: tipoDeEspecimen 
	
	^self new initializeDeTipo: tipoDeEspecimen ! !


!classDefinition: #RoverMarino category: #'2026-2C-Simulacro'!
Object subclass: #RoverMarino
	instanceVariableNames: 'tipoDeBrazo mapa punto capturados'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-Simulacro'!

!RoverMarino methodsFor: 'initialization' stamp: 'giann 18/Sep/2026, 11:24:07 pm (UTC)'!
initializeConBrazo: unTipoDeBrazo conMapa: unMapa conPosicionInicial: unPunto 
	
	capturados := OrderedCollection new.
	
	tipoDeBrazo := unTipoDeBrazo.
	mapa := unMapa.
	punto := unPunto.! !


!RoverMarino methodsFor: 'captura' stamp: 'giann 18/Sep/2026, 11:24:29 pm (UTC)'!
capturoAEsteEspecimen: unEspecimen 
	^ capturados includes: unEspecimen ! !

!RoverMarino methodsFor: 'captura' stamp: 'giann 19/Sep/2026, 12:17:34 am (UTC)'!
iniciarCapturaEnAmbiente: unTipoDeAmbiente conMapa: unMapa 
	
	|rango |
	rango := Rectangle origin: punto corner: (punto + (3@3)) .
	
	((unTipoDeAmbiente = #Fangoso) and: [tipoDeBrazo = #Aspirador]) 
	ifTrue: [
			unMapa keysDo: [:key | 
				(key tipo = #Escurridizo) 
				ifTrue: [ 
					|nuevaPosicion |
					
					nuevaPosicion := (unMapa at: key) + (1@1).
					unMapa at: key put: nuevaPosicion .
							
				].
			].
		
			"verificar Captura"
			unMapa  keysDo: [:key | (rango containsPoint: (unMapa at: key)) 
			ifTrue: [ 
				capturados add: key.
				unMapa removeKey: key]].
	
			
		].
	
	((unTipoDeAmbiente = #Fangoso) and: [tipoDeBrazo = #Red]) 
	ifTrue: [
			unMapa keysDo: [:key | 
				(key tipo = #Perezoso) 
				ifTrue: [ 
					|nuevaPosicion |
					
					nuevaPosicion := (unMapa at: key) + (1@1).
					unMapa at: key put: nuevaPosicion .
							
				].
			].
		
		
		
		].
	
	((unTipoDeAmbiente = #Rocoso) and: [tipoDeBrazo = #Aspirador]) 
	ifTrue: [
			rango := Rectangle origin: punto corner: (punto + (3@2)) .
			unMapa keysDo: [:key | 
				(key tipo = #Perezoso) 
				ifTrue: [ 
					rango := Rectangle origin: punto corner: (punto + (3@2)) .
				].
				
				(key tipo = #Escurridizo) 
				ifTrue: [ 
					|nuevaPosicion |
					
					nuevaPosicion := (unMapa at: key) + (0@1).
					unMapa at: key put: nuevaPosicion .
				].
				
				
				
				
				
			].
		
		].
	
	"verificar Captura"
			unMapa  keysDo: [:key | (rango containsPoint: (unMapa at: key)) 
			ifTrue: [ 
				capturados add: key.
				unMapa removeKey: key]].
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RoverMarino class' category: #'2026-2C-Simulacro'!
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


!classDefinition: #CapturaSubmarinaTest category: #'2026-2C-Simulacro'!
TestCase subclass: #CapturaSubmarinaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-Simulacro'!

!CapturaSubmarinaTest methodsFor: 'especimenes' stamp: 'giann 18/Sep/2026, 11:40:43 pm (UTC)'!
especimenEscurridizo

	^ Especimen deTipo: #Escurridizo! !

!CapturaSubmarinaTest methodsFor: 'especimenes' stamp: 'giann 19/Sep/2026, 12:01:19 am (UTC)'!
especimenPerezoso

	^ Especimen deTipo: #Perezoso! !


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

!CapturaSubmarinaTest methodsFor: 'mapas' stamp: 'HAW 3/Oct/2025, 7:30:59 pm (UTC)'!
mapaCon: unEspecimen en: unaPosicion y: otroEspecimen en: otraPosicion

	self halt: 'Implementar!!' ! !

!CapturaSubmarinaTest methodsFor: 'mapas' stamp: 'giann 18/Sep/2026, 10:59:54 pm (UTC)'!
mapaVacio

	^Dictionary new.! !


!CapturaSubmarinaTest methodsFor: 'assertions' stamp: 'giann 18/Sep/2026, 11:20:34 pm (UTC)'!
mapa: unMapa contiene: unEspecimen

	unMapa keysDo: [:key | ((unMapa at: key) = unEspecimen) ifTrue: [^true]].
	
	^ false. ! !

!CapturaSubmarinaTest methodsFor: 'assertions' stamp: 'giann 19/Sep/2026, 12:00:58 am (UTC)'!
mapa: unMapa contiene: unEspecimen en: unPunto

	^ (unMapa at: unEspecimen) = unPunto ! !

!CapturaSubmarinaTest methodsFor: 'assertions' stamp: 'giann 18/Sep/2026, 11:15:42 pm (UTC)'!
verificarCapturaDeEspecimen: unEspecimen por: unRover

	^unRover capturoAEsteEspecimen: unEspecimen. ! !


!CapturaSubmarinaTest methodsFor: 'rover' stamp: 'giann 18/Sep/2026, 10:56:37 pm (UTC)'!
roverConAspiradorUtilizando: unMapa paradoSobre: unPunto

	^ RoverMarino conBrazo: #Aspirador conMapa: unMapa conPosicionInicial: unPunto.! !

!CapturaSubmarinaTest methodsFor: 'rover' stamp: 'giann 19/Sep/2026, 12:14:12 am (UTC)'!
roverConRedUtilizando: unMapa paradoSobre: unPunto

	^ RoverMarino conBrazo: #Red conMapa: unMapa  conPosicionInicial: unPunto ! !


!CapturaSubmarinaTest methodsFor: 'ambientes' stamp: 'giann 18/Sep/2026, 11:04:57 pm (UTC)'!
simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRover

	unRover iniciarCapturaEnAmbiente: #Fangoso conMapa: unMapa ! !

!CapturaSubmarinaTest methodsFor: 'ambientes' stamp: 'giann 19/Sep/2026, 12:02:39 am (UTC)'!
simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRover

	unRover  iniciarCapturaEnAmbiente: #Rocoso  conMapa: unMapa ! !
