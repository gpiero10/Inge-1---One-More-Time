!classDefinition: #EstiloDeArquero category: #Penales!
Object subclass: #EstiloDeArquero
	instanceVariableNames: 'arquero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!EstiloDeArquero methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:37:55 pm (UTC)'!
mePateanAColocarConUnaJabulaniEnUnJuego: unJuego

	self subclassResponsibility! !

!EstiloDeArquero methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:37:58 pm (UTC)'!
mePateanAColocarConUnaPlayeraEnUnJuego: unJuego

	self subclassResponsibility! !

!EstiloDeArquero methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:38:02 pm (UTC)'!
mePateanAMatarConUnaJabulaniEnUnJuego: unJuego

	self subclassResponsibility! !

!EstiloDeArquero methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:38:06 pm (UTC)'!
mePateanAMatarConUnaPlayeraEnUnJuego: unJuego

	self subclassResponsibility! !


!EstiloDeArquero methodsFor: 'initialization' stamp: 'HAW 13/Sep/2026, 5:07:34 pm (UTC)'!
initializeFor: anArquero 
	
	arquero := anArquero.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstiloDeArquero class' category: #Penales!
EstiloDeArquero class
	instanceVariableNames: ''!

!EstiloDeArquero class methodsFor: 'instance creation' stamp: 'HAW 13/Sep/2026, 5:07:26 pm (UTC)'!
for: anArquero 
	
	^self new initializeFor: anArquero ! !


!classDefinition: #Anticipador category: #Penales!
EstiloDeArquero subclass: #Anticipador
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Anticipador methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:39:26 pm (UTC)'!
mePateanAColocarConUnaJabulaniEnUnJuego: unJuego
	
	arquero sosAnticipadorYTePateanAColocarConLaJabulani: unJuego. ! !

!Anticipador methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:39:59 pm (UTC)'!
mePateanAColocarConUnaPlayeraEnUnJuego: unJuego
	
	arquero sosAnticipadorYTePateanAColocarConLaPlayera: unJuego. ! !

!Anticipador methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:40:30 pm (UTC)'!
mePateanAMatarConUnaJabulaniEnUnJuego: unJuego
	
	arquero sosAnticipadorYTePateanAMatarConLaJabulani: unJuego. ! !

!Anticipador methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:40:52 pm (UTC)'!
mePateanAMatarConUnaPlayeraEnUnJuego: unJuego
	
	arquero sosAnticipadorYTePateanAMatarConLaPlayera: unJuego. ! !


!classDefinition: #EsperaYSeAdelanta category: #Penales!
EstiloDeArquero subclass: #EsperaYSeAdelanta
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!EsperaYSeAdelanta methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:42:33 pm (UTC)'!
mePateanAColocarConUnaJabulaniEnUnJuego: unJuego
	
	arquero sosEsperadorYAdelantadorYTePateanAColocarConLaJabulani: unJuego. ! !

!EsperaYSeAdelanta methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:43:16 pm (UTC)'!
mePateanAColocarConUnaPlayeraEnUnJuego: unJuego

	arquero sosEsperadorYAdelantadorYTePateanAColocarConLaPlayera: unJuego. ! !

!EsperaYSeAdelanta methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:43:36 pm (UTC)'!
mePateanAMatarConUnaJabulaniEnUnJuego: unJuego

	arquero sosEsperadorYAdelantadorYTePateanAMatarConLaJabulani: unJuego.! !

!EsperaYSeAdelanta methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:44:19 pm (UTC)'!
mePateanAMatarConUnaPlayeraEnUnJuego: unJuego

	arquero sosEsperadorYAdelantadorYTePateanAMatarConLaPlayera: unJuego. ! !


!classDefinition: #EstiloDeDelantero category: #Penales!
Object subclass: #EstiloDeDelantero
	instanceVariableNames: 'delantero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!EstiloDeDelantero methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:30:50 pm (UTC)'!
pateasUnaJabulaniContraArquero: unArquero enJuego: unJuego

	self subclassResponsibility! !

!EstiloDeDelantero methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:30:55 pm (UTC)'!
pateasUnaPlayeraContraArquero: unArquero enJuego: unJuego

	self subclassResponsibility! !


!EstiloDeDelantero methodsFor: 'initialization' stamp: 'HAW 13/Sep/2026, 5:05:20 pm (UTC)'!
initializeFor: aDelantero 
	
	delantero := aDelantero.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstiloDeDelantero class' category: #Penales!
EstiloDeDelantero class
	instanceVariableNames: ''!

!EstiloDeDelantero class methodsFor: 'instance creation' stamp: 'HAW 13/Sep/2026, 5:05:11 pm (UTC)'!
for: aDelantero 
	
	^self new initializeFor: aDelantero ! !


!classDefinition: #Colocador category: #Penales!
EstiloDeDelantero subclass: #Colocador
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Colocador methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:31:58 pm (UTC)'!
pateasUnaJabulaniContraArquero: unArquero enJuego: unJuego
	
	delantero sosColocadorYPateasUnaJabulaniContraArquero: unArquero enJuego: unJuego ! !

!Colocador methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:32:58 pm (UTC)'!
pateasUnaPlayeraContraArquero: unArquero enJuego: unJuego
	
	delantero sosColocadorYPateasUnaPlayeraContraArquero: unArquero enJuego: unJuego ! !


!classDefinition: #Matador category: #Penales!
EstiloDeDelantero subclass: #Matador
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Matador methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:33:26 pm (UTC)'!
pateasUnaJabulaniContraArquero: unArquero enJuego: unJuego
	
	delantero sosMatadorYPateasUnaJabulaniContraArquero: unArquero enJuego: unJuego ! !

!Matador methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:33:43 pm (UTC)'!
pateasUnaPlayeraContraArquero: unArquero enJuego: unJuego

	delantero sosMatadorYPateasUnaPlayeraContraArquero: unArquero enJuego: unJuego ! !


!classDefinition: #Jugador category: #Penales!
Object subclass: #Jugador
	instanceVariableNames: 'fuerza estrategia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!


!classDefinition: #Arquero category: #Penales!
Jugador subclass: #Arquero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Arquero methodsFor: 'initialization' stamp: 'HAW 13/Sep/2026, 5:50:33 pm (UTC)'!
initializeAnticipadorSuFuerzaBaseEs: unaFuerza 
	estrategia := Anticipador for: self.
	fuerza := unaFuerza.! !

!Arquero methodsFor: 'initialization' stamp: 'HAW 13/Sep/2026, 5:09:10 pm (UTC)'!
initializeEsperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaFuerza 
	
	estrategia :=( EsperaYSeAdelanta for: self).
	fuerza := unaFuerza.! !


!Arquero methodsFor: 'getter' stamp: 'HAW 12/Sep/2026, 5:30:07 pm (UTC)'!
fuerza
	^fuerza! !


!Arquero methodsFor: 'atajada' stamp: 'HAW 13/Sep/2026, 5:26:21 pm (UTC)'!
getFuerzaResultanteDeAtajada
	self shouldBeImplemented.! !


!Arquero methodsFor: 'mePatean' stamp: 'HAW 13/Sep/2026, 5:11:34 pm (UTC)'!
tePateanAColocarUnaJabulaniEnUnJuego: unJuego

	estrategia mePateanAColocarConUnaJabulaniEnUnJuego: unJuego.! !

!Arquero methodsFor: 'mePatean' stamp: 'HAW 13/Sep/2026, 5:58:38 pm (UTC)'!
tePateanAColocarUnaPlayeraenUnJuego: unJuego

	estrategia mePateanAColocarConUnaPlayeraEnUnJuego: unJuego .! !

!Arquero methodsFor: 'mePatean' stamp: 'HAW 13/Sep/2026, 6:01:56 pm (UTC)'!
tePateanAMatarUnaJabulanienUnJuego: unJuego

	estrategia mePateanAMatarConUnaJabulaniEnUnJuego: unJuego.! !

!Arquero methodsFor: 'mePatean' stamp: 'HAW 13/Sep/2026, 6:02:11 pm (UTC)'!
tePateanAMatarUnaPlayeraEnUnJuego: unJuego

	estrategia mePateanAMatarConUnaPlayeraEnUnJuego: unJuego.! !


!Arquero methodsFor: 'state' stamp: 'HAW 13/Sep/2026, 3:46:54 pm (UTC)'!
sosAnticipadorYTePateanAColocarConLaJabulani: unJuego
	
	unJuego protocoloArqueroQueAnticipaYDelanteroTiraAColocarConJabulani. 
	! !

!Arquero methodsFor: 'state' stamp: 'HAW 13/Sep/2026, 3:48:55 pm (UTC)'!
sosAnticipadorYTePateanAColocarConLaPlayera: unJuego
	
	unJuego protocoloArqueroQueAnticipaYDelanteroTiraAColocarUnaPlayera. ! !

!Arquero methodsFor: 'state' stamp: 'HAW 13/Sep/2026, 3:49:40 pm (UTC)'!
sosAnticipadorYTePateanAMatarConLaJabulani: unJuego
	
	unJuego protocoloArqueroQueAnticipaYDelanteroTiraAMatarUnaJabulani.! !

!Arquero methodsFor: 'state' stamp: 'HAW 13/Sep/2026, 3:50:02 pm (UTC)'!
sosAnticipadorYTePateanAMatarConLaPlayera: unJuego

	unJuego protocoloArqueroQueAnticipaYDelanteroTiraAMatarConPlayera. ! !

!Arquero methodsFor: 'state' stamp: 'HAW 13/Sep/2026, 3:50:48 pm (UTC)'!
sosEsperadorYAdelantadorYTePateanAColocarConLaJabulani: unJuego

	unJuego protocoloArqueroSeADelantaYDelanteroTiraAColocarConJabulani ! !

!Arquero methodsFor: 'state' stamp: 'HAW 13/Sep/2026, 3:51:09 pm (UTC)'!
sosEsperadorYAdelantadorYTePateanAColocarConLaPlayera: unjuego
	
	unjuego protocoloArqueroSeADelantaYDelanteroTiraAColocarConPlayera. ! !

!Arquero methodsFor: 'state' stamp: 'HAW 13/Sep/2026, 3:51:27 pm (UTC)'!
sosEsperadorYAdelantadorYTePateanAMatarConLaJabulani: unJuego
	
	unJuego protocoloArqueroSeADelantaYDelanteroMataConJabulani ! !

!Arquero methodsFor: 'state' stamp: 'HAW 13/Sep/2026, 3:53:54 pm (UTC)'!
sosEsperadorYAdelantadorYTePateanAMatarConLaPlayera: unJuego

	unJuego protocoloArqueroSeADelantaYDelanteroMataConPlayera 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arquero class' category: #Penales!
Arquero class
	instanceVariableNames: ''!

!Arquero class methodsFor: 'instance creation' stamp: 'HAW 13/Sep/2026, 5:06:53 pm (UTC)'!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaFuerza 
	
	^self new initializeEsperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaFuerza
	! !


!Arquero class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 5:50:11 pm (UTC)'!
eligeDireccionAntesDeTiroSuFuerzaBaseEs: unaFuerza 
	
	^self new initializeAnticipadorSuFuerzaBaseEs: unaFuerza
	! !


!classDefinition: #Delantero category: #Penales!
Jugador subclass: #Delantero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Delantero methodsFor: 'initialization' stamp: 'HAW 13/Sep/2026, 5:04:59 pm (UTC)'!
initializeDelanteroDecideTirarAColocarYSuFuerzaBaseEs: unaFuerza 
	estrategia := (Colocador for: self).
	fuerza := unaFuerza.! !

!Delantero methodsFor: 'initialization' stamp: 'HAW 13/Sep/2026, 5:58:06 pm (UTC)'!
initializeDelanteroDecideTirarAMatarYSuFuerzaBaseEs: unaFuerza 
	fuerza := unaFuerza.
	estrategia := Matador for: self.
	
	! !


!Delantero methodsFor: 'getter' stamp: 'HAW 13/Sep/2026, 6:19:19 pm (UTC)'!
fuerza
	
	^fuerza! !


!Delantero methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:30:32 pm (UTC)'!
pateasUnaJabulaniContraArquero: unArquero enJuego: unJuego

	estrategia pateasUnaJabulaniContraArquero: unArquero enJuego: unJuego.! !

!Delantero methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:20:25 pm (UTC)'!
pateasUnaPlayeraContraArquero: unArquero enJuego: unJuego

	estrategia pateasUnaPlayeraContraArquero: unArquero enJuego: unJuego.! !


!Delantero methodsFor: 'sos' stamp: 'HAW 13/Sep/2026, 4:23:52 pm (UTC)'!
sosColocadorYPateasUnaJabulaniContraArquero: unArquero enJuego: unJuego
	
	unArquero tePateanAColocarUnaJabulaniEnUnJuego: unJuego.! !

!Delantero methodsFor: 'sos' stamp: 'HAW 13/Sep/2026, 4:26:52 pm (UTC)'!
sosColocadorYPateasUnaPlayeraContraArquero: unArquero enJuego: unJuego
	
	unArquero tePateanAColocarUnaPlayeraenUnJuego: unJuego.! !

!Delantero methodsFor: 'sos' stamp: 'HAW 13/Sep/2026, 4:24:21 pm (UTC)'!
sosMatadorYPateasUnaJabulaniContraArquero: unArquero enJuego: unJuego
	
	unArquero tePateanAMatarUnaJabulanienUnJuego: unJuego.! !

!Delantero methodsFor: 'sos' stamp: 'HAW 13/Sep/2026, 4:26:31 pm (UTC)'!
sosMatadorYPateasUnaPlayeraContraArquero: unArquero enJuego: unJuego
	
	unArquero tePateanAMatarUnaPlayeraEnUnJuego: unJuego.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Delantero class' category: #Penales!
Delantero class
	instanceVariableNames: ''!

!Delantero class methodsFor: 'instance creation' stamp: 'HAW 13/Sep/2026, 5:04:30 pm (UTC)'!
decideTirarAColocarSuFuerzaBaseEs: unaFuerza 
	
	^self new initializeDelanteroDecideTirarAColocarYSuFuerzaBaseEs: unaFuerza 
! !

!Delantero class methodsFor: 'instance creation' stamp: 'HAW 13/Sep/2026, 5:57:38 pm (UTC)'!
decideTirarAMatarSuFuerzaBaseEs: unaFuerza 
	

	^self new initializeDelanteroDecideTirarAMatarYSuFuerzaBaseEs: unaFuerza 
 ! !


!classDefinition: #Pelota category: #Penales!
Object subclass: #Pelota
	instanceVariableNames: 'tipo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Pelota methodsFor: 'initialization' stamp: 'HAW 13/Sep/2026, 5:12:33 pm (UTC)'!
initializeInitializePelotaDeTipoJabulani
	
	tipo := Jabulani for: self.! !

!Pelota methodsFor: 'initialization' stamp: 'HAW 13/Sep/2026, 5:56:45 pm (UTC)'!
initializeInitializePelotaDeTipoPlayera 
	tipo := Playera for: self.! !


!Pelota methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:07:14 pm (UTC)'!
delanteroTePatea: unDelantero contraArquero: unArquero enUnJuego: unJuego

	tipo delanteroMePatea: unDelantero contraArquero: unArquero enUnJuego: unJuego.! !

!Pelota methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:07:51 pm (UTC)'!
sosJabulaniYDelanteroTePatea: unDelantero contraArquero: unArquero enUnJuego: unJuego
	
	unDelantero pateasUnaJabulaniContraArquero: unArquero enJuego: unJuego.! !

!Pelota methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:08:41 pm (UTC)'!
sosPlayeraYDelanteroTePatea: unDelantero contraArquero: unArquero enUnJuego: unJuego
	
	unDelantero pateasUnaPlayeraContraArquero: unArquero enJuego: unJuego.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pelota class' category: #Penales!
Pelota class
	instanceVariableNames: ''!

!Pelota class methodsFor: 'instance creation' stamp: 'HAW 13/Sep/2026, 5:05:59 pm (UTC)'!
jabulaniSudafricanaRapida

	^self new initializeInitializePelotaDeTipoJabulani ! !

!Pelota class methodsFor: 'instance creation' stamp: 'HAW 13/Sep/2026, 5:56:17 pm (UTC)'!
playeraLentaCostaAzul
	
	^self new initializeInitializePelotaDeTipoPlayera ! !


!classDefinition: #Penales category: #Penales!
Object subclass: #Penales
	instanceVariableNames: 'arco delantero arquero puntajeArquero puntajeDelantero var direccionDeRemate direccionDeAtajada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Penales methodsFor: 'initialization' stamp: 'HAW 13/Sep/2026, 12:54:33 pm (UTC)'!
initializeConDelantero: unDelantero yArquero: unArquero 
	
	delantero := unDelantero.
	arquero := unArquero.
	
	puntajeArquero := 0. 
	puntajeDelantero := 0.
	
	arco := Rectangle origin: 0@0 corner: 3@3.
! !


!Penales methodsFor: 'ejecucion' stamp: 'HAW 13/Sep/2026, 2:54:10 pm (UTC)'!
arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: unaDireccionDeRemate arqueroSeLanzaEnDirección: unaDireccionDeAtajada 
	
	self chequearDireccionesValidasDeRemate: unaDireccionDeRemate yAtajada: 
	unaDireccionDeAtajada returningWith: [ :res | ^ res ].
	
	direccionDeRemate := unaDireccionDeRemate.
	direccionDeAtajada  := unaDireccionDeAtajada. 
	
	var := VAR arbitrarPenal: self deDelantero: delantero conDireccionDeRemate: 	unaDireccionDeRemate 
	yArquero: arquero  conDireccionDeAtajada: unaDireccionDeAtajada 
	conPelota: pelota.
	
	pelota delanteroTePatea: delantero contraArquero: arquero enUnJuego: self. ! !

!Penales methodsFor: 'ejecucion' stamp: 'HAW 13/Sep/2026, 1:25:24 pm (UTC)'!
chequearDireccionesValidasDeRemate: unaDireccionDeRemate yAtajada: unaDireccionDeAtajada returningWith: aReturningBlock

	 (arco containsPoint: unaDireccionDeRemate) 
		ifFalse: [^ aReturningBlock value: (self error: self class direccionTiroFueraDeRango)].
	
	 (arco containsPoint: unaDireccionDeAtajada) 
		ifFalse: [^ aReturningBlock value: (self error: self class direccionArqueroFueraDeRango)].! !

!Penales methodsFor: 'ejecucion' stamp: 'HAW 12/Sep/2026, 2:33:47 pm (UTC)'!
puntajeDeArquero
	^puntajeArquero ! !

!Penales methodsFor: 'ejecucion' stamp: 'HAW 12/Sep/2026, 2:33:39 pm (UTC)'!
puntajeDeDelantero
	^puntajeDelantero ! !

!Penales methodsFor: 'ejecucion' stamp: 'HAW 12/Sep/2026, 10:15:10 pm (UTC)'!
varDireccionRemateResultante
	^ var getDireccionDeRemateResultante ! !

!Penales methodsFor: 'ejecucion' stamp: 'HAW 13/Sep/2026, 5:26:21 pm (UTC)'!
varFuerzaResultanteDeAtajada
	^var getFuerzaResultanteDeAtajada ! !

!Penales methodsFor: 'ejecucion' stamp: 'HAW 13/Sep/2026, 5:25:59 pm (UTC)'!
varFuerzaResultanteDeTiro
	^var getFuerzaResultanteDeTiro
	! !


!Penales methodsFor: 'puntuacion' stamp: 'HAW 12/Sep/2026, 3:52:28 pm (UTC)'!
atajada
	puntajeArquero := 1! !

!Penales methodsFor: 'puntuacion' stamp: 'HAW 12/Sep/2026, 3:57:44 pm (UTC)'!
gol
	puntajeDelantero := 1! !


!Penales methodsFor: 'protocolo' stamp: 'HAW 18/Sep/2026, 6:56:31 pm (UTC)'!
protocoloArqueroQueAnticipaYDelanteroTiraAColocarConJabulani

	var calcularFuerzaResultanteDeTiroCuandoPelotaJabulaniYDelanteroColocador.
	var calcularFuerzaResultanteDeAtajadaCuandoArqueroAnticipadorDelanteroColocadorYPelotaJabulani.
	 
	var validarGol: [direccionDeRemate = direccionDeAtajada]! !

!Penales methodsFor: 'protocolo' stamp: 'HAW 18/Sep/2026, 6:40:15 pm (UTC)'!
protocoloArqueroQueAnticipaYDelanteroTiraAColocarUnaPlayera

	var calcularFuerzaResultanteDeTiroCuandoPelotaPlayeraYDelanteroColocador.
	var calcularFuerzaResultanteDeAtajadaCuandoArqueroAnticipadorYPelotaPlayera.
	 
	var validarGol: [direccionDeRemate = direccionDeAtajada ]! !

!Penales methodsFor: 'protocolo' stamp: 'HAW 18/Sep/2026, 6:56:01 pm (UTC)'!
protocoloArqueroQueAnticipaYDelanteroTiraAMatarConPlayera
	
	| coordenadaDeTiroEnY |
	var calcularDireccionRemateResultanteCuandoTiranAMatarConPlayera.
	
	coordenadaDeTiroEnY := var getDireccionDeRemateResultante y.
	var validarGol: [coordenadaDeTiroEnY = direccionDeAtajada y].
	! !

!Penales methodsFor: 'protocolo' stamp: 'HAW 18/Sep/2026, 6:56:08 pm (UTC)'!
protocoloArqueroQueAnticipaYDelanteroTiraAMatarUnaJabulani
	
	| coordenadaDeTiroEnX |
	var calcularDireccionRemateResultanteCuandoTiranAMatarConJabulani.
	var calcularFuerzaResultanteDeTiroCuandoPelotaJabulaniYDelanteroMatador. 
	coordenadaDeTiroEnX := var getDireccionDeRemateResultante x.
	
	var validarGol: [coordenadaDeTiroEnX = direccionDeAtajada x].! !

!Penales methodsFor: 'protocolo' stamp: 'HAW 13/Sep/2026, 6:22:48 pm (UTC)'!
protocoloArqueroSeADelantaYDelanteroMataConJabulani
	
	var calcularDireccionRemateResultanteCuandoTiranAMatarConJabulani.
	self gol.! !

!Penales methodsFor: 'protocolo' stamp: 'HAW 13/Sep/2026, 6:22:58 pm (UTC)'!
protocoloArqueroSeADelantaYDelanteroMataConPlayera
	
	var calcularDireccionRemateResultanteCuandoTiranAMatarConPlayera. 
	self atajada.! !

!Penales methodsFor: 'protocolo' stamp: 'HAW 18/Sep/2026, 6:56:22 pm (UTC)'!
protocoloArqueroSeADelantaYDelanteroTiraAColocarConJabulani
	
	|coordenadaEnX|
	var calcularFuerzaResultanteDeTiroCuandoPelotaJabulaniYDelanteroColocador .
	coordenadaEnX := var getDireccionRemateResultante x.​ 
	var validarGol: [ coordenadaEnX = direccionDeAtajada x].! !

!Penales methodsFor: 'protocolo' stamp: 'HAW 13/Sep/2026, 2:37:56 pm (UTC)'!
protocoloArqueroSeADelantaYDelanteroTiraAColocarConPlayera
	
	self gol! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Penales class' category: #Penales!
Penales class
	instanceVariableNames: ''!

!Penales class methodsFor: 'message errors' stamp: 'NR 19/Sep/2023, 9:12:49 am (UTC)'!
direccionArqueroFueraDeRango
	
	^'El arquero debe lanzarse a coordenadas válidas'! !

!Penales class methodsFor: 'message errors' stamp: 'NR 19/Sep/2023, 9:12:32 am (UTC)'!
direccionTiroFueraDeRango
	
	^'La pelota debe dirigirse a coordenadas válidas'! !


!Penales class methodsFor: 'instance creation' stamp: 'HAW 12/Sep/2026, 2:11:27 pm (UTC)'!
conDelantero: unDelantero yArquero: unArquero 
	
	^self new initializeConDelantero: unDelantero yArquero: unArquero ! !


!classDefinition: #TipoDePelota category: #Penales!
Object subclass: #TipoDePelota
	instanceVariableNames: 'pelota'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!TipoDePelota methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:11:06 pm (UTC)'!
delanteroMePatea: unDelantero contraArquero: unArquero enUnJuego: unJuego

	self subclassResponsibility! !


!TipoDePelota methodsFor: 'initialization' stamp: 'HAW 13/Sep/2026, 5:12:59 pm (UTC)'!
initializeFor: aPelota

	pelota := aPelota.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TipoDePelota class' category: #Penales!
TipoDePelota class
	instanceVariableNames: ''!

!TipoDePelota class methodsFor: 'instance creation' stamp: 'HAW 13/Sep/2026, 5:06:23 pm (UTC)'!
for: aPelota 
	
	^self new initializeFor: aPelota ! !


!classDefinition: #Jabulani category: #Penales!
TipoDePelota subclass: #Jabulani
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Jabulani methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:13:16 pm (UTC)'!
delanteroMePatea: unDelantero contraArquero: unArquero enUnJuego: unJuego

	pelota sosJabulaniYDelanteroTePatea: unDelantero contraArquero: unArquero enUnJuego: unJuego ! !


!classDefinition: #Playera category: #Penales!
TipoDePelota subclass: #Playera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Playera methodsFor: 'as yet unclassified' stamp: 'HAW 13/Sep/2026, 4:13:26 pm (UTC)'!
delanteroMePatea: unDelantero contraArquero: unArquero enUnJuego: unJuego
	
	pelota sosPlayeraYDelanteroTePatea: unDelantero contraArquero: unArquero enUnJuego: unJuego ! !


!classDefinition: #VAR category: #Penales!
Object subclass: #VAR
	instanceVariableNames: 'penales delantero direccionDeRemate arquero direccionDeAtajada pelota angulos arco aReturningBlock fuerzaResultanteDeTiro fuerzaResultanteDeAtajada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!VAR methodsFor: 'initialization' stamp: 'HAW 13/Sep/2026, 5:27:12 pm (UTC)'!
initializeArbitrarPenal: aPenales deDelantero: unDelantero conDireccionDeRemate: unaDireccionDeRemate yArquero: unArquero conDireccionDeAtajada: unaDireccionDeAtajada conPelota: unaPelota
	
	penales := aPenales.
	delantero := unDelantero.
	direccionDeRemate := unaDireccionDeRemate.
	arquero := unArquero.
	direccionDeAtajada := unaDireccionDeAtajada.
	pelota := unaPelota.
	
	fuerzaResultanteDeTiro := delantero fuerza. 
	fuerzaResultanteDeAtajada := arquero fuerza.
	
	angulos := OrderedCollection with: 0@0 with: 0@2  with: 2@0  with: 2@2.
	arco := Rectangle origin: 0@0 corner: 3@3.! !


!VAR methodsFor: 'calculos' stamp: 'HAW 13/Sep/2026, 5:40:12 pm (UTC)'!
calcularDireccionRemateResultanteCuandoTiranAMatarConJabulani
	
	(angulos includes: direccionDeRemate)
			ifTrue:[direccionDeRemate := (direccionDeRemate x @1)].
	
	^ direccionDeRemate.! !

!VAR methodsFor: 'calculos' stamp: 'HAW 13/Sep/2026, 5:40:17 pm (UTC)'!
calcularDireccionRemateResultanteCuandoTiranAMatarConPlayera
	(angulos includes: direccionDeRemate)
			ifTrue:[direccionDeRemate := (direccionDeRemate x @1)]
			ifFalse:[direccionDeRemate := (direccionDeRemate x @ (direccionDeRemate y + 2))].
			
	^ direccionDeRemate.! !

!VAR methodsFor: 'calculos' stamp: 'HAW 13/Sep/2026, 5:40:27 pm (UTC)'!
calcularFuerzaResultanteDeAtajadaCuandoArqueroAnticipadorDelanteroColocadorYPelotaJabulani
	
	fuerzaResultanteDeAtajada := arquero fuerza + (arquero fuerza/2).
	
	^ fuerzaResultanteDeAtajada .! !

!VAR methodsFor: 'calculos' stamp: 'HAW 13/Sep/2026, 5:40:35 pm (UTC)'!
calcularFuerzaResultanteDeAtajadaCuandoArqueroAnticipadorYPelotaPlayera
		
	fuerzaResultanteDeAtajada := arquero fuerza *2.
	
	^ fuerzaResultanteDeAtajada .! !

!VAR methodsFor: 'calculos' stamp: 'HAW 13/Sep/2026, 5:48:15 pm (UTC)'!
calcularFuerzaResultanteDeTiroCuandoPelotaJabulaniYDelanteroColocador
	fuerzaResultanteDeTiro := fuerzaResultanteDeTiro/2.
	^fuerzaResultanteDeTiro. ! !

!VAR methodsFor: 'calculos' stamp: 'HAW 13/Sep/2026, 5:40:42 pm (UTC)'!
calcularFuerzaResultanteDeTiroCuandoPelotaJabulaniYDelanteroMatador

	fuerzaResultanteDeTiro :=(delantero fuerza + ((delantero fuerza *20)/100)).
	
	^ fuerzaResultanteDeTiro ! !

!VAR methodsFor: 'calculos' stamp: 'HAW 13/Sep/2026, 6:01:15 pm (UTC)'!
calcularFuerzaResultanteDeTiroCuandoPelotaPlayeraYDelanteroColocador
	fuerzaResultanteDeTiro := fuerzaResultanteDeTiro /2.
	fuerzaResultanteDeTiro := (fuerzaResultanteDeTiro - ((fuerzaResultanteDeTiro *20)/100)).
	
	^ fuerzaResultanteDeTiro.! !


!VAR methodsFor: 'getters' stamp: 'HAW 18/Sep/2026, 6:26:22 pm (UTC)'!
getDireccionDeRemateResultante
	
	^ direccionDeRemate ! !

!VAR methodsFor: 'getters' stamp: 'HAW 18/Sep/2026, 6:26:26 pm (UTC)'!
getDireccionRemateResultante
	
	^direccionDeRemate ! !

!VAR methodsFor: 'getters' stamp: 'HAW 13/Sep/2026, 6:16:49 pm (UTC)'!
getFuerzaResultanteDeAtajada
		
	^ fuerzaResultanteDeAtajada ! !

!VAR methodsFor: 'getters' stamp: 'HAW 13/Sep/2026, 6:16:54 pm (UTC)'!
getFuerzaResultanteDeTiro

	
	^ fuerzaResultanteDeTiro. 
	! !


!VAR methodsFor: 'validacion' stamp: 'HAW 18/Sep/2026, 6:38:35 pm (UTC)'!
validarGol: verificacionDeDirecciones
	
	(arco containsPoint: direccionDeRemate) 
		ifTrue: [
			( verificacionDeDirecciones value and: [fuerzaResultanteDeTiro <= 
				fuerzaResultanteDeAtajada ])
			ifTrue:[ penales atajada ]
			ifFalse:[ penales gol]
		]
		ifFalse: [ penales atajada].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VAR class' category: #Penales!
VAR class
	instanceVariableNames: ''!

!VAR class methodsFor: 'instance creation' stamp: 'HAW 12/Sep/2026, 4:07:57 pm (UTC)'!
arbitrarPenal: aPenales deDelantero: unDelantero conDireccionDeRemate: direccionDeRemate yArquero: unArquero conDireccionDeAtajada: direccionDeAtajada conPelota: unaPelota  
	
	^self new initializeArbitrarPenal: aPenales deDelantero: unDelantero conDireccionDeRemate: direccionDeRemate yArquero: unArquero conDireccionDeAtajada: direccionDeAtajada conPelota: unaPelota  ! !


!classDefinition: #PenalesTest category: #Penales!
TestCase subclass: #PenalesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test01DelanteroNoPuedeApuntarHaciaAfueraDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: -1@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test02DelanteroNoPuedeApuntarHaciaAfueraDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 3@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:06 am (UTC)'!
test03DelanteroNoPuedeApuntarHaciaAbajoDelArco
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@-1 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test04DelanteroNoPuedeApuntarHaciaArribaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@3 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test05ArqueroNoPuedePasarseDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: -1@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test06ArqueroNoPuedePasarseDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 3@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:06 am (UTC)'!
test07ArqueroNoPuedeMeterseAbajoDeLaTierra
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@-1.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test08ArqueroNoPuedeSaltarPorEncimaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@3.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test09DireccionesDiferentesGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante
	"varXXXX es por VAR, de 'Video Assistant Referee'"! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test10MismasDireccionesInsuficienteFuerzaGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 10.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test11MismasDireccionesSuficienteFuerzaAtajaArquero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:08 am (UTC)'!
test12DelanteroQueTiraAColocarPierde50PorcFuerza
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"(delantero sacrificia potencia para ganar mayor precisión)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:34 am (UTC)'!
test13ArqueroQueEligeAntesDeTiroVsJabulaniAColocarSuma50PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige donde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	"(el arquero llega más cómodo y aprovecha mejor su fuerza)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 34.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 51 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:34 am (UTC)'!
test14FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige adonde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 32.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 48 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test15ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAColocarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que espera y se adelanta ante un tiro de jabulani a colocar ignora la 2da coordenada (altura) al atajar..."	
	"(al adelanterse encara la pelota antes de que su elevación se transforme en un problema)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:08 am (UTC)'!
test16PelotaPlayeraUsadaAColocarLeHacePerder20PorcFuerzaExtraAlDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% de fuerza adicional al delantero que la use para colocar... (no importa el arquero)"
	"(no debería ser reglamentaria... al menos no es de trapo, nos responden)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:34 am (UTC)'!
test17ArqueroQueEligeAntesDeTiroVsPlayeraAColocarSuma100PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	"(a quien madruga...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 20.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:34 am (UTC)'!
test18FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsPlayeraAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 19.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 38 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test19ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAColocarEsDescubiertoYPuntoParaDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Arquero que espera y se adelanta ante tiro con la lenta pelota playera, siempre es descubierto por el Árbitro, y el punto se le otorga al Delantero..."
	"(lo que servía de ventaja ante la Jabulani rápida, acá es tan obvio por lo que tarda en llegar la pelota al arco, que marchás preso...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:34:52 am (UTC)'!
test20DelanteroTiraAMatarAlAnguloInferiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:34:47 am (UTC)'!
test21DelanteroTiraAMatarAlAnguloSuperiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:34:41 am (UTC)'!
test22DelanteroTiraAMatarAlAnguloInferiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:34:36 am (UTC)'!
test23DelanteroTiraAMatarAlAnguloSuperiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:34:29 am (UTC)'!
test24DelanteroTiraAMatarNoAlAnguloMantieneDireccionTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@1.

	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:08 am (UTC)'!
test25DelanteroTiraAMatarUsa100PorcFuerzaBase
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:150.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 150 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:08 am (UTC)'!
test26DelanteroTiraAMatarConJabulaniGana20PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	"(Jabulani a matar es la elección de los guerreros Z)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 120.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:08 am (UTC)'!
test27FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAMatar
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 119.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:06 am (UTC)'!
test28ArqueroQueEligeAntesDeTiroVsJabulaniAMatarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que elige donde tirarse antes de un tiro de jabulani a matar, ignora la 2da coordenada (altura) al atajar..."		
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test29ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAMatarNuncaAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera a ver la dirección del remate de una pelota jabulani rápida a matar antes de lanzarse, nunca la ataja sin importar nada, siquiera que se adelantó..."	
	"(su poder era de más de 9000!! era impresionante, no podía moverme, sólo la ví pasar... f )"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@1 arqueroSeLanzaEnDirección: 1@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test30DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAdentro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(y voló.. y me hizo volar... y yo volé de él...  pero acá por la arbolada... y el voló.. y se estrelló por acá por la pared...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 1@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test31DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAfuera
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(El caso auspiciado por el Pipita...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@1 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@3 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test32ArqueroQueEligeAntesDeTiroVsPlayeraAMatarAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:39:22 pm (UTC)'!
test33ArqueroQueEligeAntesDeTiroVsPlayeraAMatarNoAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
test34ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAMatarSiempreAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera y se adelanta ante una pelota playera lenta a matar, siempre la ataja sin importar nada..."	
	"(como la pelota es taaaan lentaaa, el arquero se puede ir a tomar un cafe, verse una serie, volver y aún atajar la pelota habiendose tirado a cualquier lado. Pero igual es más rapida que cuando se la tira a colocar, donde indefectiblemente el arbitro lo detecta...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !
