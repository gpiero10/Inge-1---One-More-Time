!classDefinition: #TestMyA category: 'aventureros matones'!
TestCase subclass: #TestMyA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'aventureros matones'!

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

!TestMyA methodsFor: 'tests' stamp: 'HAW 20/Sep/2026, 3:38:51 pm (UTC)'!
test12UnaEspadaNuncaPuedeSerUsadaEnMonstruosDeMenosDeUnMetro

	| goblin |
	
	goblin := self crearGoblin.
	
	self should: [ self crearEspadaPara: goblin ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
		self assert: anException messageText equals: 
		Espada noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	]
	! !


!TestMyA methodsFor: 'crear items' stamp: 'HAW 20/Sep/2026, 2:01:09 pm (UTC)'!
crearArmadura

	^ 5*pv! !

!TestMyA methodsFor: 'crear items' stamp: 'HAW 20/Sep/2026, 4:36:24 pm (UTC)'!
crearBaculo
	
	^ Baculo new.! !

!TestMyA methodsFor: 'crear items' stamp: 'HAW 20/Sep/2026, 2:00:33 pm (UTC)'!
crearEscudoMagico

	^ 3*pv
! !

!TestMyA methodsFor: 'crear items' stamp: 'HAW 20/Sep/2026, 4:36:36 pm (UTC)'!
crearEspadaPara: unMonstruo

	^ Espada conObjetivo: unMonstruo 
! !


!TestMyA methodsFor: 'crear combatientes' stamp: 'HAW 20/Sep/2026, 4:52:36 pm (UTC)'!
crearGoblin

	^ Goblin new.
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'HAW 20/Sep/2026, 3:58:59 pm (UTC)'!
crearGuerrero
	
	^ Guerrero new.! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'HAW 20/Sep/2026, 3:59:07 pm (UTC)'!
crearMago

	^ Mago new.
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'HAW 20/Sep/2026, 4:52:27 pm (UTC)'!
crearOgro

	^ Ogro new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestMyA class' category: 'aventureros matones'!
TestMyA class
	instanceVariableNames: ''!

!TestMyA class methodsFor: 'initialization' stamp: 'LL 26/Sep/2024, 11:21:50 pm (UTC)'!
initialize

	Smalltalk at: #pv put: (BaseUnit named: 'pv' sign: 'pv')! !


!classDefinition: #Aventurero category: 'aventureros matones'!
Object subclass: #Aventurero
	instanceVariableNames: 'puntosDeVida puntosDeDefensa itemsDeAtaque fuerza'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'aventureros matones'!

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


!Aventurero methodsFor: 'ataque' stamp: 'HAW 20/Sep/2026, 3:59:51 pm (UTC)'!
atacarA: unMonstruo con: unItemDeAtaque 
	
	self subclassResponsibility. 
	
	
		! !

!Aventurero methodsFor: 'ataque' stamp: 'HAW 20/Sep/2026, 3:46:49 pm (UTC)'!
verificarDisposicionDeItem: unItemDeAtaque returningWith: aReturningBlock

	(itemsDeAtaque includes: unItemDeAtaque) 
	ifFalse: [^ aReturningBlock value: (self error: self itemNoDisponibleMensajeDeError)]! !


!Aventurero methodsFor: 'msg error' stamp: 'HAW 20/Sep/2026, 2:35:21 pm (UTC)'!
itemNoDisponibleMensajeDeError
	
	^ 'No podes usar un item que no tenes equipado, boludooooooo'! !


!Aventurero methodsFor: 'items' stamp: 'HAW 20/Sep/2026, 2:56:50 pm (UTC)'!
equiparItemDeAtaque: itemDeAtaque 
	
	itemsDeAtaque add: itemDeAtaque ! !


!classDefinition: #Guerrero category: 'aventureros matones'!
Aventurero subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'aventureros matones'!

!Guerrero methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 7:08:02 pm (UTC)'!
atacarA: unMonstruo con: unItemDeAtaque
	
	self verificarDisposicionDeItem: unItemDeAtaque returningWith: [ :res | ^ res ]. 
	
	unItemDeAtaque unGuerrero: self TeUsaParaAtacarA: unMonstruo conEstaFuerza: fuerza. 
! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 3:57:38 pm (UTC)'!
initialize
			
	fuerza := 4*pv.
	puntosDeVida := 10 * pv.

	puntosDeDefensa := 0*pv.
	itemsDeAtaque := OrderedCollection new.! !


!classDefinition: #Mago category: 'aventureros matones'!
Aventurero subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'aventureros matones'!

!Mago methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 7:07:55 pm (UTC)'!
atacarA: unMonstruo con: unItemDeAtaque
	
	self verificarDisposicionDeItem: unItemDeAtaque returningWith: [ :res | ^ res ]. 
	
	unItemDeAtaque unMago: self TeUsaParaAtacarA: unMonstruo conEstaFuerza: fuerza. 
	
! !

!Mago methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 3:58:03 pm (UTC)'!
initialize
	
	fuerza := 2*pv.
	puntosDeVida := 15 * pv.
	
	puntosDeDefensa := 0*pv.
	itemsDeAtaque := OrderedCollection new.! !

!Mago methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 4:32:22 pm (UTC)'!
perdesTuVidaPorUsarEspada
	
	puntosDeVida := 0*pv.! !


!classDefinition: #ItemDeAtaque category: 'aventureros matones'!
Object subclass: #ItemDeAtaque
	instanceVariableNames: 'monstruoObjetivo tipo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'aventureros matones'!



!ItemDeAtaque methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 4:16:54 pm (UTC)'!
unGuerrero: unGuerrero TeUsaParaAtacarA: unMonstruo conEstaFuerza: unaFuerza

	self subclassResponsibility! !

!ItemDeAtaque methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 4:10:09 pm (UTC)'!
unMago: unMago TeUsaParaAtacarA: unMonstruo conEstaFuerza: unaFuerza

	self subclassResponsibility! !


!classDefinition: #Baculo category: 'aventureros matones'!
ItemDeAtaque subclass: #Baculo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'aventureros matones'!

!Baculo methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 4:55:44 pm (UTC)'!
unGuerrero: unGuerrero TeUsaParaAtacarA: unMonstruo conEstaFuerza: unaFuerza

	
	unMonstruo recibisGolpeDeGuerreroConBaculoConEstaFuerza: unaFuerza! !

!Baculo methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 4:55:36 pm (UTC)'!
unMago: unMago TeUsaParaAtacarA: unMonstruo conEstaFuerza: unaFuerza
	
	unMonstruo recibisGolpeDeMagoConBaculoConEstaFuerza: unaFuerza! !


!classDefinition: #Espada category: 'aventureros matones'!
ItemDeAtaque subclass: #Espada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'aventureros matones'!

!Espada methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 4:37:02 pm (UTC)'!
initializeConObjetivo: unMonstruo
	
	monstruoObjetivo := unMonstruo. ! !

!Espada methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 4:31:39 pm (UTC)'!
unGuerrero: unGuerrero TeUsaParaAtacarA: unMonstruo conEstaFuerza: unaFuerza
	
	(monstruoObjetivo = unMonstruo)
	ifTrue: [unMonstruo recibisEsteDaño: unaFuerza]! !

!Espada methodsFor: 'as yet unclassified' stamp: 'HAW 20/Sep/2026, 4:32:33 pm (UTC)'!
unMago: unMago TeUsaParaAtacarA: unMonstruo conEstaFuerza: unaFuerza
	
	unMago perdesTuVidaPorUsarEspada.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Espada class' category: 'aventureros matones'!
Espada class
	instanceVariableNames: ''!

!Espada class methodsFor: 'instance creation' stamp: 'HAW 20/Sep/2026, 4:58:11 pm (UTC)'!
conObjetivo: unMonstruo
	
	(unMonstruo isKindOf: Goblin) 
	ifTrue: [^self error: Espada noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError].
	
	^self new initializeConObjetivo: unMonstruo! !


!Espada class methodsFor: 'msg error' stamp: 'HAW 20/Sep/2026, 3:39:13 pm (UTC)'!
noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	
	^ 'no seas abusivo'! !


!classDefinition: #Monstruo category: 'aventureros matones'!
Object subclass: #Monstruo
	instanceVariableNames: 'puntosDeVida'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'aventureros matones'!

!Monstruo methodsFor: 'attack' stamp: 'HAW 20/Sep/2026, 1:54:47 pm (UTC)'!
atacarA: unGuerrero 
	unGuerrero teAtacaMonstruoConEsteDaño: puntosDeVida. ! !


!Monstruo methodsFor: 'tests' stamp: 'HAW 20/Sep/2026, 4:57:34 pm (UTC)'!
tienePuntosDeVida: unaVidaEsperada

	^ puntosDeVida = unaVidaEsperada ! !


!Monstruo methodsFor: 'receive attack' stamp: 'HAW 20/Sep/2026, 3:04:56 pm (UTC)'!
recibisEsteDaño: unDaño 
	
	puntosDeVida := puntosDeVida - unDaño ! !

!Monstruo methodsFor: 'receive attack' stamp: 'HAW 20/Sep/2026, 4:47:31 pm (UTC)'!
recibisGolpeDeGuerreroConBaculoConEstaFuerza: unaFuerza

	self subclassResponsibility! !

!Monstruo methodsFor: 'receive attack' stamp: 'HAW 20/Sep/2026, 4:50:54 pm (UTC)'!
recibisGolpeDeMagoConBaculoConEstaFuerza: unaFuerza

	self subclassResponsibility! !


!classDefinition: #Goblin category: 'aventureros matones'!
Monstruo subclass: #Goblin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'aventureros matones'!

!Goblin methodsFor: 'receive attack' stamp: 'HAW 20/Sep/2026, 4:50:23 pm (UTC)'!
recibisGolpeDeGuerreroConBaculoConEstaFuerza: unaFuerza
	
	puntosDeVida := puntosDeVida *2.! !

!Goblin methodsFor: 'receive attack' stamp: 'HAW 20/Sep/2026, 4:51:26 pm (UTC)'!
recibisGolpeDeMagoConBaculoConEstaFuerza: unaFuerza

	puntosDeVida := 0*pv.
	! !


!Goblin methodsFor: 'init' stamp: 'HAW 20/Sep/2026, 4:54:10 pm (UTC)'!
initialize 

	puntosDeVida := 5*pv.
	! !


!classDefinition: #Ogro category: 'aventureros matones'!
Monstruo subclass: #Ogro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'aventureros matones'!

!Ogro methodsFor: 'receive attack' stamp: 'HAW 20/Sep/2026, 4:50:17 pm (UTC)'!
recibisGolpeDeGuerreroConBaculoConEstaFuerza: unaFuerza
	
	puntosDeVida := puntosDeVida - unaFuerza. ! !

!Ogro methodsFor: 'receive attack' stamp: 'HAW 20/Sep/2026, 4:52:02 pm (UTC)'!
recibisGolpeDeMagoConBaculoConEstaFuerza: unaFuerza

	puntosDeVida := puntosDeVida - unaFuerza.
	! !


!Ogro methodsFor: 'init' stamp: 'HAW 20/Sep/2026, 4:54:22 pm (UTC)'!
initialize
	
	puntosDeVida := 15*pv.! !

TestMyA initialize!