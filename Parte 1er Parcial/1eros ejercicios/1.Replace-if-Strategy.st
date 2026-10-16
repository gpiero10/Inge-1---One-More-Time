!classDefinition: #Motor category: #'1.Replace-if-Strategy'!
Object subclass: #Motor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!Motor methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 1:31:11 am (UTC)'!
!methodProperties: {}!
calcularNuevaVelocidad: curSpeed

	self subclassResponsibility! !


!classDefinition: #MotorElectrico category: #'1.Replace-if-Strategy'!
Motor subclass: #MotorElectrico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!MotorElectrico methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 4:41:01 pm (UTC)'!
!methodProperties: {}!
calcularNuevaVelocidad: curSpeed 
	"anAutomobile"
	^curSpeed + ((curSpeed + (5 * kilometer / hour))* 2)! !


!classDefinition: #MotorGasolina category: #'1.Replace-if-Strategy'!
Motor subclass: #MotorGasolina
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!MotorGasolina methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 4:41:27 pm (UTC)'!
!methodProperties: {}!
calcularNuevaVelocidad: curSpeed 
	"anAutomobile"
	^ curSpeed + (10 * kilometer / hour)! !


!classDefinition: #MotorJetFueled category: #'1.Replace-if-Strategy'!
Motor subclass: #MotorJetFueled
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!MotorJetFueled methodsFor: 'as yet unclassified' stamp: 'gs 30/Aug/2026, 4:42:52 pm (UTC)'!
!methodProperties: {}!
calcularNuevaVelocidad: curSpeed 
	"anAutomobile"
	
	^ curSpeed + (((curSpeed amount + 1) ^ 2) * kilometer / hour)! !
