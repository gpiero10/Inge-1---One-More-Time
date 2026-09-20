!classDefinition: #EscapeDeFlota category: 'Smugglers Run'!
Object subclass: #EscapeDeFlota
	instanceVariableNames: 'flota'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Smugglers Run'!

!EscapeDeFlota methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 11:39:26 pm (UTC)'!
assertCorrectitudDeSectores: sectoresAAtravesar returningWith: aReturningBlock

	(sectoresAAtravesar size = 0) 
	ifTrue: [^ aReturningBlock value: (self error: self class rutaVaciaDescripcionDeError)].
	
	(sectoresAAtravesar asSet size < sectoresAAtravesar size )
	ifTrue: [^ aReturningBlock value: 
		(self error: self class sectoresRepetidosDescripcionDeError)]! !

!EscapeDeFlota methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 1:48:32 am (UTC)'!
atravesar: sectoresAAtravesar 

	self assertCorrectitudDeSectores: sectoresAAtravesar returningWith: [ :res | ^ res ].
	
	flota do: [:nave | sectoresAAtravesar do: 
		[:unSector | nave atravesandoSector: unSector ]].
	
	flota := flota select: [:nave | nave haSobrevivido ].
	! !

!EscapeDeFlota methodsFor: 'as yet unclassified' stamp: 'gs 11/Sep/2026, 6:58:59 pm (UTC)'!
haSobrevivido: aNave 
	^ flota includes: aNave. ! !

!EscapeDeFlota methodsFor: 'as yet unclassified' stamp: 'gs 11/Sep/2026, 6:16:35 pm (UTC)'!
initializeWithFlota: unaFlota 
	flota := unaFlota ! !

!EscapeDeFlota methodsFor: 'as yet unclassified' stamp: 'HAW 19/Sep/2026, 11:39:36 pm (UTC)'!
numeroDeSobrevivientesEs: aSmallInteger 
	
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EscapeDeFlota class' category: 'Smugglers Run'!
EscapeDeFlota class
	instanceVariableNames: ''!

!EscapeDeFlota class methodsFor: 'message error' stamp: 'NR 28/Sep/2025, 3:38:12 am (UTC)'!
flotaSinNavesDescripcionDeError

	^ 'La flota no puede estar vacia'! !

!EscapeDeFlota class methodsFor: 'message error' stamp: 'NR 28/Sep/2025, 3:38:25 am (UTC)'!
rutaVaciaDescripcionDeError

	^ 'La ruta no puede ser vacia'! !

!EscapeDeFlota class methodsFor: 'message error' stamp: 'NR 28/Sep/2025, 3:40:29 am (UTC)'!
sectoresRepetidosDescripcionDeError

	^ 'La ruta no puede tener sectores repetidos'! !

!EscapeDeFlota class methodsFor: 'message error' stamp: 'NR 28/Sep/2025, 3:38:52 am (UTC)'!
todasLasNavesDebenSerDiferentesDescripcionDeError

	^ 'Todas las naves de la flota deben ser unicas'! !


!EscapeDeFlota class methodsFor: 'instance creation' stamp: 'gs 11/Sep/2026, 6:15:42 pm (UTC)'!
enrolar: anArray 
	anArray size = 0 ifTrue: [^self error: self flotaSinNavesDescripcionDeError].
	anArray size > anArray asSet size ifTrue: [^self error: self todasLasNavesDebenSerDiferentesDescripcionDeError].
	
	^ self new initializeWithFlota: anArray ! !


!classDefinition: #Nave category: 'Smugglers Run'!
Object subclass: #Nave
	instanceVariableNames: 'tipo propulsor combustible nivelDeCasco manubrio escudos nivelDeCascoInicial'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Smugglers Run'!

!Nave methodsFor: 'init' stamp: 'HAW 19/Sep/2026, 11:19:37 pm (UTC)'!
initializeNaveconPropulsor: unTipoDePropulsor unaManiobravilidad: unaManiobravilidad
 unaCantidadDeEscudos: unosEscudos unCasco: unaCantidadDeCasco yUnaCantidadDeNafta: unaCantDeNafta
	
	combustible := unaCantDeNafta .
	nivelDeCasco := unaCantidadDeCasco .
	manubrio := unaManiobravilidad .
	escudos := unosEscudos .
	propulsor := unTipoDePropulsor.
	
	nivelDeCascoInicial := unaCantidadDeCasco. "intocable, para la comparacion" ! !


!Nave methodsFor: 'exec' stamp: 'HAW 20/Sep/2026, 1:42:28 am (UTC)'!
atravesandoSector: aSectorGalactico 
	combustible := combustible -10.
	
	propulsor atravieso: self unSectorGalactico: aSectorGalactico. 

	! !

!Nave methodsFor: 'exec' stamp: 'HAW 19/Sep/2026, 11:32:07 pm (UTC)'!
dañada

	^ nivelDeCasco < nivelDeCascoInicial ! !

!Nave methodsFor: 'exec' stamp: 'gs 11/Sep/2026, 7:30:35 pm (UTC)'!
destruida
	^nivelDeCasco < 0! !

!Nave methodsFor: 'exec' stamp: 'HAW 19/Sep/2026, 5:49:35 pm (UTC)'!
haSobrevivido
	^ combustible >= 0 and: (nivelDeCasco >= 0)! !

!Nave methodsFor: 'exec' stamp: 'HAW 19/Sep/2026, 11:31:48 pm (UTC)'!
nivelDeDañoEs: unNivelDeDaño 
	^ unNivelDeDaño  = (nivelDeCascoInicial - nivelDeCasco )! !

!Nave methodsFor: 'exec' stamp: 'gs 11/Sep/2026, 7:07:44 pm (UTC)'!
sinCombustible
	^combustible <= 0 ! !

!Nave methodsFor: 'exec' stamp: 'gs 11/Sep/2026, 6:12:13 pm (UTC)'!
valorCombustible: unValorEsperadoDeCombustible 
	^combustible = unValorEsperadoDeCombustible ! !


!Nave methodsFor: 'excudos' stamp: 'HAW 19/Sep/2026, 11:32:22 pm (UTC)'!
fuerzaDeEscudosEn: unaFuerzaDeEscudosEsperada

	^ escudos  = unaFuerzaDeEscudosEsperada ! !


!Nave methodsFor: 'interaccion entorno' stamp: 'HAW 20/Sep/2026, 1:03:46 am (UTC)'!
atravesasteSectorDeAsteroidesALaVelocidadDeLaLuz
	
	escudos := 0.
	self sufrirDaño.! !

!Nave methodsFor: 'interaccion entorno' stamp: 'HAW 20/Sep/2026, 1:30:41 am (UTC)'!
consumisEsteCombustible: unConsumo
 
		
	combustible := combustible - unConsumo.
	! !

!Nave methodsFor: 'interaccion entorno' stamp: 'HAW 20/Sep/2026, 12:55:18 am (UTC)'!
sufrirDaño
	nivelDeCasco := nivelDeCasco - 1! !

!Nave methodsFor: 'interaccion entorno' stamp: 'HAW 20/Sep/2026, 12:52:54 am (UTC)'!
sufrisDañoDeEscudosEn: unDaño
	
	escudos := escudos - unDaño ! !

!Nave methodsFor: 'interaccion entorno' stamp: 'HAW 20/Sep/2026, 1:26:13 am (UTC)'!
sufrisPertubacionEnEscudos: unDaño
	
	escudos := escudos *unDaño ! !

!Nave methodsFor: 'interaccion entorno' stamp: 'HAW 20/Sep/2026, 1:43:40 am (UTC)'!
sufrisPertubacionEnManubrio: unaPerturbacion 
	
	manubrio := manubrio * unaPerturbacion ! !

!Nave methodsFor: 'interaccion entorno' stamp: 'HAW 20/Sep/2026, 1:00:34 am (UTC)'!
tuManubrioEnfrentaEstaGravedad: gravedad.
		
	(gravedad >  manubrio ) ifTrue: [self sufrirDaño].
! !

!Nave methodsFor: 'interaccion entorno' stamp: 'HAW 20/Sep/2026, 12:55:03 am (UTC)'!
tusEscudosEnfrentanEstaRadiacion: unaRadiacion
	
	(escudos < unaRadiacion) ifTrue: [self sufrirDaño.]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Nave class' category: 'Smugglers Run'!
Nave class
	instanceVariableNames: ''!

!Nave class methodsFor: 'instance creation' stamp: 'HAW 19/Sep/2026, 11:11:30 pm (UTC)'!
conPropulsor: unTipoDePropulsor conManiobravilidad: unaManiobravilidad conEscudos: unosEscudos unNivelDeCasco: unaCantidadDeCasco yUnaCantidadDeCombustible: unaCantDeNafta
	
	^ self new initializeNaveconPropulsor: unTipoDePropulsor 
		unaManiobravilidad: unaManiobravilidad
		unaCantidadDeEscudos: unosEscudos
		unCasco: unaCantidadDeCasco
		yUnaCantidadDeNafta: unaCantDeNafta. ! !

!Nave class methodsFor: 'instance creation' stamp: 'HAW 19/Sep/2026, 11:23:07 pm (UTC)'!
initializeNaveContrabandistaConTipoDePropulsor: unPropulsor
	
	^ self conPropulsor: unPropulsor conManiobravilidad: 70 conEscudos: 50 
	unNivelDeCasco: 2 yUnaCantidadDeCombustible: 95
! !

!Nave class methodsFor: 'instance creation' stamp: 'HAW 19/Sep/2026, 11:22:57 pm (UTC)'!
initializeNaveCruceroConTipoDePropulsor: unPropulsor
	
	^ self conPropulsor: unPropulsor conManiobravilidad: 50 conEscudos: 100 
	unNivelDeCasco: 5 yUnaCantidadDeCombustible: 50
	
	! !

!Nave class methodsFor: 'instance creation' stamp: 'HAW 19/Sep/2026, 11:27:29 pm (UTC)'!
initializeNaveInterceptorConTipoDePropulsor: unPropulsor
	
	^ self conPropulsor: unPropulsor conManiobravilidad: 90 conEscudos: 30 
	unNivelDeCasco: 2 yUnaCantidadDeCombustible: 30
	
	! !


!classDefinition: #PropulsorDeNave category: 'Smugglers Run'!
Object subclass: #PropulsorDeNave
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Smugglers Run'!

!PropulsorDeNave methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 12:14:18 am (UTC)'!
atravieso: unaNave unSectorGalactico: aSectorGalactico

	self subclassResponsibility! !


!classDefinition: #PropulsorEstandar category: 'Smugglers Run'!
PropulsorDeNave subclass: #PropulsorEstandar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Smugglers Run'!

!PropulsorEstandar methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 1:31:29 am (UTC)'!
atravieso: unaNave unSectorGalactico: aSectorGalactico 
	
	aSectorGalactico teAtraviesaUnaNaveConPropulsorEstandar: unaNave. ! !


!classDefinition: #PropulsorGravitones category: 'Smugglers Run'!
PropulsorDeNave subclass: #PropulsorGravitones
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Smugglers Run'!

!PropulsorGravitones methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 1:31:41 am (UTC)'!
atravieso: unaNave unSectorGalactico: aSectorGalactico 

	aSectorGalactico teAtraviesaUnaNaveConPropulsorGravitones: unaNave. ! !


!classDefinition: #PropulsorVelocidadDeLuz category: 'Smugglers Run'!
PropulsorDeNave subclass: #PropulsorVelocidadDeLuz
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Smugglers Run'!

!PropulsorVelocidadDeLuz methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 1:32:09 am (UTC)'!
atravieso: unaNave unSectorGalactico: aSectorGalactico 
	
	aSectorGalactico teAtraviesaUnaNaveConPropulsorVelocidadLuz: unaNave. ! !


!classDefinition: #SectorGalactico category: 'Smugglers Run'!
Object subclass: #SectorGalactico
	instanceVariableNames: 'gravedad radiacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Smugglers Run'!

!SectorGalactico methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 12:30:10 pm (UTC)'!
conGravedad: unaGravedad yRadiacion: unaRadiacion 
	
	gravedad := unaGravedad.
	radiacion := unaRadiacion.​ 		! !



!SectorGalactico methodsFor: 'visitas' stamp: 'HAW 20/Sep/2026, 12:26:09 am (UTC)'!
teAtraviesaUnaNaveConPropulsorEstandar: unaNave

	self subclassResponsibility! !

!SectorGalactico methodsFor: 'visitas' stamp: 'HAW 20/Sep/2026, 12:27:08 am (UTC)'!
teAtraviesaUnaNaveConPropulsorGravitones: unaNave

	self subclassResponsibility! !

!SectorGalactico methodsFor: 'visitas' stamp: 'HAW 20/Sep/2026, 12:27:14 am (UTC)'!
teAtraviesaUnaNaveConPropulsorVelocidadLuz: unaNave

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SectorGalactico class' category: 'Smugglers Run'!
SectorGalactico class
	instanceVariableNames: ''!

!SectorGalactico class methodsFor: 'instance creation' stamp: 'HAW 20/Sep/2026, 1:35:45 am (UTC)'!
conGravedad: unaGravedad yRadiacion: unaRadiacion 
	
	^self new conGravedad: unaGravedad yRadiacion: unaRadiacion 
! !


!classDefinition: #SectorAsteroides category: 'Smugglers Run'!
SectorGalactico subclass: #SectorAsteroides
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Smugglers Run'!

!SectorAsteroides methodsFor: 'visitas' stamp: 'HAW 20/Sep/2026, 1:47:00 am (UTC)'!
teAtraviesaUnaNaveConPropulsorEstandar: unaNave
	
	unaNave sufrisDañoDeEscudosEn: 20; 
		tusEscudosEnfrentanEstaRadiacion: radiacion. 
	
! !

!SectorAsteroides methodsFor: 'visitas' stamp: 'HAW 20/Sep/2026, 1:46:38 am (UTC)'!
teAtraviesaUnaNaveConPropulsorGravitones: unaNave
	
	unaNave consumisEsteCombustible: 10; 
		tusEscudosEnfrentanEstaRadiacion: radiacion. 
	
! !

!SectorAsteroides methodsFor: 'visitas' stamp: 'HAW 20/Sep/2026, 1:46:47 am (UTC)'!
teAtraviesaUnaNaveConPropulsorVelocidadLuz: unaNave
	
	unaNave atravesasteSectorDeAsteroidesALaVelocidadDeLaLuz;
		tusEscudosEnfrentanEstaRadiacion: radiacion.
	
! !


!classDefinition: #SectorNebulosa category: 'Smugglers Run'!
SectorGalactico subclass: #SectorNebulosa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Smugglers Run'!

!SectorNebulosa methodsFor: 'visitas' stamp: 'HAW 20/Sep/2026, 1:47:30 am (UTC)'!
teAtraviesaUnaNaveConPropulsorEstandar: unaNave
	
	unaNave sufrisPertubacionEnEscudos: 0.7;
		tuManubrioEnfrentaEstaGravedad: gravedad; 
		tusEscudosEnfrentanEstaRadiacion: radiacion. 
	! !

!SectorNebulosa methodsFor: 'visitas' stamp: 'HAW 20/Sep/2026, 1:47:10 am (UTC)'!
teAtraviesaUnaNaveConPropulsorGravitones: unaNave
	
	unaNave consumisEsteCombustible: 20; 
		tuManubrioEnfrentaEstaGravedad: gravedad;
		tusEscudosEnfrentanEstaRadiacion: radiacion. 
		 
! !

!SectorNebulosa methodsFor: 'visitas' stamp: 'HAW 20/Sep/2026, 1:47:06 am (UTC)'!
teAtraviesaUnaNaveConPropulsorVelocidadLuz: unaNave
	
	unaNave consumisEsteCombustible: -10.
	
	! !


!classDefinition: #SectorPlanetario category: 'Smugglers Run'!
SectorGalactico subclass: #SectorPlanetario
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Smugglers Run'!

!SectorPlanetario methodsFor: 'visitas' stamp: 'HAW 20/Sep/2026, 1:47:57 am (UTC)'!
teAtraviesaUnaNaveConPropulsorEstandar: unaNave 

	unaNave tusEscudosEnfrentanEstaRadiacion: radiacion;
		tuManubrioEnfrentaEstaGravedad: gravedad.
	
	! !

!SectorPlanetario methodsFor: 'visitas' stamp: 'HAW 20/Sep/2026, 1:47:50 am (UTC)'!
teAtraviesaUnaNaveConPropulsorGravitones: unaNave
	
	unaNave sufrisPertubacionEnManubrio: 0.8; 
		tuManubrioEnfrentaEstaGravedad: gravedad.
	
! !

!SectorPlanetario methodsFor: 'visitas' stamp: 'HAW 20/Sep/2026, 1:47:39 am (UTC)'!
teAtraviesaUnaNaveConPropulsorVelocidadLuz: unaNave

	unaNave tuManubrioEnfrentaEstaGravedad: gravedad.
	! !


!classDefinition: #EscapeDeFlotaTests category: 'Smugglers Run'!
TestCase subclass: #EscapeDeFlotaTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Smugglers Run'!

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 10/Jul/2025, 10:58:18 pm (UTC)'!
test01LaFlotaDebeTenerAlMenosUnaNave
	
	self 
		should: [ EscapeDeFlota enrolar: {  } ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: EscapeDeFlota flotaSinNavesDescripcionDeError ! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 10/Jul/2025, 10:58:49 pm (UTC)'!
test02LaFlotaNoPuedeTenerNavesDuplicadas

	| cruceroPesadoConImpulsoEstandar |
	
	cruceroPesadoConImpulsoEstandar := self nuevoCruceroPesadoConImpulsoEstandar.
	
	self 
		should: [ EscapeDeFlota enrolar: { cruceroPesadoConImpulsoEstandar. cruceroPesadoConImpulsoEstandar } ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: EscapeDeFlota todasLasNavesDebenSerDiferentesDescripcionDeError ! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 17/Jul/2025, 8:58:13 am (UTC)'!
test03LaRutaDeSectoresARecorrerNoPuedeSerVacia

	| cruceroPesadoConImpulso flota |
	
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self assert: (cruceroPesadoConImpulso valorCombustible: 50).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	self 
		should: [ flota atravesar: {  } ] 
		raise: Error-MessageNotUnderstood  
		withExceptionDo: [ :error | 
			self assert: EscapeDeFlota rutaVaciaDescripcionDeError equals: error messageText.
			self assert: (cruceroPesadoConImpulso valorCombustible: 50) ]
! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 17/Jul/2025, 8:58:22 am (UTC)'!
test04CombustibleDeLaNaveDebeSerSuficienteParaAtravesarUnicoSectorPlanetarioYSobrevivir

	| sector flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self assert: (cruceroPesadoConImpulso valorCombustible: 50).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	sector := self nuevoSectorPlanetarioConGravedad: 50 yRadiacion: 50.
	
	flota atravesar: { sector }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: (cruceroPesadoConImpulso valorCombustible: (50 - 10))
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:58 am (UTC)'!
test05LaRutaDeSectoresARecorrerNoPuedeTenerSectoresRepetidos

	| cruceroPesadoConImpulso flota sector |
	
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self assert: (cruceroPesadoConImpulso valorCombustible: 50).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	sector := self nuevoSectorPlanetarioConGravedad: 50 yRadiacion: 50.
	
	self 
		should: [ flota atravesar: { sector. sector } ] 
		raise: Error-MessageNotUnderstood  
		withExceptionDo: [ :error | 
			self assert: EscapeDeFlota sectoresRepetidosDescripcionDeError equals: error messageText.
			self assert: (cruceroPesadoConImpulso valorCombustible: 50) ]
! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:39 am (UTC)'!
test06NaveQueSeQuedaSinCombustibleMientrasCruzaSectorNoSobrevive

	| flota naveContrabandistaConImpulso |
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConImpulso := self nuevaNaveContrabandistaConImpulsoEstandar.
	self deny: naveContrabandistaConImpulso sinCombustible.

	flota := EscapeDeFlota enrolar: { naveContrabandistaConImpulso }.
	
	"Secuencia de 10 sistemas planetarios seguidos con combustible para 9.5..."
	flota atravesar: (self nuevoTrayectoDeSectoresPlanetariosDeLongitud: 10 conGravedad: 50 yRadiacion: 50).
	
	self assert: (flota numeroDeSobrevivientesEs: 0).
	self deny: (flota haSobrevivido: naveContrabandistaConImpulso).
	self assert: naveContrabandistaConImpulso sinCombustible
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:34 am (UTC)'!
test07NavePuedeQuedarseSinCombustiblePeroSobrevivir

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso sinCombustible.
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	"Secuencia de 5 sistemas planetarios seguidos... Llega justo!!"
	flota atravesar: (self nuevoTrayectoDeSectoresPlanetariosDeLongitud: 5 conGravedad: 50 yRadiacion: 50).
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: cruceroPesadoConImpulso sinCombustible.
	self assert: (cruceroPesadoConImpulso valorCombustible: 0).
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:30 am (UTC)'!
test08NaveQueSeQuedaSinCombustibleAntesDePasarPorTodosLosSectoresNoSobrevive

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso sinCombustible.

	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	"Secuencia de 6 sistemas planetarios seguidos con combustible para 5..."
	flota atravesar: (self nuevoTrayectoDeSectoresPlanetariosDeLongitud: 6 conGravedad: 50 yRadiacion: 50).
	
	self assert: (flota numeroDeSobrevivientesEs: 0).
	self deny: (flota haSobrevivido: cruceroPesadoConImpulso).
	self assert: cruceroPesadoConImpulso sinCombustible
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:25 am (UTC)'!
test09NaveQueAtraviesaSectorConMayorGravedadQueSuManiobravilidadSufreDaños

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 0).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 70 yRadiacion: 50 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 1).

	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:21 am (UTC)'!
test10NaveQueAtraviesaSectorConMayorRadiacionQueSusEscudosDeEnergiaSufreDaños

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 0).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 50 yRadiacion: 200 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 1).
	

	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:15 am (UTC)'!
test11NaveAtravesandoSectorConMayorGravedadYRadiacionQueSuManiobravilidadYEscudosDeEnergiaSufreElDobleDeDaño

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 0).

	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 70 yRadiacion: 200 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 2).
	
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:11 am (UTC)'!
test12NaveQueSufreMasNivelesDeDañoQueLaCapacidadDeSuCascoEsDestruidaYNoSobreviveAlEscape

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso destruida.
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	"6 niveles de daño en una clase de naves que sólo admite 5 como máximo..."
	flota atravesar: (self nuevoTrayectoDeSectoresPlanetariosDeLongitud: 3 conGravedad: 70 yRadiacion: 200).
	
	self assert: (flota numeroDeSobrevivientesEs: 0).
	self deny: (flota haSobrevivido: cruceroPesadoConImpulso).
	self assert: cruceroPesadoConImpulso destruida
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:07 am (UTC)'!
test13NaveAtravesandoSectorPlanetarioUsandoVelocidadLuzIgnoraRadiacionDelSector

	| flota naveContrabandistaConVelocidadLuz |
	
	"Si se atraviesa un sector planetario utilizando velocidad luz (Warp, Light Speed, Subluminal, FTL: Faster Than Light, o como tu autor de ciencia ficción favorito lo llame), se puede pasar tan rápido que se ignoran los efectos de la radiación"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConVelocidadLuz := self nuevaNaveContrabandistaConVelocidadLuz.
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 0).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConVelocidadLuz}.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 50 yRadiacion: 200 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConVelocidadLuz).
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 0).
	self assert: (naveContrabandistaConVelocidadLuz valorCombustible: (95 - 10)).
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 90 yRadiacion: 200 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConVelocidadLuz).
	
	"El daño proviene aquí de la alta gravedad y no de la radiación..."	
	self assert: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 1).
	self assert: (naveContrabandistaConVelocidadLuz valorCombustible: (95 - 20))
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:02 am (UTC)'!
test14NaveAtravesandoSectorPlanetarioUsandoGravitonesDecrementaManiobravilidadEn20Porciento

	| flota naveContrabandistaConGravitones |
	
	"Si se atraviesa un sector planetario utilizando propulsion por gravitones el piloto tiene mayor dificultad en controlar la nave en el sector. 20% de penalización en su maniobravilidad"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConGravitones := self nuevaNaveContrabandistaConGravitones.
	self deny: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones valorCombustible: 95).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConGravitones }.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 70 * 0.8 yRadiacion: 40 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self deny: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones valorCombustible: 95 - 10).
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: (70 * 0.8) + 1 yRadiacion: 40 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	
	"La gravedad supera la coordinacion del piloto navegando sector planetario con gravitones, luego la nave es dañada"
	self assert: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones nivelDeDañoEs: 1).
	self assert: (naveContrabandistaConGravitones valorCombustible: 95 - 20).

! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:05:58 am (UTC)'!
test15NaveAtravesandoSectorDeAsteroidesUsandoImpulsoEstandarReduceSusEscudosDeEnergia

	| flota naveContrabandistaConImpulso |
	
	"Si se atraviesa un sector de asteroides utilizando el propulsor de impulso estandar, los escudos indefectiblemente reciben el impacto de los asteroides (nada que pueda hacer el piloto con ese tipo de propulsores) y se reducen permanentemente en 20"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConImpulso := self nuevaNaveContrabandistaConImpulsoEstandar.
	self deny: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso nivelDeDañoEs: 0).
	self assert: (naveContrabandistaConImpulso fuerzaDeEscudosEn: 50).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConImpulso}.
	flota atravesar: { self nuevoSectorDeAsteroidesConGravedad: 65 yRadiacion: 35 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConImpulso).
	self assert: (naveContrabandistaConImpulso fuerzaDeEscudosEn: 50 - 20).
	
	"La nave sufre daño porque los escudos de energia descendieron por debajo de la radiacion del sector"
	self assert: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso nivelDeDañoEs: 1).
	
	

	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:05:53 am (UTC)'!
test16NaveAtravesandoSectorDeAsteroidesUsandoVelocidadLuzAgotaSusEscudosACeroYSufreDaños

	| flota naveContrabandistaConVelocidadLuz |
	
	"Si se atraviesa un sector de asteroides utilizando velocidad luz, vas derecho al desastre... quien sea que haya trazado ese curso estará condenado, porque irá en linea recta contra un cinturón de asteroides a la velocidad de la luz (duh!!). En terminos prácticos, la nave pierde todos sus escudos de energía permanentemente (pasan a 0) debido a los impactos con los asteroides, se le inflinje 1 nivel de daño al casco y además casi seguro se le suma otro nivel más por radiación al esta no contar más con sus escudos"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConVelocidadLuz := self nuevaNaveContrabandistaConVelocidadLuz.
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 0).
	self assert: (naveContrabandistaConVelocidadLuz fuerzaDeEscudosEn: 50).
	
	flota := EscapeDeFlota enrolar: { naveContrabandistaConVelocidadLuz }.
	
	flota atravesar: { self nuevoSectorDeAsteroidesConGravedad: 65 yRadiacion: 30 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConVelocidadLuz).
	
	"Usar Velocidad Luz con asteroides acaba con los escudos y suma 1 nivel de daño al casco".
	"La radición daña adicionalmente al casco de la nave ya que sus escudos se reducen a 0"
	self assert: (naveContrabandistaConVelocidadLuz fuerzaDeEscudosEn: 0).
	self assert: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 1 + 1).
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:05:48 am (UTC)'!
test17NaveAtravesandoSectorDeAsteroidesUsandoGravitonesIgnoraGravedadPeroConsumeElDobleDeCombustible

	| flota naveContrabandistaConGravitones |
	
	"Si se atraviesa un sector de asteroides utilizando el avanzado sistema de propulsores basado en Gravitones, el piloto automático de la nave puede sin problema eludirlos sin impactos. Como el piloto no participa, no se tiene en cuenta el rating de maniobrabilidad de la nave, ni la gravedad del sector"
	
	"Al mismo tiempo, lamentablemente el sistema consume el doble de combustible que lo normal"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConGravitones := self nuevaNaveContrabandistaConGravitones.
	
	flota := EscapeDeFlota enrolar: { naveContrabandistaConGravitones}.
	
	"La alta gravedad no son nada para el sistema avanzado de propulsores de Gravitones"
	flota atravesar: { self nuevoSectorDeAsteroidesConGravedad: 90 yRadiacion: 30 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self deny: naveContrabandistaConGravitones dañada.
	"Doble gasto de combustible"
	self assert: (naveContrabandistaConGravitones valorCombustible: (95 - 20)).

	"La radiación del sector es la que produce el daño (60 supera a los 50 de los escudos de la nave) y no la gravedad..."
	flota atravesar: { self nuevoSectorDeAsteroidesConGravedad: 90 yRadiacion: 60 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self assert: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones nivelDeDañoEs: 1).
	"Doble gasto de combustible"
	self assert: (naveContrabandistaConGravitones valorCombustible: (95 - 40))
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 1:47:51 am (UTC)'!
test18NaveAtravesandoSectorNebulosaUsandoImpulsoEstandarDecrementaEscudosAl30Porciento

	| flota naveContrabandistaConImpulso |
	
	"Si se atraviesa una nebulosa con propulsores de impulso estandar, se esta mucho tiempo dentro de la misma y los escudos empiezan a perder efectividad. 30% de penalizacion a los escudos mientras se la cruza"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConImpulso := self nuevaNaveContrabandistaConImpulsoEstandar .
	self deny: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso valorCombustible: 95).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConImpulso }.
	
	flota atravesar: { self nuevoSectorNebulosaConGravedad: 50 yRadiacion: 50 * 0.7 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConImpulso).
	self deny: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso valorCombustible: 95 - 10).


	flota atravesar: { self nuevoSectorNebulosaConGravedad: 50 yRadiacion: (50 * 0.7) + 1}.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConImpulso).
	"La radiación supera el desgaste extremo de los escudos, y por lo tanto la nave es dañada"
	self assert: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso nivelDeDañoEs: 1).
	self assert: (naveContrabandistaConImpulso valorCombustible: 95 - 20).
! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:05:37 am (UTC)'!
test19NaveAtravesandoSectorNebulosaUsandoVelocidadLuzNoConsumeCombustibleEIgnoraGravedadYRadiacionDelSector

	| flota naveContrabandistaConVelocidadLuz |
	
	"Si se viaja hacia una nebulosa utilizando velocidad luz, el modulo Warp se revigoriza por un efecto cuántico bien conocido por el contacto con los gases de la nébula, y casi la teletransporta de inmediato al próximo sector galáctico de la trayectoria del viaje. Luego no se consume combustible, y no se efectua ninguno de los chequeos típicos de supervivencia en el sector"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConVelocidadLuz := self nuevaNaveContrabandistaConVelocidadLuz.
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz valorCombustible: 95).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConVelocidadLuz }.
	
	flota atravesar: { self nuevoSectorNebulosaConGravedad: 90 yRadiacion: 90 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConVelocidadLuz).
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz valorCombustible: 95).
! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:05:31 am (UTC)'!
test20NaveAtravesandoSectorNebulosaUsandoGravitonesEsAfectadaPorGravedadYRadiacionNormalmentePeroConsumientoElTripleDeCombustible

	| flota naveContrabandistaConGravitones |
	
	"La nebulosa afecta los propulsores de gravitones haciendolos menos eficientes. Consume 3 veces el valor de combustible normal sin ningun otro beneficio"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConGravitones := self nuevaNaveContrabandistaConGravitones .
	self deny: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones valorCombustible: 95).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConGravitones }.
	
	flota atravesar: { self nuevoSectorNebulosaConGravedad: 70 yRadiacion: 50 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self deny: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones valorCombustible: 95 - 30).

	flota atravesar: { self nuevoSectorNebulosaConGravedad: 71 yRadiacion: 51 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self assert: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones nivelDeDañoEs: 2).
	self assert: (naveContrabandistaConGravitones valorCombustible: 95 - 60)! !


!EscapeDeFlotaTests methodsFor: 'naves' stamp: 'HAW 20/Sep/2026, 1:34:00 am (UTC)'!
nuevaNaveContrabandistaConGravitones

	^ Nave initializeNaveContrabandistaConTipoDePropulsor: 
	self propulsoresDeGravitones ! !

!EscapeDeFlotaTests methodsFor: 'naves' stamp: 'HAW 20/Sep/2026, 1:34:13 am (UTC)'!
nuevaNaveContrabandistaConImpulsoEstandar

	^ Nave  initializeNaveContrabandistaConTipoDePropulsor: 
	self propulsoresDeImpulsoEstandar.
	! !

!EscapeDeFlotaTests methodsFor: 'naves' stamp: 'HAW 20/Sep/2026, 1:34:32 am (UTC)'!
nuevaNaveContrabandistaConVelocidadLuz

	^ Nave initializeNaveContrabandistaConTipoDePropulsor: 
	self propulsoresDeVelocidadLuz ! !

!EscapeDeFlotaTests methodsFor: 'naves' stamp: 'HAW 20/Sep/2026, 1:34:25 am (UTC)'!
nuevoCruceroPesadoConImpulsoEstandar

	^ Nave initializeNaveCruceroConTipoDePropulsor:
		self propulsoresDeImpulsoEstandar 
	! !


!EscapeDeFlotaTests methodsFor: 'sectores' stamp: 'HAW 20/Sep/2026, 1:36:02 am (UTC)'!
nuevoSectorDeAsteroidesConGravedad: gravedad yRadiacion: radiacion

	^ SectorAsteroides conGravedad: gravedad yRadiacion: radiacion ! !

!EscapeDeFlotaTests methodsFor: 'sectores' stamp: 'HAW 20/Sep/2026, 1:36:07 am (UTC)'!
nuevoSectorNebulosaConGravedad: gravedad yRadiacion: radiacion
 
	^SectorNebulosa conGravedad: gravedad yRadiacion: radiacion ! !

!EscapeDeFlotaTests methodsFor: 'sectores' stamp: 'HAW 20/Sep/2026, 1:36:13 am (UTC)'!
nuevoSectorPlanetarioConGravedad: gravedad yRadiacion: radiacion

	^SectorPlanetario conGravedad: gravedad yRadiacion: radiacion 
! !

!EscapeDeFlotaTests methodsFor: 'sectores' stamp: 'HAW 20/Sep/2026, 1:36:22 am (UTC)'!
nuevoTrayectoDeSectoresPlanetariosDeLongitud: numeroDeSectores conGravedad: gravedad yRadiacion: radiacion

	|sectores|
	sectores := OrderedCollection new.
	numeroDeSectores timesRepeat: [sectores add: (SectorPlanetario conGravedad: gravedad yRadiacion: radiacion )].	
	^sectores.! !


!EscapeDeFlotaTests methodsFor: 'propulsores' stamp: 'HAW 20/Sep/2026, 1:36:39 am (UTC)'!
propulsoresDeGravitones

	^ PropulsorGravitones new! !

!EscapeDeFlotaTests methodsFor: 'propulsores' stamp: 'HAW 20/Sep/2026, 1:37:04 am (UTC)'!
propulsoresDeImpulsoEstandar

	^ PropulsorEstandar new! !

!EscapeDeFlotaTests methodsFor: 'propulsores' stamp: 'HAW 20/Sep/2026, 1:37:15 am (UTC)'!
propulsoresDeVelocidadLuz

	^ PropulsorVelocidadDeLuz new! !
