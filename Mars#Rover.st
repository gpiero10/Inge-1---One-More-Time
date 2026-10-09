!classDefinition: #DireccionDeCabezalMarsRover category: #'Mars Rover'!
Object subclass: #DireccionDeCabezalMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!DireccionDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:18 am (UTC)'!
meMuevoHaciaAdelante

	self subclassResponsibility! !

!DireccionDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:25 am (UTC)'!
meMuevoHaciaAtras

	self subclassResponsibility! !

!DireccionDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:31 am (UTC)'!
rotoHaciaLaDerecha

	self subclassResponsibility! !

!DireccionDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:38 am (UTC)'!
rotoHaciaLaIzquierda

	self subclassResponsibility! !


!classDefinition: #DireccionEsteDeCabezalMarsRover category: #'Mars Rover'!
DireccionDeCabezalMarsRover subclass: #DireccionEsteDeCabezalMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!DireccionEsteDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:18 am (UTC)'!
meMuevoHaciaAdelante
	
	^ (1@0).! !

!DireccionEsteDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:25 am (UTC)'!
meMuevoHaciaAtras
	
	^ (-1@0).! !

!DireccionEsteDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:31 am (UTC)'!
rotoHaciaLaDerecha
	
	^ DireccionSurDeCabezalMarsRover new! !

!DireccionEsteDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:20:30 am (UTC)'!
rotoHaciaLaIzquierda
	
	^ DireccionNorteDeCabezalMarsRover new.! !


!classDefinition: #DireccionNorteDeCabezalMarsRover category: #'Mars Rover'!
DireccionDeCabezalMarsRover subclass: #DireccionNorteDeCabezalMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!DireccionNorteDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:18 am (UTC)'!
meMuevoHaciaAdelante

	^(0@1).! !

!DireccionNorteDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:25 am (UTC)'!
meMuevoHaciaAtras
	
	^(0@-1).! !

!DireccionNorteDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:31 am (UTC)'!
rotoHaciaLaDerecha
	
	^ DireccionEsteDeCabezalMarsRover new.! !

!DireccionNorteDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:38 am (UTC)'!
rotoHaciaLaIzquierda
	
	^ DireccionOesteDeCabezalMarsRover new.! !


!classDefinition: #DireccionOesteDeCabezalMarsRover category: #'Mars Rover'!
DireccionDeCabezalMarsRover subclass: #DireccionOesteDeCabezalMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!DireccionOesteDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:18 am (UTC)'!
meMuevoHaciaAdelante
		
	^ (-1@0).! !

!DireccionOesteDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:25 am (UTC)'!
meMuevoHaciaAtras
	
	^(1@0).! !

!DireccionOesteDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:31 am (UTC)'!
rotoHaciaLaDerecha
	
	^ DireccionNorteDeCabezalMarsRover new! !

!DireccionOesteDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:38 am (UTC)'!
rotoHaciaLaIzquierda
	
	^ DireccionSurDeCabezalMarsRover new! !


!classDefinition: #DireccionSurDeCabezalMarsRover category: #'Mars Rover'!
DireccionDeCabezalMarsRover subclass: #DireccionSurDeCabezalMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!DireccionSurDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:23:08 am (UTC)'!
meMuevoHaciaAdelante
	^ (0@-1)! !

!DireccionSurDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:24:26 am (UTC)'!
meMuevoHaciaAtras
	^ (0@1)! !

!DireccionSurDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:31 am (UTC)'!
rotoHaciaLaDerecha
	
	^ DireccionOesteDeCabezalMarsRover new.! !

!DireccionSurDeCabezalMarsRover methodsFor: 'comandosDelRover' stamp: 'HAW 8/Oct/2026, 12:16:38 am (UTC)'!
rotoHaciaLaIzquierda
	
	
	^ DireccionEsteDeCabezalMarsRover new.! !


!classDefinition: #MarsRover category: #'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'ubicacion direccionDelCabezal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'init' stamp: 'HAW 8/Oct/2026, 12:32:36 am (UTC)'!
initializeUbicadoEn: unaUbicacionDeInicio yMirandoHaciaDireccionCardinal: unaDireccionCardinal 
	
	ubicacion := unaUbicacionDeInicio.
	direccionDelCabezal := unaDireccionCardinal.! !


!MarsRover methodsFor: 'procesar' stamp: 'HAW 8/Oct/2026, 12:31:43 am (UTC)'!
esComandoValido: unComando

	^ #($l $r $f $b) includes: unComando! !

!MarsRover methodsFor: 'procesar' stamp: 'HAW 8/Oct/2026, 12:32:12 am (UTC)'!
procesar: unosComandos 
	
	unosComandos do: [:unComando | 
		(self esComandoValido: unComando) 
		ifTrue: [ self procesarComando: unComando]
		ifFalse: [^self]
	].! !

!MarsRover methodsFor: 'procesar' stamp: 'HAW 8/Oct/2026, 12:32:36 am (UTC)'!
procesarComando: unComando

	unComando = $l ifTrue: [direccionDelCabezal := direccionDelCabezal rotoHaciaLaIzquierda].
	unComando = $r ifTrue: [direccionDelCabezal := direccionDelCabezal rotoHaciaLaDerecha].
	unComando = $f ifTrue: [ self meMuevoEnEsteDelta: (direccionDelCabezal meMuevoHaciaAdelante)].
	unComando = $b ifTrue: [ self meMuevoEnEsteDelta: ​ (direccionDelCabezal meMuevoHaciaAtras)].! !


!MarsRover methodsFor: 'tests' stamp: 'HAW 8/Oct/2026, 12:25:05 am (UTC)'!
estaUbicadoEn: unaUbicacionEsperada 
	
	^ ubicacion = unaUbicacionEsperada ! !

!MarsRover methodsFor: 'tests' stamp: 'HAW 8/Oct/2026, 12:32:36 am (UTC)'!
miraADireccionCardinal: unaDireccionCardinalEsperada 
	
	^ direccionDelCabezal isKindOf: unaDireccionCardinalEsperada class! !


!MarsRover methodsFor: 'movimiento' stamp: 'HAW 8/Oct/2026, 12:19:06 am (UTC)'!
meMuevoEnEsteDelta: unDelta
	
	ubicacion := ubicacion + unDelta ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Mars Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 7/Oct/2026, 10:20:20 pm (UTC)'!
ubicadoEn: unaUbicacionDeInicio yMirandoHaciaDireccionCardinal: unaDireccionCardinal 
	
	^self new initializeUbicadoEn: unaUbicacionDeInicio yMirandoHaciaDireccionCardinal: unaDireccionCardinal ! !


!classDefinition: #MarsRoverTests category: #'Mars Rover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverTests methodsFor: 'direccion' stamp: 'HAW 7/Oct/2026, 11:34:26 pm (UTC)'!
direccionEste

	^ DireccionEsteDeCabezalMarsRover new! !

!MarsRoverTests methodsFor: 'direccion' stamp: 'HAW 7/Oct/2026, 11:34:18 pm (UTC)'!
direccionNorte

	^ DireccionNorteDeCabezalMarsRover new! !

!MarsRoverTests methodsFor: 'direccion' stamp: 'HAW 7/Oct/2026, 11:34:09 pm (UTC)'!
direccionOeste

	^ DireccionOesteDeCabezalMarsRover new! !

!MarsRoverTests methodsFor: 'direccion' stamp: 'HAW 7/Oct/2026, 11:33:59 pm (UTC)'!
direccionSur

	^ DireccionSurDeCabezalMarsRover new.! !


!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 7/Oct/2026, 11:09:54 pm (UTC)'!
test01MarsRoverQueMiraAlNorteAvanzaUnaVez
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionNorte.
	
	marsRover procesar: 'f'.
	
	self assert: (marsRover estaUbicadoEn: 0@1).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 7/Oct/2026, 11:09:54 pm (UTC)'!
test02MarsRoverQueMiraAlNorteRetrocedeUnaVez
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionNorte.
	
	marsRover procesar: 'b'.
	
	self deny: (marsRover estaUbicadoEn: 0@0).
	self assert: (marsRover estaUbicadoEn: 0@-1).
	! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 7/Oct/2026, 11:10:34 pm (UTC)'!
test03MarsRoverQueMiraAlNorteRotaAIzquierda
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionNorte.
	
	marsRover procesar: 'l'.
	
	self assert: (marsRover estaUbicadoEn: 0@0).
	self assert: (marsRover miraADireccionCardinal: self direccionOeste).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 7/Oct/2026, 11:10:18 pm (UTC)'!
test04MarsRoverQueMiraAlNorteRotaADerecha
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionNorte.
	
	marsRover procesar: 'r'.
	
	self assert: (marsRover estaUbicadoEn: 0@0).
	self assert: (marsRover miraADireccionCardinal: self direccionEste).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 7/Oct/2026, 11:09:54 pm (UTC)'!
test05MarsRoverQueMiraAlNorteAvanzaVariasVeces
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionNorte.
	
	marsRover procesar: 'ff'.
	
	self assert: (marsRover estaUbicadoEn: 0@2).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 7/Oct/2026, 11:09:54 pm (UTC)'!
test06MarsRoverQueMiraAlNorteRetrocedeVariasVeces
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionNorte.
	
	marsRover procesar: 'bbb'.
	
	self assert: (marsRover estaUbicadoEn: 0@-3).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 7/Oct/2026, 11:10:18 pm (UTC)'!
test07MarsRoverRotaVariasVecesAIzquierda
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionNorte.
	
	marsRover procesar: 'lll'.
	
	self assert: (marsRover miraADireccionCardinal: self direccionEste).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 7/Oct/2026, 11:10:34 pm (UTC)'!
test08MarsRoverRotaVariasVecesADerecha
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionNorte.
	
	marsRover procesar: 'rrr'.
	
	self assert: (marsRover miraADireccionCardinal: self direccionOeste).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 7/Oct/2026, 11:13:06 pm (UTC)'!
test09MarsRoverQueMiraAlOesteAvanzaBien
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionOeste.
	
	marsRover procesar: 'f'.
	
	self assert: (marsRover estaUbicadoEn: -1@0).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 7/Oct/2026, 11:14:52 pm (UTC)'!
test10MarsRoverQueMiraAlOesteRetrocedeBien
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionOeste.
	
	marsRover procesar: 'bbb'.
	
	self assert: (marsRover estaUbicadoEn: 3@0).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 7/Oct/2026, 11:18:10 pm (UTC)'!
test11MarsRoverQueMiraAlOesteRotaADerecha
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionOeste.
	
	marsRover procesar: 'r'.
	
	self assert: (marsRover miraADireccionCardinal: self direccionNorte).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 7/Oct/2026, 11:22:46 pm (UTC)'!
test12MarsRoverQueMiraAlEsteAvanzaBien
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionEste.
	
	marsRover procesar: 'fff'.
	
	self assert: (marsRover estaUbicadoEn: 3@0).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 7/Oct/2026, 11:23:19 pm (UTC)'!
test13MarsRoverQueMiraAlEsteRetrocedeBien
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionEste.
	
	marsRover procesar: 'bbbb'.
	
	self assert: (marsRover estaUbicadoEn: -4@0).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 8/Oct/2026, 12:20:02 am (UTC)'!
test14MarsRoverQueMiraAlEsteRotaAIzquierda
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionEste.
	
	marsRover procesar: 'l'.
	
	self assert: (marsRover miraADireccionCardinal: self direccionNorte).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 8/Oct/2026, 12:23:21 am (UTC)'!
test15MarsRoverQueMiraAlSurAvanzaBien
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionSur.
	
	marsRover procesar: 'fff'.
	
	self assert: (marsRover estaUbicadoEn: 0@-3).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 8/Oct/2026, 12:23:54 am (UTC)'!
test16MarsRoverQueMiraAlSurRetrocedeBien
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionSur.
	
	marsRover procesar: 'bbbbbb'.
	
	self assert: (marsRover estaUbicadoEn: 0@6).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'HAW 8/Oct/2026, 12:28:52 am (UTC)'!
test17MarsRoverDejaDeProcesarComandosCuandoDetectaUnoErroneo
	| marsRover |
	marsRover := MarsRover ubicadoEn: 0@0 yMirandoHaciaDireccionCardinal: self direccionNorte.
	
	marsRover procesar: 'ffhbb'.

	self assert: (marsRover estaUbicadoEn: 0@2).
	self assert: (marsRover miraADireccionCardinal: self direccionNorte ).! !
