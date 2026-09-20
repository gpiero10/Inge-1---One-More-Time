!classDefinition: #Aventurero category: #'2024-2C-Parcial-1'!
Object subclass: #Aventurero
	instanceVariableNames: 'tipo puntosDeVida puntosDeDefensa itemsDeAtaque'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Aventurero methodsFor: 'init' stamp: 'HAW 20/Sep/2026, 2:30:39 pm (UTC)'!
initializeInitiallizeDeTipo: unTipo 
	
	tipo := unTipo.
	
	puntosDeDefensa := 0*pv.
	puntosDeVida := 10 * pv.
	
	itemsDeAtaque := OrderedCollection new.! !


!Aventurero methodsFor: 'defensa' stamp: 'HAW 20/Sep/2026, 2:21:59 pm (UTC)'!
equiparItemDeDefensa: unaDefensa 
	
	puntosDeDefensa := puntosDeDefensa + unaDefensa.
	! !

!Aventurero methodsFor: 'defensa' stamp: 'HAW 20/Sep/2026, 2:19:53 pm (UTC)'!
teAtacaMonstruoConEsteDaño: unDaño 
	puntosDeVida  := puntosDeVida - ((unDaño - puntosDeDefensa) max: 0)! !


!Aventurero methodsFor: 'test' stamp: 'HAW 20/Sep/2026, 1:57:06 pm (UTC)'!
tienePuntosDeVida: unaVidaEsperada 
	
	^ puntosDeVida = unaVidaEsperada ! !


!Aventurero methodsFor: 'ataque' stamp: 'HAW 20/Sep/2026, 2:35:11 pm (UTC)'!
atacarA: unMonstruo con: unItemDeAtaque 
	
	(itemsDeAtaque includes: unItemDeAtaque) 
	ifFalse: [^ self error: self itemNoDisponibleMensajeDeError]. 
	! !


!Aventurero methodsFor: 'msg error' stamp: 'HAW 20/Sep/2026, 2:35:21 pm (UTC)'!
itemNoDisponibleMensajeDeError
	
	^ 'No podes usar un item que no tenes equipado, boludooooooo'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Aventurero class' category: #'2024-2C-Parcial-1'!
Aventurero class
	instanceVariableNames: ''!

!Aventurero class methodsFor: 'instance creation' stamp: 'HAW 20/Sep/2026, 1:40:20 pm (UTC)'!
initiallizeDeTipo: unTipo 
	
	^self new initializeInitiallizeDeTipo: unTipo ! !



!classDefinition: #ItemDeAtaque category: #'2024-2C-Parcial-1'!
Object subclass: #ItemDeAtaque
	instanceVariableNames: 'monstruoObjetivo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemDeAtaque methodsFor: 'initialization' stamp: 'HAW 20/Sep/2026, 2:27:05 pm (UTC)'!
initializeConObjetivo: unMonstruo 
	
	monstruoObjetivo := unMonstruo.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ItemDeAtaque class' category: #'2024-2C-Parcial-1'!
ItemDeAtaque class
	instanceVariableNames: ''!

!ItemDeAtaque class methodsFor: 'instance creation' stamp: 'HAW 20/Sep/2026, 2:26:35 pm (UTC)'!
conObjetivo: unMonstruo 
	
	^self new initializeConObjetivo: unMonstruo ! !


!classDefinition: #Monstruo category: #'2024-2C-Parcial-1'!
Object subclass: #Monstruo
	instanceVariableNames: 'tipoDeMonstruo puntosDeVida'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Monstruo methodsFor: 'init' stamp: 'HAW 20/Sep/2026, 2:02:29 pm (UTC)'!
initializeInitializedeTipo: unTipoDeMonstruo 
	
	tipoDeMonstruo := unTipoDeMonstruo.
	
	tipoDeMonstruo = #Goblin ifTrue: [puntosDeVida := 5*pv].
	tipoDeMonstruo = #Ogro ifTrue: [puntosDeVida := 15*pv].
	
		! !


!Monstruo methodsFor: 'attack' stamp: 'HAW 20/Sep/2026, 1:54:47 pm (UTC)'!
atacarA: unGuerrero 
	unGuerrero teAtacaMonstruoConEsteDaño: puntosDeVida. ! !


!Monstruo methodsFor: 'tests' stamp: 'HAW 20/Sep/2026, 2:37:20 pm (UTC)'!
tienePuntosDeVida: unaVidaEsperada
	^puntosDeVida = unaVidaEsperada ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Monstruo class' category: #'2024-2C-Parcial-1'!
Monstruo class
	instanceVariableNames: ''!

!Monstruo class methodsFor: 'instance creation' stamp: 'HAW 20/Sep/2026, 1:42:31 pm (UTC)'!
initializedeTipo: unTipoDeMonstruo 
	
	^self new initializeInitializedeTipo: unTipoDeMonstruo ! !


!classDefinition: #TestMyA category: #'2024-2C-Parcial-1'!
TestCase subclass: #TestMyA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!TestMyA methodsFor: 'tests' stamp: 'NR 27/Sep/2024, 6:49:05 am (UTC)'!
test01UnMonstruoAtacaAUnAventureroUsandoSusPVs

	| guerrero |
	
	guerrero := self crearGuerrero.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (5 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 27/Sep/2024, 7:09:06 am (UTC)'!
test02UnAventureroPuedeUsarItemsDeDefensaParaProtegerse

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearEscudoMagico.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearOgro atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (15 * pv - (5 * pv) - (3 * pv)))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 27/Sep/2024, 7:08:35 am (UTC)'!
test03LosItemsDeDefensaNoPuedenAumentarLosPuntosDeVidaDelAventurero

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearArmadura.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 27/Sep/2024, 12:04:39 pm (UTC)'!
test04UnAventureroNoPuedeAtacarSinItemsEquipados

	| guerrero ogro espada |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	espada := self crearEspadaPara: ogro.
	
	self should: [ guerrero atacarA: ogro con: (espada) ] 
		raise: Error-MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: guerrero itemNoDisponibleMensajeDeError.
			self assert: (ogro tienePuntosDeVida: 15 * pv)
	]
	! !

!TestMyA methodsFor: 'tests' stamp: 'LL 27/Sep/2024, 1:48:15 pm (UTC)'!
test05UnGuerreroConEspadaProvocaDañoSegunSuFuerza

	| guerrero ogro itemDeAtaque otroItemDeAtaque otroOgro |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	otroOgro := self crearOgro.
	otroItemDeAtaque := self crearEspadaPara: otroOgro.
	guerrero equiparItemDeAtaque: otroItemDeAtaque.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	guerrero atacarA: otroOgro con: otroItemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (otroOgro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 27/Sep/2024, 12:46:06 pm (UTC)'!
test06UnGuerreroConEspadaNoProvocaDañoAOtroMonstruoQueNoSeaElDeLaEspada

	| guerrero ogroNoObjetivoDeAtaque itemDeAtaque ogroObjetivoDeAtaque |
	
	guerrero := self crearGuerrero.
	ogroObjetivoDeAtaque := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogroObjetivoDeAtaque.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogroNoObjetivoDeAtaque := self crearOgro.
	
	guerrero atacarA: ogroNoObjetivoDeAtaque con: itemDeAtaque.
	
	self assert: (ogroNoObjetivoDeAtaque tienePuntosDeVida: 15 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 27/Sep/2024, 7:08:52 am (UTC)'!
test07UnAventureroNoGuerreroPierdeTodosSusPuntosDeVidaSiUsaLaEspada

	| ogro mago itemDeAtaque |
	
	mago := self crearMago.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	mago equiparItemDeAtaque: itemDeAtaque.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv).
	self assert: (mago tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 27/Sep/2024, 7:08:49 am (UTC)'!
test08ElMagoUsandoElBaculoMataAlGoblin

	| mago goblin itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	goblin :=  self crearGoblin.
	
	mago atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 27/Sep/2024, 7:42:13 am (UTC)'!
test09ElMagoUsandoElBaculoDañaAOtrosMonstruosSegunSuFuerza

	| mago ogro itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (2 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 27/Sep/2024, 7:08:45 am (UTC)'!
test10UnAventureroNoMagoEsPenalizadoAlUsarElBaculoDuplicandoPVDeGoblins

	| guerrero goblin itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	goblin := self crearGoblin.
	
	guerrero atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 5 * pv * 2)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 27/Sep/2024, 7:08:38 am (UTC)'!
test11UnAventureroNoMagoUsandoElBaculoDañaSegunSuFuerzaAOtrosMonstruos

	| guerrero ogro itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 27/Sep/2024, 7:29:01 am (UTC)'!
test12UnaEspadaNuncaPuedeSerUsadaEnMonstruosDeMenosDeUnMetro

	| goblin |
	
	goblin := self crearGoblin.
	
	self should: [ self crearEspadaPara: goblin ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
		self assert: anException messageText equals: Espada noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	]
	! !


!TestMyA methodsFor: 'crear items' stamp: 'HAW 20/Sep/2026, 2:01:09 pm (UTC)'!
crearArmadura

	^ 5*pv! !

!TestMyA methodsFor: 'crear items' stamp: 'NR 27/Sep/2024, 8:35:28 am (UTC)'!
crearBaculo
	
	self shouldBeImplemented ! !

!TestMyA methodsFor: 'crear items' stamp: 'HAW 20/Sep/2026, 2:00:33 pm (UTC)'!
crearEscudoMagico

	^ 3*pv
! !

!TestMyA methodsFor: 'crear items' stamp: 'HAW 20/Sep/2026, 2:26:10 pm (UTC)'!
crearEspadaPara: unMonstruo

	^ ItemDeAtaque conObjetivo: unMonstruo 
! !


!TestMyA methodsFor: 'crear combatientes' stamp: 'HAW 20/Sep/2026, 1:42:10 pm (UTC)'!
crearGoblin

	^ Monstruo initializedeTipo: #Goblin
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'HAW 20/Sep/2026, 1:39:59 pm (UTC)'!
crearGuerrero
	
	^ Aventurero initiallizeDeTipo: #Guerrero ! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'NR 27/Sep/2024, 8:35:52 am (UTC)'!
crearMago

	self shouldBeImplemented 
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'HAW 20/Sep/2026, 2:01:31 pm (UTC)'!
crearOgro

	^ Monstruo initializedeTipo: #Ogro! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestMyA class' category: #'2024-2C-Parcial-1'!
TestMyA class
	instanceVariableNames: ''!

!TestMyA class methodsFor: 'initialization' stamp: 'LL 26/Sep/2024, 11:21:50 pm (UTC)'!
initialize

	Smalltalk at: #pv put: (BaseUnit named: 'pv' sign: 'pv')! !

TestMyA initialize!