!classDefinition: #Account category: #'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'testing' stamp: 'HAW 25/May/2019, 3:23:47 pm (UTC)'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 25/May/2019, 3:24:25 pm (UTC)'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 25/May/2019, 3:23:40 pm (UTC)'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 25/May/2019, 3:23:27 pm (UTC)'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 25/May/2019, 3:23:15 pm (UTC)'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 25/May/2019, 3:24:04 pm (UTC)'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'balance' stamp: 'HAW 25/May/2019, 2:19:36 pm (UTC)'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 25/May/2019, 2:42:55 pm (UTC)'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 25/May/2019, 2:38:32 pm (UTC)'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 25/May/2019, 2:49:20 pm (UTC)'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 25/May/2019, 3:05:04 pm (UTC)'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 25/May/2019, 2:49:06 pm (UTC)'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 25/May/2019, 3:19:20 pm (UTC)'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 25/May/2019, 3:17:31 pm (UTC)'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 25/May/2019, 3:03:18 pm (UTC)'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 25/May/2019, 3:02:59 pm (UTC)'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 25/May/2019, 3:20:56 pm (UTC)'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 25/May/2019, 2:28:29 pm (UTC)'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 29/May/2019, 7:24:54 pm (UTC)'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 25/May/2019, 3:17:31 pm (UTC)'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 25/May/2019, 3:20:36 pm (UTC)'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 25/May/2019, 2:48:34 pm (UTC)'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'reports' stamp: 'HAW 24/Oct/2026, 12:34:41 pm (UTC)'!
accept: aReportBuffer 
	
	accounts do: [:anAccount | anAccount accept: aReportBuffer].
	aReportBuffer visitPortfolio: self. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'msg' stamp: 'HAW 13/Oct/2026, 3:43:49 pm (UTC)'!
errorDeAgregarUnaCuentaYaAgregada
	
	^ 'Libido'! !

!Portfolio class methodsFor: 'msg' stamp: 'HAW 13/Oct/2026, 3:38:03 pm (UTC)'!
errorDeAgregarseAsiMismo
	
	^ 'Mal'! !


!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 25/May/2019, 2:48:55 pm (UTC)'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 25/May/2019, 2:18:21 pm (UTC)'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 25/May/2019, 2:23:59 pm (UTC)'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 13/Jul/2011, 9:35:00 pm (UTC)'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 25/May/2019, 2:38:52 pm (UTC)'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 13/Jul/2011, 9:37:00 pm (UTC)'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 13/Jul/2011, 9:37:00 pm (UTC)'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 25/May/2019, 2:24:46 pm (UTC)'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 21/Oct/2019, 9:55:56 pm (UTC)'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 25/May/2019, 2:54:51 pm (UTC)'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 25/May/2019, 3:03:32 pm (UTC)'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'reports' stamp: 'HAW 24/Oct/2026, 12:34:21 pm (UTC)'!
accept: aReportBuffer 
	

	transactions do: [ :aTransaction | aTransaction accept: aReportBuffer ].
	aReportBuffer visitReceptiveAccount: self.! !


!ReceptiveAccount methodsFor: 'transfer net' stamp: 'HAW 23/Oct/2026, 8:15:22 pm (UTC)'!
reportTransferOnThisReport: anAccountReporter 
	
	transactions do: [:aTransaction | aTransaction reportTransferOnThisReport: anAccountReporter].! !


!classDefinition: #AccountTransaction category: #'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 12/Sep/2011, 3:25:00 pm (UTC)'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 25/May/2019, 2:25:39 pm (UTC)'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HAW 22/Oct/2026, 5:24:06 pm (UTC)'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 13/Jul/2011, 9:45:00 pm (UTC)'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'balance' stamp: 'HAW 25/May/2019, 2:25:02 pm (UTC)'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 13/Jul/2011, 9:38:00 pm (UTC)'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'HAW 24/Oct/2026, 12:33:43 pm (UTC)'!
accept: aReportBuffer 
	aReportBuffer visitDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 13/Jul/2011, 9:38:00 pm (UTC)'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: #'Portfolio-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transferencia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferLeg methodsFor: 'initialization' stamp: 'HAW 22/Oct/2026, 6:07:11 pm (UTC)'!
initializeFor: aValue ofATransaction: aTransaction 

	
	transferencia := aTransaction. ! !


!TransferLeg methodsFor: 'getter' stamp: 'HAW 22/Oct/2026, 5:42:13 pm (UTC)'!
transfer
	^ transferencia ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: #'Portfolio-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'HAW 22/Oct/2026, 5:40:42 pm (UTC)'!
for: aValue ofATransaction: aTransaction 

	^ self new initializeFor: aValue ofATransaction: aTransaction ! !

!TransferLeg class methodsFor: 'instance creation' stamp: 'HAW 22/Oct/2026, 5:40:42 pm (UTC)'!
ofATransaction: aTransaction register: aValue on: account

	| transaction |
	
	transaction := self for: aValue ofATransaction: aTransaction .
	account register: transaction.
		
	^ transaction! !


!classDefinition: #DepositLeg category: #'Portfolio-Solucion'!
TransferLeg subclass: #DepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!DepositLeg methodsFor: 'balance' stamp: 'HAW 22/Oct/2026, 6:08:32 pm (UTC)'!
affectBalance: aBalance

	^aBalance + self value ! !


!DepositLeg methodsFor: 'value' stamp: 'HAW 22/Oct/2026, 6:08:27 pm (UTC)'!
value

	^ transferencia value! !


!DepositLeg methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:34:53 pm (UTC)'!
accept: aReportBuffer 
	
	aReportBuffer visitDepositLeg: self. ! !

!DepositLeg methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:34:53 pm (UTC)'!
reportTransferOnThisReport: anAccountReporter 
	
	anAccountReporter visitDepositLeg: self.! !


!classDefinition: #WithdrawLeg category: #'Portfolio-Solucion'!
TransferLeg subclass: #WithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!WithdrawLeg methodsFor: 'balance' stamp: 'HAW 22/Oct/2026, 6:08:13 pm (UTC)'!
affectBalance: aBalance

	^aBalance - self value! !


!WithdrawLeg methodsFor: 'value' stamp: 'HAW 22/Oct/2026, 6:08:07 pm (UTC)'!
value

	^ transferencia value! !


!WithdrawLeg methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:33:57 pm (UTC)'!
accept: aReportBuffer 
	
	aReportBuffer visitWithdrawLeg: self. ! !

!WithdrawLeg methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:33:57 pm (UTC)'!
reportTransferOnThisReport: anAccountReporter 
	
	anAccountReporter visitWithdrawLeg: self.! !


!classDefinition: #Withdraw category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 13/Jul/2011, 9:46:00 pm (UTC)'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 9/Oct/2026, 11:55:20 pm (UTC)'!
acumulateEnEsteBalance: unBalanceAcumuladoParcial 
	^ unBalanceAcumuladoParcial - value! !

!Withdraw methodsFor: 'balance' stamp: 'HAW 25/May/2019, 2:25:15 pm (UTC)'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 13/Jul/2011, 9:33:00 pm (UTC)'!
value

	^ value! !


!Withdraw methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:34:07 pm (UTC)'!
accept: aReportBuffer 
	
	aReportBuffer visitWithdraw: self. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 13/Jul/2011, 9:33:00 pm (UTC)'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #AccountVisitor category: #'Portfolio-Solucion'!
Object subclass: #AccountVisitor
	instanceVariableNames: 'reportedAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountVisitor methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:45:47 pm (UTC)'!
visitDeposit: aDeposit

	self subclassResponsibility! !

!AccountVisitor methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:45:47 pm (UTC)'!
visitDepositLeg: aDepositLeg

	self subclassResponsibility! !

!AccountVisitor methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:45:47 pm (UTC)'!
visitPortfolio: aPortfolio

	self subclassResponsibility! !

!AccountVisitor methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:45:47 pm (UTC)'!
visitReceptiveAccount: aReceptiveAccount

	self subclassResponsibility! !

!AccountVisitor methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:45:47 pm (UTC)'!
visitWithdraw: aWithdraw

	self subclassResponsibility! !

!AccountVisitor methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:45:47 pm (UTC)'!
visitWithdrawLeg: aWithdrawLeg

	self subclassResponsibility! !


!AccountVisitor methodsFor: 'report' stamp: 'HAW 24/Oct/2026, 12:45:51 pm (UTC)'!
report

	self subclassResponsibility! !


!classDefinition: #AccountSummaryReporter category: #'Portfolio-Solucion'!
AccountVisitor subclass: #AccountSummaryReporter
	instanceVariableNames: 'reports'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryReporter methodsFor: 'init' stamp: 'HAW 23/Oct/2026, 6:33:40 pm (UTC)'!
initializeOn: anAccount 
	
	reportedAccount := anAccount.
	reports := OrderedCollection new.! !


!AccountSummaryReporter methodsFor: 'report' stamp: 'HAW 24/Oct/2026, 12:31:11 pm (UTC)'!
report
	
	reportedAccount accept: self.
	
	^ reports ! !


!AccountSummaryReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:33:43 pm (UTC)'!
visitDeposit: aDeposit 

	reports add: 'Depósito por ', (aDeposit value asString), '.'! !

!AccountSummaryReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:34:53 pm (UTC)'!
visitDepositLeg: aDepositLeg 
	
	reports add: 'Entrada por transferencia de ', (aDepositLeg value asString) , '.'! !

!AccountSummaryReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:34:41 pm (UTC)'!
visitPortfolio: aPortfolio 
	
	reports add: 'Balance = ', aPortfolio balance asString , '.'.! !

!AccountSummaryReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:34:21 pm (UTC)'!
visitReceptiveAccount: aReceptiveAccount 
	
	reports add: 'Balance = ', aReceptiveAccount balance asString , '.'.! !

!AccountSummaryReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:34:07 pm (UTC)'!
visitWithdraw: aWithdraw 
	
	reports add: 'Extráccion por ', (aWithdraw value asString), '.'.! !

!AccountSummaryReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:33:57 pm (UTC)'!
visitWithdrawLeg: aWithdrawLeg 
	
	reports add: 'Salida por transferencia de ', (aWithdrawLeg value asString) , '.'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryReporter class' category: #'Portfolio-Solucion'!
AccountSummaryReporter class
	instanceVariableNames: ''!

!AccountSummaryReporter class methodsFor: 'instance creation' stamp: 'HAW 23/Oct/2026, 6:19:36 pm (UTC)'!
on: anAccount1 
	
	^self new initializeOn: anAccount1 ! !


!classDefinition: #AccountTransferNetReporter category: #'Portfolio-Solucion'!
AccountVisitor subclass: #AccountTransferNetReporter
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransferNetReporter methodsFor: 'initialization' stamp: 'HAW 24/Oct/2026, 1:14:25 pm (UTC)'!
initializeOn: anAccount1 
	
	reportedAccount := anAccount1.
	total  := 0! !


!AccountTransferNetReporter methodsFor: 'report' stamp: 'HAW 24/Oct/2026, 1:14:25 pm (UTC)'!
report
	
	reportedAccount accept: self.
	^ total! !


!AccountTransferNetReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 1:11:44 pm (UTC)'!
visitDeposit: aDeposit 
	! !

!AccountTransferNetReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 1:09:39 pm (UTC)'!
visitDepositLeg: aDepositLeg 
	
	total := total + aDepositLeg value! !

!AccountTransferNetReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 1:23:39 pm (UTC)'!
visitPortfolio: aPortfolio 
	
	! !

!AccountTransferNetReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:42:45 pm (UTC)'!
visitReceptiveAccount: aReceptiveAccount 
	! !

!AccountTransferNetReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 1:11:54 pm (UTC)'!
visitWithdraw: aWithdraw 
	! !

!AccountTransferNetReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 1:09:39 pm (UTC)'!
visitWithdrawLeg: aWithdrawLeg 
	
	total := total - aWithdrawLeg value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransferNetReporter class' category: #'Portfolio-Solucion'!
AccountTransferNetReporter class
	instanceVariableNames: ''!

!AccountTransferNetReporter class methodsFor: 'instance creation' stamp: 'HAW 23/Oct/2026, 8:12:50 pm (UTC)'!
on: anAccount1 
	
	^self new initializeOn: anAccount1 ! !


!classDefinition: #Transferencia category: #'Portfolio-Solucion'!
Object subclass: #Transferencia
	instanceVariableNames: 'deposito extraccion monto'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Transferencia methodsFor: 'initialization' stamp: 'HAW 22/Oct/2026, 6:03:57 pm (UTC)'!
initializeFromAnAccount: unaCuentaQueTransfiere toAnotherAccount: unaCuentaQueRecibe forAnAmount: unMonto 
	
	deposito := DepositLeg ofATransaction: self register: unMonto  on: unaCuentaQueRecibe .
	extraccion := WithdrawLeg ofATransaction: self register: unMonto  on: unaCuentaQueTransfiere . 
	
	monto := unMonto.! !


!Transferencia methodsFor: 'getter' stamp: 'HAW 21/Oct/2026, 12:51:50 am (UTC)'!
depositLeg
	^ deposito ! !

!Transferencia methodsFor: 'getter' stamp: 'HAW 21/Oct/2026, 12:55:22 am (UTC)'!
extractionLeg
	^ extraccion ! !


!Transferencia methodsFor: 'evaluating' stamp: 'HAW 22/Oct/2026, 6:04:49 pm (UTC)'!
value
	^ monto! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transferencia class' category: #'Portfolio-Solucion'!
Transferencia class
	instanceVariableNames: ''!

!Transferencia class methodsFor: 'instance creation' stamp: 'HAW 22/Oct/2026, 5:07:04 pm (UTC)'!
desde: account1 hacia: anotherAccount2 porUnMonto: unMonto 
	
	
	
	^self new initializeFromAnAccount: account1 toAnotherAccount: anotherAccount2 forAnAmount: unMonto.! !


!classDefinition: #AccountReporterTests category: #'Portfolio-Solucion'!
TestCase subclass: #AccountReporterTests
	instanceVariableNames: 'anAccount aReporter anotherAccount aPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountReporterTests methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
test01ReportadorSoloReportaBalanceDeCuentaSinTransacciones
	
	anAccount := ReceptiveAccount new.	
	aReporter := AccountSummaryReporter on: anAccount.
	
	self assert: aReporter report equals: {'Balance = 0.'} asOrderedCollection.! !

!AccountReporterTests methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
test02ReportadorReportaExtraccion
	
	anAccount := ReceptiveAccount new.	
	aReporter := AccountSummaryReporter on: anAccount.
	
	Withdraw register: 50 on: anAccount. 
	
	self assert: aReporter report 
	equals: {'Extráccion por 50.'. 
			'Balance = -50.'.} asOrderedCollection.! !

!AccountReporterTests methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
test03ReportadorReportaDeposito
	
	anAccount := ReceptiveAccount new.	
	aReporter := AccountSummaryReporter on: anAccount.
	
	Deposit register: 50 on: anAccount. 
	
	self assert: aReporter report 
	equals: {'Depósito por 50.'. 
			'Balance = 50.'.} 
			asOrderedCollection.! !

!AccountReporterTests methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
test04ReportadorReportaEntradaPorTransferencia
	
	anAccount := ReceptiveAccount new.	
	aReporter := AccountSummaryReporter on: anAccount.
	anotherAccount := ReceptiveAccount new.	
	
	Transferencia desde: anotherAccount hacia: anAccount porUnMonto: 50.
	
	self assert: aReporter report 
	equals: {'Entrada por transferencia de 50.'. 
			'Balance = 50.'.} 
			asOrderedCollection.! !

!AccountReporterTests methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
test05ReportadorReportaSalidaPorTransferencia
	
	anAccount := ReceptiveAccount new.	
	aReporter := AccountSummaryReporter on: anAccount.
	anotherAccount := ReceptiveAccount new.	
	
	Transferencia desde: anAccount hacia: anotherAccount porUnMonto: 50.
	
	self assert: aReporter report 
	equals: {'Salida por transferencia de 50.'. 
			'Balance = -50.'.} 
			asOrderedCollection.! !

!AccountReporterTests methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
test06ReportadorReportaPortfolioVacio
	
	aPortfolio := Portfolio new.
	aReporter := AccountSummaryReporter on: aPortfolio.
	
	self assert: aReporter report 
	equals: { 'Balance = 0.'.} asOrderedCollection.! !

!AccountReporterTests methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
test07ReportadorReportaHistoriaDePortfolioConCuentas
	
	anAccount := ReceptiveAccount new.	
	anotherAccount := ReceptiveAccount new.	
	aPortfolio := (Portfolio new) add: anAccount; add: anotherAccount.
	aReporter := AccountSummaryReporter on: aPortfolio.
	
	Deposit register: 100 on: anAccount. 
	Withdraw register: 77 on: anAccount. 
	Transferencia desde: anotherAccount hacia: anAccount porUnMonto: 1500.

	Deposit register: 50 on: anotherAccount. 
	
	self assert: aReporter report 
	equals: {'Depósito por 100.'.
			'Extráccion por 77.'. 
			'Entrada por transferencia de 1500.'. 
			'Balance = ', anAccount balance asString, '.' .
			
			'Salida por transferencia de 1500.'. 
			'Depósito por 50.'.
			'Balance = ', anotherAccount balance asString, '.' .
			
			'Balance = ', (aPortfolio balance) asString, '.' .} 
			asOrderedCollection.! !


!classDefinition: #PortfolioTest category: #'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 25/May/2019, 2:16:26 pm (UTC)'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 23/Oct/2026, 3:04:40 am (UTC)'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 23/Oct/2026, 3:04:55 am (UTC)'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 25/May/2019, 2:43:15 pm (UTC)'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 23/Oct/2026, 3:05:05 am (UTC)'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 23/Oct/2026, 3:05:23 am (UTC)'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 25/May/2019, 2:58:10 pm (UTC)'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 23/Oct/2026, 3:05:33 am (UTC)'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 23/Oct/2026, 3:05:43 am (UTC)'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 25/May/2019, 2:58:24 pm (UTC)'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 25/May/2019, 2:58:28 pm (UTC)'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 25/May/2019, 2:58:32 pm (UTC)'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 25/May/2019, 3:01:51 pm (UTC)'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 25/May/2019, 3:12:16 pm (UTC)'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 29/May/2019, 7:31:18 pm (UTC)'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 23/May/2019, 6:19:48 pm (UTC)'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 22/Oct/2026, 6:09:10 pm (UTC)'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 22/Oct/2026, 6:09:20 pm (UTC)'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 22/Oct/2026, 6:09:28 pm (UTC)'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 22/Oct/2026, 6:09:35 pm (UTC)'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 23/May/2019, 6:20:54 pm (UTC)'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 22/Oct/2026, 6:09:41 pm (UTC)'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #TransferNetReporterTests category: #'Portfolio-Solucion'!
TestCase subclass: #TransferNetReporterTests
	instanceVariableNames: 'anAccount aReporter anotherAccount aPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetReporterTests methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:13:32 pm (UTC)'!
test01ReportadorReportaNetoDeTransferenciasDeCuentaSinTransferencias

	anAccount := ReceptiveAccount new.	
	aReporter := AccountTransferNetReporter on: anAccount.
	
	
	self assert: aReporter report equals: 0.! !

!TransferNetReporterTests methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:13:32 pm (UTC)'!
test02ReportadorReportaNetoDeExtraccionPorTransferencia

	anAccount := ReceptiveAccount new.	
	aReporter := AccountTransferNetReporter on: anAccount.
	anotherAccount := ReceptiveAccount new.	
	
	Transferencia desde: anAccount hacia: anotherAccount porUnMonto: 50.
	
	self assert: aReporter report equals: -50.! !

!TransferNetReporterTests methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:13:32 pm (UTC)'!
test03ReportadorReportaNetoDeDepositoPorTransferencia

	anAccount := ReceptiveAccount new.	
	aReporter := AccountTransferNetReporter on: anAccount.
	anotherAccount := ReceptiveAccount new.	
	
	Transferencia desde: anotherAccount hacia: anAccount porUnMonto: 50.
	
	self assert: aReporter report equals: 50.! !

!TransferNetReporterTests methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:13:32 pm (UTC)'!
test04ReportadorReportaNetoDeCuentaConVariasTransacciones

	anAccount := ReceptiveAccount new.	
	anotherAccount := ReceptiveAccount new.	
	
	aReporter := AccountTransferNetReporter on: anAccount .
	
	Deposit register: 100 on: anAccount. 
	Withdraw register: 50 on: anAccount. 
	Transferencia desde: anotherAccount hacia: anAccount porUnMonto: 200.

	
	self assert: aReporter report equals: 200.! !

!TransferNetReporterTests methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:22:58 pm (UTC)'!
test05ReportadorReportaNetoDePortfolio

	aPortfolio := Portfolio new.
	aReporter := AccountTransferNetReporter on: aPortfolio.	

	
	self assert: aReporter report equals: 0.! !


!classDefinition: #TransferenciaTest category: #'Portfolio-Solucion'!
TestCase subclass: #TransferenciaTest
	instanceVariableNames: 'transaccion account anotherAccount deposito'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'HAW 23/Oct/2026, 6:44:07 pm (UTC)'!
test01TransaccionAfectaBalanceDeLasCuentasInvolucradas
	
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Deposit register: 50 on: account.
	
	transaccion := Transferencia desde: account hacia: anotherAccount porUnMonto: 50.
	
	self assert: account balance equals: 0.
	self assert: anotherAccount balance equals: 50.! !

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'HAW 23/Oct/2026, 6:44:07 pm (UTC)'!
test02CuentaRegistraDeposito
	
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	deposito := Deposit register: 50 on: account.
	
	transaccion := Transferencia desde: account hacia: anotherAccount porUnMonto: 50.
	
	self assert: (anotherAccount hasRegistered: (transaccion depositLeg)).
	! !

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'HAW 23/Oct/2026, 6:44:07 pm (UTC)'!
test03CuentaRegistraExtraccion
	
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	deposito := Deposit register: 50 on: account.
	
	transaccion := Transferencia desde: account hacia: anotherAccount porUnMonto: 50.
	
	self assert: (account hasRegistered: (transaccion extractionLeg)).
	! !

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'HAW 23/Oct/2026, 6:44:07 pm (UTC)'!
test04PataDepositoNavegaATransferencia
	
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	deposito := Deposit register: 50 on: account.
	
	transaccion := Transferencia desde: account hacia: anotherAccount porUnMonto: 50.
	
	self assert: transaccion depositLeg transfer equals: transaccion.
	! !

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'HAW 23/Oct/2026, 6:44:07 pm (UTC)'!
test05PataExtraccionNavegaATransferencia
	
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	deposito := Deposit register: 50 on: account.
	
	transaccion := Transferencia desde: account hacia: anotherAccount porUnMonto: 50.
	
	self assert: transaccion extractionLeg transfer equals: transaccion.
	! !

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'HAW 23/Oct/2026, 6:44:07 pm (UTC)'!
test06TransferenciaContieneElMonto
	
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	
	transaccion := Transferencia desde: account hacia: anotherAccount porUnMonto: 50.
	
	self assert: account balance equals: transaccion value *-1.
	self assert: anotherAccount balance equals: transaccion value.! !
