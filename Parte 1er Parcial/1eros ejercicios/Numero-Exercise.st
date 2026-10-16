!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 8/May/2016, 1:48:00 am (UTC)'!
!methodProperties: {}!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 8/May/2016, 1:49:00 am (UTC)'!
!methodProperties: {}!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 24/Sep/2018, 1:21:28 am (UTC)'!
!methodProperties: {}!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 8/May/2016, 1:49:00 am (UTC)'!
!methodProperties: {}!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'gs 31/Aug/2026, 1:54:05 am (UTC)'!
!methodProperties: {}!
// aDivisor

	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic operations' stamp: 'gs 31/Aug/2026, 12:44:47 am (UTC)'!
!methodProperties: {}!
greatestCommonDivisorWith: anEntero

	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 8/May/2016, 1:48:00 am (UTC)'!
!methodProperties: {}!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 24/Sep/2018, 2:37:13 am (UTC)'!
!methodProperties: {}!
negated
	
	^self * (Entero with: -1)! !

!Numero methodsFor: 'arithmetic operations' stamp: 'gs 31/Aug/2026, 12:41:15 am (UTC)'!
!methodProperties: {}!
printOn: aStream
	
	self subclassResponsibility ! !


!Numero methodsFor: 'testing' stamp: 'NR 24/Sep/2018, 2:36:49 am (UTC)'!
!methodProperties: {}!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 8/May/2016, 1:49:00 am (UTC)'!
!methodProperties: {}!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 8/May/2016, 1:49:00 am (UTC)'!
!methodProperties: {}!
isZero

	self subclassResponsibility ! !



!Numero methodsFor: 'comparing' stamp: 'gs 31/Aug/2026, 12:43:56 am (UTC)'!
!methodProperties: {}!
= anObject

	self subclassResponsibility ! !

!Numero methodsFor: 'comparing' stamp: 'gs 31/Aug/2026, 12:42:50 am (UTC)'!
!methodProperties: {}!
hash

	self subclassResponsibility! !


!Numero methodsFor: 'double dispatch' stamp: 'gs 3/Sep/2026, 1:49:54 pm (UTC)'!
!methodProperties: {}!
dividisAUnEntero: unNumeradorEntero

	self subclassResponsibility! !

!Numero methodsFor: 'double dispatch' stamp: 'gs 3/Sep/2026, 1:49:54 pm (UTC)'!
!methodProperties: {}!
dividisAUnaFraccion: unaFraccion

	self subclassResponsibility! !

!Numero methodsFor: 'double dispatch' stamp: 'gs 3/Sep/2026, 1:49:54 pm (UTC)'!
!methodProperties: {}!
igualateAUnEntero: unEntero

	self subclassResponsibility! !

!Numero methodsFor: 'double dispatch' stamp: 'gs 3/Sep/2026, 1:49:44 pm (UTC)'!
!methodProperties: {}!
igualateAUnaFraccion: unaFraccion

	self subclassResponsibility! !

!Numero methodsFor: 'double dispatch' stamp: 'gs 3/Sep/2026, 1:49:54 pm (UTC)'!
!methodProperties: {}!
multiplicatePorUnEntero: unEntero

	self subclassResponsibility! !

!Numero methodsFor: 'double dispatch' stamp: 'gs 3/Sep/2026, 1:49:54 pm (UTC)'!
!methodProperties: {}!
multiplicatePorunaFraccion: unaFraccion

	self subclassResponsibility! !

!Numero methodsFor: 'double dispatch' stamp: 'gs 3/Sep/2026, 1:49:54 pm (UTC)'!
!methodProperties: {}!
restasAUnEntero: anEntero

	self subclassResponsibility! !

!Numero methodsFor: 'double dispatch' stamp: 'gs 3/Sep/2026, 1:49:54 pm (UTC)'!
!methodProperties: {}!
restasAUnaFraccion: aFraccion

	self subclassResponsibility! !

!Numero methodsFor: 'double dispatch' stamp: 'gs 3/Sep/2026, 1:49:54 pm (UTC)'!
!methodProperties: {}!
sumateConUnEntero: unEntero

	self subclassResponsibility! !

!Numero methodsFor: 'double dispatch' stamp: 'gs 3/Sep/2026, 1:49:54 pm (UTC)'!
!methodProperties: {}!
sumateConUnaFraccion: unaFraccion

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 15/Apr/2021, 7:42:02 pm (UTC)'!
!methodProperties: {}!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 15/Apr/2021, 7:42:09 pm (UTC)'!
!methodProperties: {}!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de número inválido!!!!!!'! !



!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'double dispatch' stamp: 'gs 31/Aug/2026, 1:46:02 am (UTC)'!
!methodProperties: {}!
dividisAUnEntero: unNumeradorEntero
	
	^ Fraccion with: unNumeradorEntero over: self.! !

!Entero methodsFor: 'double dispatch' stamp: 'gs 31/Aug/2026, 1:47:38 am (UTC)'!
!methodProperties: {}!
dividisAUnaFraccion: unaFraccion
	
	^Fraccion with: (unaFraccion numerator ) over: ( unaFraccion denominator * self)! !

!Entero methodsFor: 'double dispatch' stamp: 'gs 30/Aug/2026, 9:10:02 pm (UTC)'!
!methodProperties: {}!
igualateAUnEntero: unEntero
	^ value = unEntero integerValue ! !

!Entero methodsFor: 'double dispatch' stamp: 'gs 30/Aug/2026, 8:32:00 pm (UTC)'!
!methodProperties: {}!
multiplicatePorUnEntero: unEntero

	^ self class with: value * unEntero integerValue ! !

!Entero methodsFor: 'double dispatch' stamp: 'gs 31/Aug/2026, 1:28:48 am (UTC)'!
!methodProperties: {}!
multiplicatePorunaFraccion: unaFraccion
	^Fraccion with: (self * unaFraccion numerator) over: (unaFraccion denominator)! !

!Entero methodsFor: 'double dispatch' stamp: 'gs 31/Aug/2026, 2:00:05 am (UTC)'!
!methodProperties: {}!
restasAUnEntero: anEntero 
	^ self class with: anEntero integerValue - value.! !

!Entero methodsFor: 'double dispatch' stamp: 'gs 31/Aug/2026, 2:03:35 am (UTC)'!
!methodProperties: {}!
restasAUnaFraccion: aFraccion 
	^ aFraccion + self negated ! !

!Entero methodsFor: 'double dispatch' stamp: 'gs 30/Aug/2026, 8:32:05 pm (UTC)'!
!methodProperties: {}!
sumateConUnEntero: unEntero

	^ self class with: (value + unEntero integerValue).! !

!Entero methodsFor: 'double dispatch' stamp: 'gs 30/Aug/2026, 10:47:19 pm (UTC)'!
!methodProperties: {}!
sumateConUnaFraccion: unaFraccion
	^unaFraccion sumateConUnEntero: self.! !


!Entero methodsFor: 'aritmetica' stamp: 'gs 31/Aug/2026, 12:39:24 am (UTC)'!
!methodProperties: {}!
negated
	 ^self * (self class with: -1) ! !



!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 8/May/2016, 12:01:00 am (UTC)'!
!methodProperties: {}!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 7/May/2016, 11:17:00 pm (UTC)'!
!methodProperties: {}!
hash

	^value hash! !


!Entero methodsFor: 'testing' stamp: 'NR 24/Sep/2018, 1:17:55 am (UTC)'!
!methodProperties: {}!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 7/May/2016, 11:14:00 pm (UTC)'!
!methodProperties: {}!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 7/May/2016, 11:12:00 pm (UTC)'!
!methodProperties: {}!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations' stamp: 'gs 31/Aug/2026, 1:10:08 am (UTC)'!
!methodProperties: {}!
* aMultiplier 
	
	^aMultiplier multiplicatePorUnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'gs 31/Aug/2026, 1:15:17 am (UTC)'!
!methodProperties: {}!
+ anAdder 
	
	^anAdder sumateConUnEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'gs 31/Aug/2026, 1:59:09 am (UTC)'!
!methodProperties: {}!
- aSubtrahend 
	
	^ aSubtrahend restasAUnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'gs 31/Aug/2026, 1:46:21 am (UTC)'!
!methodProperties: {}!
/ aDivisor 
	
	^ aDivisor dividisAUnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'gs 31/Aug/2026, 1:54:46 am (UTC)'!
!methodProperties: {}!
// aDivisor 
	^ self class with: (value // aDivisor integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 24/Sep/2018, 11:47:50 am (UTC)'!
!methodProperties: {}!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 8/May/2016, 12:00:00 am (UTC)'!
!methodProperties: {}!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'initialization' stamp: 'gs 31/Aug/2026, 12:49:12 am (UTC)'!
!methodProperties: {}!
initializeWith: aValue
	
	value := aValue! !



!Entero methodsFor: 'value' stamp: 'HernanWilkinson 8/May/2016, 12:02:00 am (UTC)'!
!methodProperties: {}!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 24/Sep/2018, 11:53:19 am (UTC)'!
!methodProperties: {}!
printOn: aStream

	aStream print: value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 15/Apr/2021, 7:42:24 pm (UTC)'!
!methodProperties: {}!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'gs 31/Aug/2026, 1:49:37 am (UTC)'!
!methodProperties: {}!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initializeWith: aValue! !


!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'aritmetica' stamp: 'gs 31/Aug/2026, 12:54:35 am (UTC)'!
!methodProperties: {}!
negated
	^self class with: (numerator * (Entero with: -1)) over: denominator ! !


!Fraccion methodsFor: 'double dispatch' stamp: 'gs 31/Aug/2026, 1:40:25 am (UTC)'!
!methodProperties: {}!
dividisAUnEntero: unEntero
	
	^self class with: (unEntero * denominator ) over: ( numerator)! !

!Fraccion methodsFor: 'double dispatch' stamp: 'gs 3/Sep/2026, 1:49:33 pm (UTC)'!
!methodProperties: {}!
dividisAUnaFraccion: aFraccion 
	^ self class with: (aFraccion numerator * denominator) over: (aFraccion denominator * numerator) ! !

!Fraccion methodsFor: 'double dispatch' stamp: 'gs 30/Aug/2026, 9:17:43 pm (UTC)'!
!methodProperties: {}!
igualateAUnaFraccion: unaFraccion
	^(numerator * unaFraccion denominator) = (denominator * unaFraccion 
	numerator)! !

!Fraccion methodsFor: 'double dispatch' stamp: 'gs 31/Aug/2026, 1:27:13 am (UTC)'!
!methodProperties: {}!
multiplicatePorUnEntero: unEntero
	^self class with: (numerator * unEntero) over: (denominator)! !

!Fraccion methodsFor: 'double dispatch' stamp: 'gs 30/Aug/2026, 8:07:44 pm (UTC)'!
!methodProperties: {}!
multiplicatePorunaFraccion: unaFraccion
	
	^self class with: (numerator * unaFraccion numerator) over: 
	(denominator * unaFraccion denominator)! !

!Fraccion methodsFor: 'double dispatch' stamp: 'gs 31/Aug/2026, 2:02:27 am (UTC)'!
!methodProperties: {}!
restasAUnEntero: anEntero 
	^ anEntero + self negated! !

!Fraccion methodsFor: 'double dispatch' stamp: 'gs 31/Aug/2026, 2:01:34 am (UTC)'!
!methodProperties: {}!
restasAUnaFraccion: aFraccion 
	^ aFraccion + self negated! !

!Fraccion methodsFor: 'double dispatch' stamp: 'gs 31/Aug/2026, 1:26:14 am (UTC)'!
!methodProperties: {}!
sumateConUnEntero: unEntero
	^ self class with: (numerator + (unEntero * denominator)) over: denominator. ! !

!Fraccion methodsFor: 'double dispatch' stamp: 'gs 30/Aug/2026, 8:46:52 pm (UTC)'!
!methodProperties: {}!
sumateConUnaFraccion: unaFraccion
	| newNumerator newDenominator |		
	
	newNumerator := (numerator * unaFraccion denominator) + 
	(denominator * unaFraccion numerator).
	
	newDenominator := denominator * unaFraccion denominator.

	^ self class with: newNumerator over: newDenominator! !



!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 7/May/2016, 11:42:00 pm (UTC)'!
!methodProperties: {}!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 7/May/2016, 11:50:00 pm (UTC)'!
!methodProperties: {}!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'testing' stamp: 'NR 24/Sep/2018, 2:41:38 am (UTC)'!
!methodProperties: {}!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 8/May/2016, 1:51:00 am (UTC)'!
!methodProperties: {}!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 8/May/2016, 1:51:00 am (UTC)'!
!methodProperties: {}!
isZero
	
	^false! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'gs 31/Aug/2026, 1:08:16 am (UTC)'!
!methodProperties: {}!
* aMultiplier 
	
	^aMultiplier multiplicatePorunaFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'gs 31/Aug/2026, 1:08:38 am (UTC)'!
!methodProperties: {}!
+ anAdder 
	
	^ anAdder sumateConUnaFraccion:  self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'gs 31/Aug/2026, 2:00:34 am (UTC)'!
!methodProperties: {}!
- aSubtrahend 
	
	^ aSubtrahend restasAUnaFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'gs 31/Aug/2026, 1:09:49 am (UTC)'!
!methodProperties: {}!
/ aDivisor 
	
	^ aDivisor dividisAUnaFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'gs 31/Aug/2026, 12:45:19 am (UTC)'!
!methodProperties: {}!
greatestCommonDivisorWith: anEntero 

	self error: 'Tipo de número no soportado'! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 8/May/2016, 1:54:00 am (UTC)'!
!methodProperties: {}!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 8/May/2016, 12:56:00 am (UTC)'!
!methodProperties: {}!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 8/May/2016, 12:56:00 am (UTC)'!
!methodProperties: {}!
numerator

	^ numerator! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 24/Sep/2018, 11:54:46 am (UTC)'!
!methodProperties: {}!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!


!Fraccion class methodsFor: 'intance creation' stamp: 'NR 24/Sep/2018, 2:45:19 am (UTC)'!
!methodProperties: {}!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !


!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo negativeOneHalf'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/May/2016, 11:11:00 pm (UTC)'!
!methodProperties: {}!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/May/2016, 11:12:00 pm (UTC)'!
!methodProperties: {}!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/May/2016, 11:13:00 pm (UTC)'!
!methodProperties: {}!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/May/2016, 11:13:00 pm (UTC)'!
!methodProperties: {}!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/May/2016, 11:14:00 pm (UTC)'!
!methodProperties: {}!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/May/2016, 11:18:00 pm (UTC)'!
!methodProperties: {}!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/May/2016, 11:20:00 pm (UTC)'!
!methodProperties: {}!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'gs 31/Aug/2026, 1:00:42 am (UTC)'!
!methodProperties: {}!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Fraccion with: (Entero with: 7) over: (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/May/2016, 11:38:00 pm (UTC)'!
!methodProperties: {}!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/Sep/2019, 12:11:26 am (UTC)'!
!methodProperties: {}!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'gs 31/Aug/2026, 1:00:42 am (UTC)'!
!methodProperties: {}!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Fraccion with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/May/2016, 11:52:00 pm (UTC)'!
!methodProperties: {}!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/Sep/2019, 12:12:46 am (UTC)'!
!methodProperties: {}!
test10AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/May/2016, 11:56:00 pm (UTC)'!
!methodProperties: {}!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 12:07:00 am (UTC)'!
!methodProperties: {}!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/Sep/2019, 12:26:23 am (UTC)'!
!methodProperties: {}!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: (twoFifth) * (fiveHalfs) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/Sep/2019, 12:13:21 am (UTC)'!
!methodProperties: {}!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 12:07:00 am (UTC)'!
!methodProperties: {}!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/Sep/2019, 12:13:30 am (UTC)'!
!methodProperties: {}!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 12:50:00 am (UTC)'!
!methodProperties: {}!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 12:52:00 am (UTC)'!
!methodProperties: {}!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/Sep/2019, 12:14:16 am (UTC)'!
!methodProperties: {}!
test14NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 12:57:00 am (UTC)'!
!methodProperties: {}!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 24/Sep/2020, 5:23:47 am (UTC)'!
!methodProperties: {}!
test15NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 12:59:00 am (UTC)'!
!methodProperties: {}!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'gs 31/Aug/2026, 1:00:42 am (UTC)'!
!methodProperties: {}!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Fraccion with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 1:38:00 am (UTC)'!
!methodProperties: {}!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'gs 31/Aug/2026, 1:00:42 am (UTC)'!
!methodProperties: {}!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Fraccion with: one over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 1:39:00 am (UTC)'!
!methodProperties: {}!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 1:40:00 am (UTC)'!
!methodProperties: {}!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 1:42:00 am (UTC)'!
!methodProperties: {}!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 1:42:00 am (UTC)'!
!methodProperties: {}!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 1:43:00 am (UTC)'!
!methodProperties: {}!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 1:46:00 am (UTC)'!
!methodProperties: {}!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 1:46:00 am (UTC)'!
!methodProperties: {}!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 1:50:00 am (UTC)'!
!methodProperties: {}!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 8/May/2016, 1:50:00 am (UTC)'!
!methodProperties: {}!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 15/Apr/2021, 7:45:35 pm (UTC)'!
!methodProperties: {}!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 24/Sep/2018, 2:47:41 am (UTC)'!
!methodProperties: {}!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 24/Sep/2018, 2:48:00 am (UTC)'!
!methodProperties: {}!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 24/Sep/2018, 11:48:05 am (UTC)'!
!methodProperties: {}!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 24/Sep/2018, 11:48:08 am (UTC)'!
!methodProperties: {}!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 24/Sep/2018, 2:48:48 am (UTC)'!
!methodProperties: {}!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 24/Sep/2018, 2:49:01 am (UTC)'!
!methodProperties: {}!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 24/Sep/2018, 11:48:14 am (UTC)'!
!methodProperties: {}!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 24/Sep/2018, 2:49:23 am (UTC)'!
!methodProperties: {}!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 24/Sep/2018, 2:49:32 am (UTC)'!
!methodProperties: {}!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 24/Sep/2018, 2:49:39 am (UTC)'!
!methodProperties: {}!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 24/Sep/2018, 2:49:47 am (UTC)'!
!methodProperties: {}!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 24/Sep/2018, 2:49:55 am (UTC)'!
!methodProperties: {}!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 24/Sep/2018, 2:50:03 am (UTC)'!
!methodProperties: {}!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 24/Sep/2018, 2:50:11 am (UTC)'!
!methodProperties: {}!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 24/Sep/2018, 2:50:17 am (UTC)'!
!methodProperties: {}!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'gs 31/Aug/2026, 1:55:42 am (UTC)'!
!methodProperties: {}!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	negativeOneHalf := oneHalf negated. 
	! !
