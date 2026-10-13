!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HAW 9/Oct/2026, 11:56:47 pm (UTC)'!
value 

	^ value ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 9/Oct/2026, 11:55:39 pm (UTC)'!
acumulateEnEsteBalance: unBalanceAcumuladoParcial

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 17/Oct/2019, 6:22:00 am (UTC)'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 13/Jul/2011, 9:45:00 pm (UTC)'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'balance' stamp: 'HAW 9/Oct/2026, 11:55:33 pm (UTC)'!
acumulateEnEsteBalance: unBalanceAcumuladoParcial 
	^ unBalanceAcumuladoParcial + value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 13/Jul/2011, 9:38:00 pm (UTC)'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 13/Jul/2011, 9:46:00 pm (UTC)'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 9/Oct/2026, 11:55:20 pm (UTC)'!
acumulateEnEsteBalance: unBalanceAcumuladoParcial 
	^ unBalanceAcumuladoParcial - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 13/Jul/2011, 9:33:00 pm (UTC)'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #CuentaBancaria category: #'Portfolio-Ejercicio'!
Object subclass: #CuentaBancaria
	instanceVariableNames: 'activos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!CuentaBancaria methodsFor: 'transactions' stamp: 'HAW 13/Oct/2026, 3:17:53 pm (UTC)'!
transactions

	self subclassResponsibility! !


!CuentaBancaria methodsFor: 'hasRegistered' stamp: 'HAW 13/Oct/2026, 3:18:08 pm (UTC)'!
hasRegistered: aWithdraw

	self subclassResponsibility! !


!CuentaBancaria methodsFor: 'balance' stamp: 'HAW 13/Oct/2026, 3:18:17 pm (UTC)'!
balance

	self subclassResponsibility! !


!CuentaBancaria methodsFor: 'añadir' stamp: 'HAW 13/Oct/2026, 3:18:46 pm (UTC)'!
add: anAsset
	
	self subclassResponsibility ! !


!CuentaBancaria methodsFor: 'init' stamp: 'HAW 13/Oct/2026, 3:21:03 pm (UTC)'!
initialize

	activos := OrderedCollection new.! !


!CuentaBancaria methodsFor: 'tieneCuentaAgregada' stamp: 'HAW 13/Oct/2026, 4:04:50 pm (UTC)'!
tieneEstaCuentaRegistrada: unaCuentaBancaria

	self subclassResponsibility! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
CuentaBancaria subclass: #Portfolio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'HAW 13/Oct/2026, 3:22:57 pm (UTC)'!
balance
	
	^ activos inject: 0 into: [:acumulado :aPortfolio | acumulado + aPortfolio balance ]! !


!Portfolio methodsFor: 'añadir' stamp: 'HAW 13/Oct/2026, 4:50:48 pm (UTC)'!
add: unaCuentaBancariaAAgregar
	
	(self = unaCuentaBancariaAAgregar) ifTrue: [self error: self class errorDeAgregarseAsiMismo].
	(activos includes: unaCuentaBancariaAAgregar) ifTrue: [self error: self class errorDeAgregarUnaCuentaYaAgregada].
	(activos anySatisfy: [:unaCuenta | unaCuenta tieneEstaCuentaRegistrada: unaCuentaBancariaAAgregar]) 
		ifTrue: [self error: self class errorDeAgregarUnaCuentaYaAgregada ].
	(activos anySatisfy: [:unaCuenta | unaCuentaBancariaAAgregar tieneEstaCuentaRegistrada: unaCuenta]) 
		ifTrue: [self error: self class errorDeAgregarUnaCuentaYaAgregada ].
	
	
	
	activos add: unaCuentaBancariaAAgregar ! !


!Portfolio methodsFor: 'hasRegistered' stamp: 'HAW 13/Oct/2026, 3:23:08 pm (UTC)'!
hasRegistered: aWithdraw 
	
	^ (activos anySatisfy: [:anAccount | anAccount hasRegistered: aWithdraw])
		! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 13/Oct/2026, 3:23:34 pm (UTC)'!
transactions
	|transactions|
	transactions := Set new.
	activos do: [:anAccount | transactions addAll: (anAccount transactions)].
	
	^ transactions. 
	! !


!Portfolio methodsFor: 'tieneCuentaAgregada' stamp: 'HAW 13/Oct/2026, 5:24:16 pm (UTC)'!
tenesEstaCuentaReceptivaRegistrada: aReceptiveAccount 
	
	^ activos includes: aReceptiveAccount ! !

!Portfolio methodsFor: 'tieneCuentaAgregada' stamp: 'HAW 13/Oct/2026, 6:07:05 pm (UTC)'!
tenesEstePortfolioRegistrado: aPortfolio 
	
	"^ (activos includes: aPortfolio) or: [self = aPortfolio ]. "
	^ (activos anySatisfy: [:unaCuenta | unaCuenta tenesEstePortfolioRegistrado: aPortfolio]) or: [self = aPortfolio ].! !

!Portfolio methodsFor: 'tieneCuentaAgregada' stamp: 'HAW 13/Oct/2026, 5:56:45 pm (UTC)'!
tieneEstaCuentaRegistrada: unaCuentaBancaria 
	
	(unaCuentaBancaria isKindOf: Portfolio) 
	ifTrue: [ ^ unaCuentaBancaria tenesEstePortfolioRegistrado: self]
	 ifFalse: [^ activos anySatisfy: [:unActivo | unActivo tieneEstaCuentaRegistrada: unaCuentaBancaria ] ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'msg' stamp: 'HAW 13/Oct/2026, 3:43:49 pm (UTC)'!
errorDeAgregarUnaCuentaYaAgregada
	
	^ 'Libido'! !

!Portfolio class methodsFor: 'msg' stamp: 'HAW 13/Oct/2026, 3:38:03 pm (UTC)'!
errorDeAgregarseAsiMismo
	
	^ 'Mal'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
CuentaBancaria subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 17/Oct/2019, 6:06:56 pm (UTC)'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 13/Jul/2011, 9:37:00 pm (UTC)'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 13/Jul/2011, 9:37:00 pm (UTC)'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 9/Oct/2026, 11:55:06 pm (UTC)'!
balance

	^ transactions inject: 0 into: [:acumulado :aTransaction | aTransaction acumulateEnEsteBalance: acumulado].
	
	! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 17/Oct/2019, 6:28:43 am (UTC)'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'tieneCuentaAgregada' stamp: 'HAW 13/Oct/2026, 5:24:09 pm (UTC)'!
tenesEstaCuentaReceptivaRegistrada: aReceptiveAccount 

	^ self = aReceptiveAccount ! !

!ReceptiveAccount methodsFor: 'tieneCuentaAgregada' stamp: 'HAW 13/Oct/2026, 5:24:05 pm (UTC)'!
tieneEstaCuentaRegistrada: unaCuentaBancaria

	
	^ unaCuentaBancaria tenesEstaCuentaReceptivaRegistrada: self.! !


!classDefinition: #PortfolioTests category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 10/Oct/2026, 4:57:45 pm (UTC)'!
test01PortfolioVacioTieneBalanceCero
	|account portofolio|
	portofolio := Portfolio new.
	
	
	self assert: portofolio balance equals: 0.! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 3:24:08 pm (UTC)'!
test02PortfolioTieneBalanceIgualDeSuUnicaCuenta
	|account portofolio|
	portofolio := Portfolio new.
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	portofolio add: account. 
	
	self assert: portofolio balance equals: 100.! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 3:24:17 pm (UTC)'!
test03PortfolioTieneBalanceTotalIgualAlDeTodasSusCuentas
	|account portofolio anotherAccount |
	portofolio := Portfolio new.
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
	
	anotherAccount := ReceptiveAccount new.
	Deposit register: 25 on: account.
	
	portofolio add: account; add: anotherAccount. 
	
	self assert: portofolio balance equals: 75.! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 3:25:20 pm (UTC)'!
test04PortofolioTieneBalanceIgualAlDeSuUnicoPortfolio
	|account portofolio anotherPortfolio |
	portofolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
	
	anotherPortfolio add: account. 
	
	portofolio add: anotherPortfolio. 
	
	self assert: portofolio balance equals: 50.! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 3:25:35 pm (UTC)'!
test05PortofolioTieneBalanceIgualAlDeTodosSusPortfolios
	|account anotherAccount portofolio anotherPortfolio aThirdPortfolio|
	portofolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	aThirdPortfolio :=  Portfolio new.
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new. 
	Withdraw register: 50 on: anotherAccount.
	
	anotherPortfolio add: account. 
	aThirdPortfolio add: anotherAccount. 
	
	portofolio add: anotherPortfolio; add: aThirdPortfolio. 
	
	self assert: portofolio balance equals: 50.! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 10/Oct/2026, 5:53:10 pm (UTC)'!
test06PortfolioVacioNoTieneTransacciones
	|account portfolio aWithdraw|
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	aWithdraw := Withdraw register: 50 on: account. 
	
	self deny: (portfolio hasRegistered: aWithdraw). 
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 3:24:38 pm (UTC)'!
test07PortfolioTieneRegistradaLaTransaccionDeSuUnicaCuenta
	|account portfolio aWithdraw|
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	aWithdraw := Withdraw register: 50 on: account. 
	
	portfolio add: account.
	
	self assert: (portfolio hasRegistered: aWithdraw). 
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 3:24:49 pm (UTC)'!
test08PortfolioTieneRegistradaLasTransaccionesDeSusPortfolios
	|portfolio anotherPortfolio account aDeposit aWithdraw |
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	aDeposit := Deposit register: 100 on: account.
	aWithdraw := Withdraw register: 50 on: account.
	
	anotherPortfolio add: account. 
	
	portfolio add: anotherPortfolio. 
	
	self assert: (portfolio hasRegistered: aWithdraw).
	self assert: (portfolio hasRegistered: aDeposit).
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 10/Oct/2026, 9:23:11 pm (UTC)'!
test09PortfolioVacioNoTieneTransacciones
	|portfolio |
	portfolio := Portfolio new.
	
	
	self assert: (portfolio transactions) equals: Set new.
	
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 3:24:58 pm (UTC)'!
test10PortfolioTieneRegistradasLasTransaccionesDeSusCuentas
	|account portfolio aWithdraw aDeposit|
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	aWithdraw := Withdraw register: 50 on: account. 
	aDeposit := Deposit register: 150 on: account.
	
	portfolio add: account.
	
	self assert: (portfolio transactions) equals: (Set with: aDeposit with: aWithdraw).
	
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 3:25:06 pm (UTC)'!
test11PortfolioTieneRegistradasLasTransaccionesDeSusPortfolios
	|account portfolio anotherPortfolio aWithdraw aDeposit|
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	aWithdraw := Withdraw register: 50 on: account. 
	aDeposit := Deposit register: 150 on: account.
	
	anotherPortfolio add: account.
	portfolio add: anotherPortfolio. 
	
	self assert: (portfolio transactions) equals: (Set with: aDeposit with: aWithdraw).
	
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 3:39:59 pm (UTC)'!
test12PortofolioNoSePuedeAgregarASiMismo
	|portfolio |
	portfolio := Portfolio new.
	
	self should: [portfolio add: portfolio]
		raise:  Error
		withExceptionDo: [:error | self assert: (Portfolio errorDeAgregarseAsiMismo) equals: error messageText ].
			 
	
	
	
	
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 3:45:51 pm (UTC)'!
test13PortfolioNoPuedeAgregarUnaCuentaBancariaYaAgregada
	|portfolio anAccount|
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	portfolio add: anAccount.
	
	self should: [portfolio add: anAccount]
		raise:  Error
		withExceptionDo: [:error | self assert: (Portfolio errorDeAgregarUnaCuentaYaAgregada ) equals: error messageText ].
			 
	
	
	
	
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 4:06:52 pm (UTC)'!
test14PortfolioNoPuedeAgregarUnaCuentaQueYaEstaAgregadaEnUnoDeSusPortfolios
	|portfolio anAccount anotherPortfolio|
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	anotherPortfolio add: anAccount.
	
	portfolio add: anotherPortfolio.
	
	self should: [portfolio add: anAccount]
		raise:  Error
		withExceptionDo: [:error | self assert: (Portfolio errorDeAgregarUnaCuentaYaAgregada ) equals: error messageText ].
			 
	
	
	
	
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 4:25:55 pm (UTC)'!
test15PortfolioNoPuedeAgregarOtroPortfolioQuePoseeUnaCuentaQueYaAgrego
	|portfolio anAccount anotherPortfolio|
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	anotherPortfolio add: anAccount.
	
	portfolio add: anAccount.
	
	self should: [portfolio add: anotherPortfolio.]
		raise:  Error
		withExceptionDo: [:error | self assert: (Portfolio errorDeAgregarUnaCuentaYaAgregada ) equals: error messageText ].
			 
	
	
	
	
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 5:40:54 pm (UTC)'!
test16PortfolioNoPuedeAgregarOtroPortfolioQuePoseeUnPortfolioConUnaCuentaQueYaAgrego
	"p
	p1      ac
	 p2
	ac"
	
	|portfolio anAccount anotherPortfolio otherPortfolio|
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	otherPortfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	otherPortfolio add: anAccount.
	anotherPortfolio add: otherPortfolio.
	
	portfolio add: anotherPortfolio.
	
	self should: [portfolio add: anAccount]
		raise:  Error
		withExceptionDo: [:error | self assert: (Portfolio errorDeAgregarUnaCuentaYaAgregada ) equals: error messageText ].! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 5:40:10 pm (UTC)'!
test17PortfolioNoPuedeAgregarPortfolioQuePoseeunaCuentaQuePoseeUNoDeSusPortfolios
	"p
	p1 p2
	 ac"
	|portfolio anAccount anotherPortfolio otherPortfolio|
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	otherPortfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	
	otherPortfolio add: anAccount.
	anotherPortfolio add: anAccount.
	
	portfolio add: anotherPortfolio .
	
	self should: [portfolio add: otherPortfolio ]
		raise:  Error
		withExceptionDo: [:error | self assert: (Portfolio errorDeAgregarUnaCuentaYaAgregada ) equals: error messageText ].! !

!PortfolioTests methodsFor: 'tests' stamp: 'HAW 13/Oct/2026, 5:45:06 pm (UTC)'!
test18
	"p
	p1 p2
	  p3"
	|portfolio portfolioBenArfiano anotherPortfolio otherPortfolio|
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	otherPortfolio := Portfolio new.
	
	portfolioBenArfiano := Portfolio new.
	
	otherPortfolio add: portfolioBenArfiano.
	anotherPortfolio add: portfolioBenArfiano.
	
	portfolio add: anotherPortfolio .
	
	self should: [portfolio add: otherPortfolio ]
		raise:  Error
		withExceptionDo: [:error | self assert: (Portfolio errorDeAgregarUnaCuentaYaAgregada ) equals: error messageText ].! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 2/Nov/2020, 8:13:44 pm (UTC)'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 2/Nov/2020, 8:13:48 pm (UTC)'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 2/Nov/2020, 8:13:52 pm (UTC)'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 23/May/2019, 6:20:32 pm (UTC)'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 23/May/2019, 6:20:46 pm (UTC)'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 17/May/2021, 8:29:53 pm (UTC)'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 2/Nov/2020, 8:14:01 pm (UTC)'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !
