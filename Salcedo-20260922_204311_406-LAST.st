!classDefinition: #Ataque category: #'2026-2C-1erParcial'!
Object subclass: #Ataque
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!Ataque methodsFor: 'ataqueDirigido' stamp: 'gs 22/Sep/2026, 10:33:01 pm (UTC)'!
atacasUnCamion: unVehiculo conducidoPor: unAutomovilista queSeProtegeCon: cartaDeSeguridad

	self subclassResponsibility! !

!Ataque methodsFor: 'ataqueDirigido' stamp: 'gs 22/Sep/2026, 10:34:04 pm (UTC)'!
atacasUnDeportivo: unVehiculo conducidoPor: unAutomovilista queSeProtegeCon: cartaDeSeguridad

	self subclassResponsibility! !


!classDefinition: #Accidente category: #'2026-2C-1erParcial'!
Ataque subclass: #Accidente
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!Accidente methodsFor: 'ataqueDirigido' stamp: 'gs 22/Sep/2026, 10:35:42 pm (UTC)'!
atacasUnCamion: unVehiculo conducidoPor: unAutomovilista queSeProtegeCon: cartaDeSeguridad
	
	cartaDeSeguridad protegesDeAccidenteAUnCamion: unVehiculo conducidoPor: unAutomovilista.
	
	! !

!Accidente methodsFor: 'ataqueDirigido' stamp: 'gs 22/Sep/2026, 10:37:31 pm (UTC)'!
atacasUnDeportivo: unVehiculo conducidoPor: unAutomovilista queSeProtegeCon: cartaDeSeguridad
	
	cartaDeSeguridad protegesDeAccidenteAUnDeportivo: unVehiculo conducidoPor: unAutomovilista.
! !


!classDefinition: #LimiteDeVelocidad category: #'2026-2C-1erParcial'!
Ataque subclass: #LimiteDeVelocidad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!LimiteDeVelocidad methodsFor: 'ataqueDirigido' stamp: 'gs 22/Sep/2026, 11:29:31 pm (UTC)'!
atacasUnCamion: unVehiculo conducidoPor: unAutomovilista queSeProtegeCon: cartaDeSeguridad
	
	"No pasa nada"
	
	
	"cartaDeSeguridad protegesDeLimiteDeVelocidadAUnCamionConducidoPor: unAutomovilista."
	
	"me lo ahorro ...."! !

!LimiteDeVelocidad methodsFor: 'ataqueDirigido' stamp: 'gs 22/Sep/2026, 10:38:42 pm (UTC)'!
atacasUnDeportivo: unVehiculo conducidoPor: unAutomovilista queSeProtegeCon: cartaDeSeguridad
	
	cartaDeSeguridad protegesDeLimiteDeVelocidadAUnDeportivo: unVehiculo conducidoPor: unAutomovilista.
	
! !


!classDefinition: #Automovilista category: #'2026-2C-1erParcial'!
Object subclass: #Automovilista
	instanceVariableNames: 'vehiculo cartaDeSeguridad puntosAcumulados cartasValidas'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!Automovilista methodsFor: 'init' stamp: 'gs 22/Sep/2026, 10:42:33 pm (UTC)'!
initializeInitializeAlVolanteDe: unVehiculo conCartaDeSeguridad: unaCartaDeSeguridad 
	
	vehiculo := unVehiculo.
	cartaDeSeguridad := unaCartaDeSeguridad.
	
	
	puntosAcumulados := 0.
	
	
	cartasValidas := {25*milla.  50 *milla. 75 *milla. 100 *milla. 200 *milla.} asOrderedCollection. ! !


!Automovilista methodsFor: 'tests' stamp: 'gs 22/Sep/2026, 10:27:41 pm (UTC)'!
estaAccidentado
	
	^ vehiculo estasAccidentado. ! !

!Automovilista methodsFor: 'tests' stamp: 'gs 22/Sep/2026, 10:19:31 pm (UTC)'!
millasRecorridas
	
	^ vehiculo distanciaRecorrida ! !

!Automovilista methodsFor: 'tests' stamp: 'gs 22/Sep/2026, 8:43:26 pm (UTC)'!
puntosAcumulados
	
	^ puntosAcumulados ! !


!Automovilista methodsFor: 'jugar carta' stamp: 'gs 22/Sep/2026, 11:30:03 pm (UTC)'!
jugasCartaDe: unaCarta 
	
	self validarCarta: unaCarta returningWith: [ :res | ^ res ].
	
	vehiculo recibisEstaCartaDeDistancia: unaCarta.! !

!Automovilista methodsFor: 'jugar carta' stamp: 'gs 22/Sep/2026, 11:30:02 pm (UTC)'!
validarCarta: unaCarta returningWith: aReturningBlock

	(cartasValidas includes: unaCarta) ifFalse: [^ aReturningBlock value: (self error: self class cartaDeDistanciaInvalidaDescripcionDeError)]! !


!Automovilista methodsFor: 'recibis ataque' stamp: 'gs 22/Sep/2026, 10:29:32 pm (UTC)'!
recibisUnAtaque: unAtaque 
	
	vehiculo conducidoPor: self recibimosAtaque: unAtaque yMeProtejoCon: cartaDeSeguridad.
	! !


!Automovilista methodsFor: 'efectos' stamp: 'gs 22/Sep/2026, 10:06:17 pm (UTC)'!
sumasPuntos: unaCantidadDePuntos
	
	puntosAcumulados := puntosAcumulados + unaCantidadDePuntos. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Automovilista class' category: #'2026-2C-1erParcial'!
Automovilista class
	instanceVariableNames: ''!

!Automovilista class methodsFor: 'descripciones de error' stamp: 'ARM 21/Sep/2026, 7:12:46 pm (UTC)'!
accidentadoNoPuedeAvanzarDescripcionDeError

	^ 'Un automovilista accidentado no puede avanzar'! !

!Automovilista class methodsFor: 'descripciones de error' stamp: 'ARM 21/Sep/2026, 7:14:04 pm (UTC)'!
cartaDeDistanciaInvalidaDescripcionDeError

	^ 'Las cartas de distancia son de 25, 50, 75, 100 o 200 millas'! !


!Automovilista class methodsFor: 'instance creation' stamp: 'gs 22/Sep/2026, 8:25:01 pm (UTC)'!
initializeAlVolanteDe: unVehiculo conCartaDeSeguridad: unaCartaDeSeguridad 
	
	^self new initializeInitializeAlVolanteDe: unVehiculo conCartaDeSeguridad: unaCartaDeSeguridad ! !


!classDefinition: #CartaDeSeguridad category: #'2026-2C-1erParcial'!
Object subclass: #CartaDeSeguridad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!CartaDeSeguridad methodsFor: 'proteccion' stamp: 'gs 22/Sep/2026, 10:35:32 pm (UTC)'!
protegesDeAccidenteAUnCamion: unVehiculo conducidoPor: unAutomovilista

	self subclassResponsibility! !

!CartaDeSeguridad methodsFor: 'proteccion' stamp: 'gs 22/Sep/2026, 10:37:26 pm (UTC)'!
protegesDeAccidenteAUnDeportivo: unVehiculo conducidoPor: unAutomovilista

	self subclassResponsibility! !

!CartaDeSeguridad methodsFor: 'proteccion' stamp: 'gs 22/Sep/2026, 9:48:13 pm (UTC)'!
protegesDeLimiteDeVelocidadAUnCamionConducidoPor: unAutomovilista

	self subclassResponsibility! !

!CartaDeSeguridad methodsFor: 'proteccion' stamp: 'gs 22/Sep/2026, 10:38:42 pm (UTC)'!
protegesDeLimiteDeVelocidadAUnDeportivo: unVehiculo conducidoPor: unAutomovilista

	self subclassResponsibility! !


!classDefinition: #CartaDeSeguridadAsDelVolante category: #'2026-2C-1erParcial'!
CartaDeSeguridad subclass: #CartaDeSeguridadAsDelVolante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!CartaDeSeguridadAsDelVolante methodsFor: 'proteccion' stamp: 'gs 22/Sep/2026, 10:54:30 pm (UTC)'!
protegesDeAccidenteAUnCamion: unVehiculo conducidoPor: unAutomovilista
	
	unAutomovilista sumasPuntos: 300.
! !

!CartaDeSeguridadAsDelVolante methodsFor: 'proteccion' stamp: 'gs 22/Sep/2026, 10:54:26 pm (UTC)'!
protegesDeAccidenteAUnDeportivo: unVehiculo conducidoPor: unAutomovilista
	
	unAutomovilista sumasPuntos: 300.
! !

!CartaDeSeguridadAsDelVolante methodsFor: 'proteccion' stamp: 'gs 22/Sep/2026, 9:55:36 pm (UTC)'!
protegesDeLimiteDeVelocidadAUnCamionConducidoPor: unAutomovilista
	
	! !

!CartaDeSeguridadAsDelVolante methodsFor: 'proteccion' stamp: 'gs 22/Sep/2026, 10:54:22 pm (UTC)'!
protegesDeLimiteDeVelocidadAUnDeportivo: unVehiculo conducidoPor: unAutomovilista
	
	unVehiculo tenesLimiteDeVelocidad.
	! !


!classDefinition: #CartaDeSeguridadViaLibre category: #'2026-2C-1erParcial'!
CartaDeSeguridad subclass: #CartaDeSeguridadViaLibre
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!CartaDeSeguridadViaLibre methodsFor: 'proteccion' stamp: 'gs 22/Sep/2026, 10:54:51 pm (UTC)'!
protegesDeAccidenteAUnCamion: unVehiculo conducidoPor: unAutomovilista

	unVehiculo sufrisAccidente.
	
	! !

!CartaDeSeguridadViaLibre methodsFor: 'proteccion' stamp: 'gs 22/Sep/2026, 10:54:46 pm (UTC)'!
protegesDeAccidenteAUnDeportivo: unVehiculo conducidoPor: unAutomovilista
	
	unVehiculo sufrisAccidente.
	unVehiculo sufrisPerdidaDeMillas: 100*milla.
	! !

!CartaDeSeguridadViaLibre methodsFor: 'proteccion' stamp: 'gs 22/Sep/2026, 9:55:39 pm (UTC)'!
protegesDeLimiteDeVelocidadAUnCamionConducidoPor: unAutomovilista
	
	! !

!CartaDeSeguridadViaLibre methodsFor: 'proteccion' stamp: 'gs 22/Sep/2026, 10:54:40 pm (UTC)'!
protegesDeLimiteDeVelocidadAUnDeportivo: unVehiculo conducidoPor: unAutomovilista
	
	unAutomovilista sumasPuntos: 300.
	! !


!classDefinition: #EstadoDeLasPartesDeUnAuto category: #'2026-2C-1erParcial'!
Object subclass: #EstadoDeLasPartesDeUnAuto
	instanceVariableNames: 'auto'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!EstadoDeLasPartesDeUnAuto methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:24:21 pm (UTC)'!
initializeParaUnAuto: unAuto

	
	auto := unAuto ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeLasPartesDeUnAuto class' category: #'2026-2C-1erParcial'!
EstadoDeLasPartesDeUnAuto class
	instanceVariableNames: ''!

!EstadoDeLasPartesDeUnAuto class methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:23:58 pm (UTC)'!
for: unAuto
	
	^ self new initializeParaUnAuto: unAuto.! !


!classDefinition: #EstadoDelCuerpoDelAuto category: #'2026-2C-1erParcial'!
EstadoDeLasPartesDeUnAuto subclass: #EstadoDelCuerpoDelAuto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!EstadoDelCuerpoDelAuto methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:26:05 pm (UTC)'!
estasAccidentado

	self subclassResponsibility! !

!EstadoDelCuerpoDelAuto methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:11:09 pm (UTC)'!
recibiEstaCartaDeDistancia: unaCarta
	
	self subclassResponsibility ! !


!classDefinition: #EstadoDelCuerpoDelAutoDestruido category: #'2026-2C-1erParcial'!
EstadoDelCuerpoDelAuto subclass: #EstadoDelCuerpoDelAutoDestruido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!EstadoDelCuerpoDelAutoDestruido methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:26:42 pm (UTC)'!
estasAccidentado
	
	^ true! !

!EstadoDelCuerpoDelAutoDestruido methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:12:43 pm (UTC)'!
recibiEstaCartaDeDistancia: unaCarta 

	^ self error: Automovilista accidentadoNoPuedeAvanzarDescripcionDeError ! !


!classDefinition: #EstadoDelCuerpoDelAutoNoDestruido category: #'2026-2C-1erParcial'!
EstadoDelCuerpoDelAuto subclass: #EstadoDelCuerpoDelAutoNoDestruido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!EstadoDelCuerpoDelAutoNoDestruido methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:26:36 pm (UTC)'!
estasAccidentado
	
	^ false! !

!EstadoDelCuerpoDelAutoNoDestruido methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:13:11 pm (UTC)'!
recibiEstaCartaDeDistancia: unaCarta
	
	auto seJuegaEstaCartaDeDistancia: unaCarta! !


!classDefinition: #EstadoDelSpeedLimiterDelAuto category: #'2026-2C-1erParcial'!
EstadoDeLasPartesDeUnAuto subclass: #EstadoDelSpeedLimiterDelAuto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!EstadoDelSpeedLimiterDelAuto methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:26:12 pm (UTC)'!
estasLimitado

	self subclassResponsibility! !

!EstadoDelSpeedLimiterDelAuto methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:14:49 pm (UTC)'!
recibiEstaCartaDeDistancia: unaCarta
	
	self subclassResponsibility ! !


!classDefinition: #EstadoDelSpeedLimiterDelAutoLimitado category: #'2026-2C-1erParcial'!
EstadoDelSpeedLimiterDelAuto subclass: #EstadoDelSpeedLimiterDelAutoLimitado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!EstadoDelSpeedLimiterDelAutoLimitado methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:26:19 pm (UTC)'!
estasLimitado
	
	^ true! !

!EstadoDelSpeedLimiterDelAutoLimitado methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:18:15 pm (UTC)'!
recibiEstaCartaDeDistancia: unaCarta
	
	auto avanzasLimitado.
	 ! !


!classDefinition: #EstadoDelSpeedLimiterDelAutoNoLimitado category: #'2026-2C-1erParcial'!
EstadoDelSpeedLimiterDelAuto subclass: #EstadoDelSpeedLimiterDelAutoNoLimitado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!EstadoDelSpeedLimiterDelAutoNoLimitado methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:26:26 pm (UTC)'!
estasLimitado
	
	^ false! !

!EstadoDelSpeedLimiterDelAutoNoLimitado methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:18:48 pm (UTC)'!
recibiEstaCartaDeDistancia: unaCarta
	
	auto avanzasNormalmente: unaCarta.
	 ! !


!classDefinition: #Vehiculos category: #'2026-2C-1erParcial'!
Object subclass: #Vehiculos
	instanceVariableNames: 'distanciaRecorrida estadoDelCuerpo estadoDelLimiter'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!Vehiculos methodsFor: 'efectos' stamp: 'gs 22/Sep/2026, 11:39:26 pm (UTC)'!
sufrisAccidente
	
	
	estadoDelCuerpo := EstadoDelCuerpoDelAutoDestruido for: self.! !

!Vehiculos methodsFor: 'efectos' stamp: 'gs 22/Sep/2026, 10:21:53 pm (UTC)'!
sufrisPerdidaDeMillas: unaCantidadDeMillasPerdidas
	
	distanciaRecorrida := (distanciaRecorrida - (100*milla)) max: (0*milla).! !

!Vehiculos methodsFor: 'efectos' stamp: 'gs 22/Sep/2026, 11:39:56 pm (UTC)'!
tenesLimiteDeVelocidad
	
	estadoDelLimiter := EstadoDelSpeedLimiterDelAutoLimitado for: self.! !


!Vehiculos methodsFor: 'tests' stamp: 'gs 22/Sep/2026, 10:19:41 pm (UTC)'!
distanciaRecorrida
	
	^ distanciaRecorrida ! !

!Vehiculos methodsFor: 'tests' stamp: 'gs 22/Sep/2026, 11:26:57 pm (UTC)'!
estaLimitado
	
	^ estadoDelLimiter estasLimitado ! !

!Vehiculos methodsFor: 'tests' stamp: 'gs 22/Sep/2026, 11:27:01 pm (UTC)'!
estasAccidentado
	
	^ estadoDelCuerpo estasAccidentado ! !


!Vehiculos methodsFor: 'cartasDeDistancia' stamp: 'gs 22/Sep/2026, 11:25:14 pm (UTC)'!
recibisEstaCartaDeDistancia: unaCarta

	estadoDelCuerpo recibiEstaCartaDeDistancia: unaCarta.
	

	! !

!Vehiculos methodsFor: 'cartasDeDistancia' stamp: 'gs 22/Sep/2026, 10:25:54 pm (UTC)'!
seJuegaEstaCartaDeDistancia: unaCarta

	self subclassResponsibility! !


!Vehiculos methodsFor: 'init' stamp: 'gs 22/Sep/2026, 11:40:11 pm (UTC)'!
initialize
	
	distanciaRecorrida := 0*milla.
	
	estadoDelCuerpo := EstadoDelCuerpoDelAutoNoDestruido for: self.
	
	estadoDelLimiter := EstadoDelSpeedLimiterDelAutoNoLimitado for: self.! !


!Vehiculos methodsFor: 'avanzar' stamp: 'gs 22/Sep/2026, 11:32:52 pm (UTC)'!
avanzarEstasMillas: unasMillas

	distanciaRecorrida := distanciaRecorrida + unasMillas ! !


!Vehiculos methodsFor: 'recibo de ataques' stamp: 'gs 22/Sep/2026, 9:25:42 pm (UTC)'!
conducidoPor: unAutomovilista recibimosAtaque: unAtaque yMeProtejoCon: cartaDeSeguridad

	self subclassResponsibility! !


!classDefinition: #Camion category: #'2026-2C-1erParcial'!
Vehiculos subclass: #Camion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!Camion methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 10:33:01 pm (UTC)'!
conducidoPor: unAutomovilista recibimosAtaque: unAtaque yMeProtejoCon: cartaDeSeguridad
	
	unAtaque atacasUnCamion: self conducidoPor: unAutomovilista queSeProtegeCon: cartaDeSeguridad
	
! !

!Camion methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:32:37 pm (UTC)'!
seJuegaEstaCartaDeDistancia: unaCarta
	
	
	self avanzarEstasMillas: (unaCarta min: (100*milla)).! !


!classDefinition: #Deportivo category: #'2026-2C-1erParcial'!
Vehiculos subclass: #Deportivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!Deportivo methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 10:34:04 pm (UTC)'!
conducidoPor: unAutomovilista recibimosAtaque: unAtaque yMeProtejoCon: cartaDeSeguridad
	
	unAtaque atacasUnDeportivo: self conducidoPor: unAutomovilista queSeProtegeCon: cartaDeSeguridad.
	
! !

!Deportivo methodsFor: 'as yet unclassified' stamp: 'gs 22/Sep/2026, 11:28:36 pm (UTC)'!
seJuegaEstaCartaDeDistancia: unaCarta
	
	estadoDelLimiter recibiEstaCartaDeDistancia: unaCarta.
	
! !


!Deportivo methodsFor: 'limiter' stamp: 'gs 22/Sep/2026, 11:34:00 pm (UTC)'!
avanzasLimitado
	
	
	self avanzarEstasMillas: (25*milla)
	! !

!Deportivo methodsFor: 'limiter' stamp: 'gs 22/Sep/2026, 11:34:04 pm (UTC)'!
avanzasNormalmente: unaCarta
	
	
	self avanzarEstasMillas: unaCarta *2.! !


!classDefinition: #MilMillasTest category: #'2026-2C-1erParcial'!
TestCase subclass: #MilMillasTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2C-1erParcial'!

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 3:46:57 pm (UTC)'!
test01ElDeportivoAvanzaElDobleDeLaCarta

	| automovilista |
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self deportivo conCartaDeSeguridad: self asDelVolante.

	self assert: 0 * milla equals: (self millasRecorridasPor: automovilista).
	self assert: 0 equals: (self puntosAcumuladosPor: automovilista).
	
	self jugarCartaDe: 100 * milla para: automovilista.
	
	self assert: 200 * milla equals: (self millasRecorridasPor: automovilista)! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 3:49:10 pm (UTC)'!
test02AlCamionNingunaCartaLeValeMasDe100

	| automovilista |
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self camion conCartaDeSeguridad: self viaLibre.

	self jugarCartaDe: 200 * milla para: automovilista.

	self assert: 100 * milla equals: (self millasRecorridasPor: automovilista).
	
	self jugarCartaDe: 50 * milla para: automovilista.
	self assert: 150 * milla equals: (self millasRecorridasPor: automovilista)! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 3:50:17 pm (UTC)'!
test03SoloExistenCartasDe25De50De75De100YDe200

	| automovilista |
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self deportivo conCartaDeSeguridad: self asDelVolante.
	
	self 
		should: [ self jugarCartaDe: 30 * milla para: automovilista ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :error |
			self assert: Automovilista cartaDeDistanciaInvalidaDescripcionDeError equals: error messageText.
			self assert: 0 * milla equals: (self millasRecorridasPor: automovilista) ]! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 3:52:05 pm (UTC)'!
test04ElAsDelVolanteAnulaElAccidente

	| automovilista |
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self deportivo conCartaDeSeguridad: self asDelVolante.
	
	self atacarCon: self accidente a: automovilista.
	
	self deny: (self estaAccidentado: automovilista).
	self assert: 300 equals: (self puntosAcumuladosPor: automovilista).
	
	self jugarCartaDe: 100 * milla para: automovilista.
	self assert: 200 * milla equals: (self millasRecorridasPor: automovilista)! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 3:52:38 pm (UTC)'!
test05ElAccidenteRompeAlDeportivo

	| automovilista |
	
	"La vía libre no sirve contra el accidente. El deportivo queda accidentado y pierde 100 millas."
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self deportivo conCartaDeSeguridad: self viaLibre.
	
	self jugarCartaDe: 100 * milla para: automovilista.
	
	self atacarCon: self accidente a: automovilista.
	
	self assert: (self estaAccidentado: automovilista).
	self assert: 100 * milla equals: (self millasRecorridasPor: automovilista).
	self assert: 0 equals: (self puntosAcumuladosPor: automovilista).
	
	self 
		should: [ self jugarCartaDe: 25 * milla para: automovilista. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :error |
			self assert: Automovilista accidentadoNoPuedeAvanzarDescripcionDeError equals: error messageText.
			self assert: 100 * milla equals: (self millasRecorridasPor: automovilista) ]! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 3:54:27 pm (UTC)'!
test06ElDeportivoAccidentadoNoQuedaConMillasNegativas

	| automovilista |

	automovilista := self nuevoAutomovilistaAlVolanteDe: self deportivo conCartaDeSeguridad: self viaLibre.

	self jugarCartaDe: 25 * milla para: automovilista.

	self atacarCon: self accidente a: automovilista.
	
	self assert: 0 * milla equals: (self millasRecorridasPor: automovilista)! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 3:56:20 pm (UTC)'!
test07ElCamionAguantaElAccidente

	| automovilista |
	
	"Queda accidentado pero no pierde millas"
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self camion conCartaDeSeguridad: self viaLibre.
	self jugarCartaDe: 100 * milla para: automovilista.
	
	self atacarCon: self accidente a: automovilista.
	
	self assert: (self estaAccidentado: automovilista).
	self assert: 100 * milla equals: (self millasRecorridasPor: automovilista).
	self 
		should: [ self jugarCartaDe: 100 * milla para: automovilista ]
		raise: Error - MessageNotUnderstood
		withMessageText: Automovilista accidentadoNoPuedeAvanzarDescripcionDeError! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 3:58:35 pm (UTC)'!
test08ElAsDelVolanteTambienSirveEnElCamion

	| automovilista |
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self camion conCartaDeSeguridad: self asDelVolante.

	self atacarCon: self accidente a: automovilista.

	self jugarCartaDe: 200 * milla para: automovilista.

	self deny: (self estaAccidentado: automovilista).
	self assert: 300 equals: (self puntosAcumuladosPor: automovilista).
	self assert: 100 * milla equals: (self millasRecorridasPor: automovilista)! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 3:59:31 pm (UTC)'!
test09LaViaLibreAnulaElLimiteDeVelocidad

	| automovilista |
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self deportivo conCartaDeSeguridad: self viaLibre.

	self atacarCon: self limiteDeVelocidad a: automovilista.
	
	self jugarCartaDe: 100 * milla para: automovilista.
	
	self assert: 300 equals: (self puntosAcumuladosPor: automovilista).
	self assert: 200 * milla equals: (self millasRecorridasPor: automovilista)! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 4:00:33 pm (UTC)'!
test10ElDeportivoBajoLimiteDeVelocidadAvanzaDeA25

	| automovilista |
	
	"El as del volante no sirve contra el límite"
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self deportivo conCartaDeSeguridad: self asDelVolante.
	
	self atacarCon: self limiteDeVelocidad a: automovilista.
	self assert: 0 equals: (self puntosAcumuladosPor: automovilista).
	
	self jugarCartaDe: 100 * milla para: automovilista.
	self assert: 25 * milla equals: (self millasRecorridasPor: automovilista).
	
	self jugarCartaDe: 25 * milla para: automovilista.
	self assert: 50 * milla equals: (self millasRecorridasPor: automovilista)! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 4:01:09 pm (UTC)'!
test11AlCamionElLimiteDeVelocidadNoLeCambiaNada

	| automovilista |
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self camion conCartaDeSeguridad: self asDelVolante.

	self atacarCon: self limiteDeVelocidad a: automovilista.
	self assert: 0 equals: (self puntosAcumuladosPor: automovilista).
	
	self jugarCartaDe: 200 * milla para: automovilista.
	self jugarCartaDe: 100 * milla para: automovilista.

	self assert: 200 * milla equals: (self millasRecorridasPor: automovilista)! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 4:02:29 pm (UTC)'!
test12EnElCamionLaViaLibreNoTieneNadaQueAnular

	| automovilista |
	
	"Como el límite no le cambia nada al camión, tampoco hay contraataque"
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self camion conCartaDeSeguridad: self viaLibre.

	self atacarCon: self limiteDeVelocidad a: automovilista.
	self assert: 0 equals: (self puntosAcumuladosPor: automovilista).
	
	self jugarCartaDe: 200 * milla para: automovilista.
	self assert: 100 * milla equals: (self millasRecorridasPor: automovilista)! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 4:03:47 pm (UTC)'!
test13LimiteYDespuesAccidente

	| automovilista |
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self deportivo conCartaDeSeguridad: self asDelVolante.
	
	self atacarCon: self limiteDeVelocidad a: automovilista.
	self atacarCon: self accidente a: automovilista.
	
	self deny: (self estaAccidentado: automovilista).
	self assert: 300 equals: (self puntosAcumuladosPor: automovilista).
	
	self jugarCartaDe: 100 * milla para: automovilista.
	self assert: 25 * milla equals: (self millasRecorridasPor: automovilista)! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 4:05:39 pm (UTC)'!
test14AccidenteYDespuesLimite

	| automovilista |
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self deportivo conCartaDeSeguridad: self viaLibre.

	self atacarCon: self accidente a: automovilista.
	self atacarCon: self limiteDeVelocidad a: automovilista.

	self assert: (self estaAccidentado: automovilista).
	self assert: 300 equals: (self puntosAcumuladosPor: automovilista).
	self 
		should: [ self jugarCartaDe: 25 * milla para: automovilista ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :error |
			self assert: Automovilista accidentadoNoPuedeAvanzarDescripcionDeError equals: error messageText.
			self assert: 0 * milla equals: (self millasRecorridasPor: automovilista) ]! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 4:06:26 pm (UTC)'!
test15AlCamionAccidentadoElLimiteDeVelocidadTampocoLeProduceNada

	| automovilista |
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self camion conCartaDeSeguridad: self viaLibre.
	self jugarCartaDe: 100 * milla para: automovilista.
	
	self atacarCon: self accidente a: automovilista.
	self atacarCon: self limiteDeVelocidad a: automovilista.
	
	self assert: (self estaAccidentado: automovilista).
	self assert: 100 * milla equals: (self millasRecorridasPor: automovilista).
	self assert: 0 equals: (self puntosAcumuladosPor: automovilista).
	
	self 
		should: [ self jugarCartaDe: 25 * milla para: automovilista ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :error |
			self assert: Automovilista accidentadoNoPuedeAvanzarDescripcionDeError equals: error messageText.
			self assert: 100 * milla equals: (self millasRecorridasPor: automovilista) ]! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 4:07:06 pm (UTC)'!
test16LosContraataquesSeSuman

	| automovilista |
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self deportivo conCartaDeSeguridad: self asDelVolante.
	
	self atacarCon: self accidente a: automovilista.
	self atacarCon: self accidente a: automovilista.
	
	self assert: 600 equals: (self puntosAcumuladosPor: automovilista)! !

!MilMillasTest methodsFor: 'tests' stamp: 'ARM 22/Sep/2026, 4:08:35 pm (UTC)'!
test17DosAccidentesSeguidosLeHacenPerder200MillasAlDeportivo

	| automovilista |
	
	automovilista := self nuevoAutomovilistaAlVolanteDe: self deportivo conCartaDeSeguridad: self viaLibre.
	self jugarCartaDe: 200 * milla para: automovilista.
	
	self atacarCon: self accidente a: automovilista.
	self atacarCon: self accidente a: automovilista.
	
	self assert: (self estaAccidentado: automovilista).
	self assert: 200 * milla equals: (self millasRecorridasPor: automovilista).
	self assert: 0 equals: (self puntosAcumuladosPor: automovilista)! !


!MilMillasTest methodsFor: 'vehiculos' stamp: 'gs 22/Sep/2026, 9:57:34 pm (UTC)'!
camion

	^ Camion new.! !

!MilMillasTest methodsFor: 'vehiculos' stamp: 'gs 22/Sep/2026, 9:57:28 pm (UTC)'!
deportivo

	^Deportivo new.! !


!MilMillasTest methodsFor: 'seguridades' stamp: 'gs 22/Sep/2026, 11:40:32 pm (UTC)'!
asDelVolante

	^ CartaDeSeguridadAsDelVolante new.! !

!MilMillasTest methodsFor: 'seguridades' stamp: 'gs 22/Sep/2026, 11:40:39 pm (UTC)'!
viaLibre

	^ CartaDeSeguridadViaLibre new.! !


!MilMillasTest methodsFor: 'creacion' stamp: 'gs 22/Sep/2026, 8:24:52 pm (UTC)'!
nuevoAutomovilistaAlVolanteDe: unVehiculo conCartaDeSeguridad: unaCartaDeSeguridad 
	
	^ Automovilista initializeAlVolanteDe: unVehiculo conCartaDeSeguridad: unaCartaDeSeguridad 	! !


!MilMillasTest methodsFor: 'ataques' stamp: 'gs 22/Sep/2026, 9:56:51 pm (UTC)'!
accidente

	^ Accidente new.! !

!MilMillasTest methodsFor: 'ataques' stamp: 'gs 22/Sep/2026, 9:56:59 pm (UTC)'!
limiteDeVelocidad

	^ LimiteDeVelocidad new.! !


!MilMillasTest methodsFor: 'consultas' stamp: 'gs 22/Sep/2026, 8:42:52 pm (UTC)'!
estaAccidentado: unAutomovilista

	^ unAutomovilista estaAccidentado.! !

!MilMillasTest methodsFor: 'consultas' stamp: 'gs 22/Sep/2026, 8:26:31 pm (UTC)'!
millasRecorridasPor: unAutomovilista

	^ unAutomovilista millasRecorridas! !

!MilMillasTest methodsFor: 'consultas' stamp: 'gs 22/Sep/2026, 8:27:12 pm (UTC)'!
puntosAcumuladosPor: unAutomovilista

	^ unAutomovilista puntosAcumulados! !


!MilMillasTest methodsFor: 'acciones' stamp: 'gs 22/Sep/2026, 8:39:06 pm (UTC)'!
atacarCon: unAtaque a: unAutomovilista

	unAutomovilista recibisUnAtaque: unAtaque.! !

!MilMillasTest methodsFor: 'acciones' stamp: 'gs 22/Sep/2026, 8:28:14 pm (UTC)'!
jugarCartaDe: unaCarta para: unAutomovilista

	unAutomovilista jugasCartaDe: unaCarta ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MilMillasTest class' category: #'2026-2C-1erParcial'!
MilMillasTest class
	instanceVariableNames: ''!

!MilMillasTest class methodsFor: 'class initialization' stamp: 'ARM 22/Sep/2026, 2:07:26 pm (UTC)'!
initialize

	Smalltalk at: #milla put: (BaseUnit named: 'milla')! !

MilMillasTest initialize!