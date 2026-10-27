!classDefinition: #Account category: #'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
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


!Account methodsFor: 'initialization' stamp: 'HAW 26/Oct/2026, 9:47:12 pm (UTC)'!
initializeNamed: aName 
	
	name := aName.
	self initialize. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: #'Portfolio-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'HAW 26/Oct/2026, 9:46:28 pm (UTC)'!
named: aName 
	
	^self new initializeNamed: aName ! !


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


!Portfolio methodsFor: 'reports' stamp: 'HAW 26/Oct/2026, 10:46:09 pm (UTC)'!
accept: aReportBuffer 	
	
	aReportBuffer visitPortfolio: self. ! !

!Portfolio methodsFor: 'reports' stamp: 'HAW 26/Oct/2026, 10:46:28 pm (UTC)'!
visitSubparts: aVisitor

	accounts do: [:anAccount | anAccount accept: aVisitor ].! !


!Portfolio methodsFor: 'name' stamp: 'HAW 26/Oct/2026, 9:30:20 pm (UTC)'!
accountName
	^ name ! !

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


!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 26/Oct/2026, 11:07:03 pm (UTC)'!
named: aRenameMe with: anAccount1 
	
	^ (self named: aRenameMe) add: anAccount1 ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 26/Oct/2026, 11:04:49 pm (UTC)'!
named: aRenameMe with: anAccount1 with: anotherPortfolio2 
	
	^ (self named: aRenameMe) add: anAccount1; add: anotherPortfolio2! !


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


!ReceptiveAccount methodsFor: 'reports' stamp: 'HAW 26/Oct/2026, 10:53:40 pm (UTC)'!
accept: aReportBuffer 
	
	aReportBuffer visitReceptiveAccount: self.! !

!ReceptiveAccount methodsFor: 'reports' stamp: 'HAW 26/Oct/2026, 10:45:45 pm (UTC)'!
visitSubparts: aReportBuffer

	^ transactions do: [ :aTransaction | aTransaction accept: aReportBuffer ]! !


!ReceptiveAccount methodsFor: 'name' stamp: 'HAW 26/Oct/2026, 10:20:13 pm (UTC)'!
accountName
	
	 ^ name! !


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


!DepositLeg methodsFor: 'other Leg' stamp: 'HAW 26/Oct/2026, 1:37:51 am (UTC)'!
extractionLeg
	^ transferencia extractionLeg ! !


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


!WithdrawLeg methodsFor: 'other Leg' stamp: 'HAW 26/Oct/2026, 1:38:46 am (UTC)'!
depositLeg
	^ transferencia depositLeg ! !


!classDefinition: #Withdraw category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 13/Jul/2011, 9:46:00 pm (UTC)'!
initializeFor: aValue

	value := aValue ! !


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
	instanceVariableNames: 'reportedAccount reports'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountVisitor methodsFor: 'visitor' stamp: 'HAW 26/Oct/2026, 10:09:14 pm (UTC)'!
visitDeposit: aDeposit

	! !

!AccountVisitor methodsFor: 'visitor' stamp: 'HAW 26/Oct/2026, 10:09:17 pm (UTC)'!
visitDepositLeg: aDepositLeg

	! !

!AccountVisitor methodsFor: 'visitor' stamp: 'HAW 26/Oct/2026, 10:09:31 pm (UTC)'!
visitPortfolio: aPortfolio

	! !

!AccountVisitor methodsFor: 'visitor' stamp: 'HAW 26/Oct/2026, 10:18:41 pm (UTC)'!
visitReceptiveAccount: aReceptiveAccount

	! !

!AccountVisitor methodsFor: 'visitor' stamp: 'HAW 26/Oct/2026, 10:09:24 pm (UTC)'!
visitWithdraw: aWithdraw

	! !

!AccountVisitor methodsFor: 'visitor' stamp: 'HAW 26/Oct/2026, 10:09:19 pm (UTC)'!
visitWithdrawLeg: aWithdrawLeg

	! !


!AccountVisitor methodsFor: 'report' stamp: 'HAW 27/Oct/2026, 12:11:10 am (UTC)'!
report
	
	reportedAccount accept: self.
	
	^ reports ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountVisitor class' category: #'Portfolio-Solucion'!
AccountVisitor class
	instanceVariableNames: ''!

!AccountVisitor class methodsFor: 'instance creation' stamp: 'HAW 27/Oct/2026, 1:23:11 am (UTC)'!
errorSoloReportamosPortfolio

	^ 'Solo Reportamos Portfolios'! !

!AccountVisitor class methodsFor: 'instance creation' stamp: 'HAW 27/Oct/2026, 1:25:14 am (UTC)'!
on: anAccount 
	
	^self new initializeOn: anAccount ! !


!classDefinition: #AccountSummaryReporter category: #'Portfolio-Solucion'!
AccountVisitor subclass: #AccountSummaryReporter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryReporter methodsFor: 'init' stamp: 'HAW 23/Oct/2026, 6:33:40 pm (UTC)'!
initializeOn: anAccount 
	
	reportedAccount := anAccount.
	reports := OrderedCollection new.! !


!AccountSummaryReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:33:43 pm (UTC)'!
visitDeposit: aDeposit 

	reports add: 'Depósito por ', (aDeposit value asString), '.'! !

!AccountSummaryReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:34:53 pm (UTC)'!
visitDepositLeg: aDepositLeg 
	
	reports add: 'Entrada por transferencia de ', (aDepositLeg value asString) , '.'! !

!AccountSummaryReporter methodsFor: 'visitor' stamp: 'HAW 26/Oct/2026, 10:46:46 pm (UTC)'!
visitPortfolio: aPortfolio 
	
	aPortfolio visitSubparts: self.
	
	reports add: 'Balance = ', aPortfolio balance asString , '.'.! !

!AccountSummaryReporter methodsFor: 'visitor' stamp: 'HAW 26/Oct/2026, 10:46:51 pm (UTC)'!
visitReceptiveAccount: aReceptiveAccount 
	
	aReceptiveAccount visitSubparts: self.
	
	reports add: 'Balance = ', aReceptiveAccount balance asString , '.'.! !

!AccountSummaryReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:34:07 pm (UTC)'!
visitWithdraw: aWithdraw 
	
	reports add: 'Extráccion por ', (aWithdraw value asString), '.'.! !

!AccountSummaryReporter methodsFor: 'visitor' stamp: 'HAW 24/Oct/2026, 12:33:57 pm (UTC)'!
visitWithdrawLeg: aWithdrawLeg 
	
	reports add: 'Salida por transferencia de ', (aWithdrawLeg value asString) , '.'! !


!classDefinition: #AccountTransferNetReporter category: #'Portfolio-Solucion'!
AccountVisitor subclass: #AccountTransferNetReporter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransferNetReporter methodsFor: 'initialization' stamp: 'HAW 27/Oct/2026, 1:29:14 am (UTC)'!
initializeOn: anAccount1 
	
	reportedAccount := anAccount1.
	reports  := 0! !


!AccountTransferNetReporter methodsFor: 'visitor' stamp: 'HAW 27/Oct/2026, 1:30:01 am (UTC)'!
visitDepositLeg: aDepositLeg 
	
	reports := reports + aDepositLeg value! !

!AccountTransferNetReporter methodsFor: 'visitor' stamp: 'HAW 26/Oct/2026, 10:52:04 pm (UTC)'!
visitPortfolio: aPortfolio 
	
	aPortfolio visitSubparts: self.! !

!AccountTransferNetReporter methodsFor: 'visitor' stamp: 'HAW 26/Oct/2026, 10:42:43 pm (UTC)'!
visitReceptiveAccount: aReceptiveAccount 
	
	aReceptiveAccount visitSubparts: self! !

!AccountTransferNetReporter methodsFor: 'visitor' stamp: 'HAW 27/Oct/2026, 1:30:10 am (UTC)'!
visitWithdrawLeg: aWithdrawLeg 
	
	reports := reports - aWithdrawLeg value.! !


!classDefinition: #TreePrinterReporter category: #'Portfolio-Solucion'!
AccountVisitor subclass: #TreePrinterReporter
	instanceVariableNames: 'index'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TreePrinterReporter methodsFor: 'visitor' stamp: 'HAW 27/Oct/2026, 12:49:11 am (UTC)'!
tabulacion

	^ String new: index *3 withAll: Character space! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreePrinterReporter class' category: #'Portfolio-Solucion'!
TreePrinterReporter class
	instanceVariableNames: ''!

!TreePrinterReporter class methodsFor: 'instance creation' stamp: 'HAW 27/Oct/2026, 1:27:20 am (UTC)'!
on: anAccount 
	
	(anAccount isKindOf: ReceptiveAccount) ifTrue: [self error: self errorSoloReportamosPortfolio].
	
	^self new initializeOn: anAccount ! !


!classDefinition: #TreePrinterAccountReporter category: #'Portfolio-Solucion'!
TreePrinterReporter subclass: #TreePrinterAccountReporter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TreePrinterAccountReporter methodsFor: 'initialization' stamp: 'HAW 27/Oct/2026, 12:43:10 am (UTC)'!
initializeOn: aPortfolio 
	
	reportedAccount := aPortfolio.
	reports := OrderedCollection new.
	index := 0.! !


!TreePrinterAccountReporter methodsFor: 'visitor' stamp: 'HAW 27/Oct/2026, 1:06:38 am (UTC)'!
visitPortfolio: aPortfolio 
	
	reports add: self tabulacion, aPortfolio accountName.
	index := index + 1.
	aPortfolio visitSubparts: self.
	index := index -1.! !

!TreePrinterAccountReporter methodsFor: 'visitor' stamp: 'HAW 27/Oct/2026, 1:16:39 am (UTC)'!
visitReceptiveAccount: aReceptiveAccount 
	
	
	| reporteDeTransacciones |
	reports add: self tabulacion, aReceptiveAccount accountName.
	
	reporteDeTransacciones := (AccountSummaryReporter on: aReceptiveAccount) report.
	
	index := index +1.
	reporteDeTransacciones do: [:aTransReport | reports add: self tabulacion, aTransReport ].
	index := index - 1.
	! !


!classDefinition: #TreePrinterPortfolioReporter category: #'Portfolio-Solucion'!
TreePrinterReporter subclass: #TreePrinterPortfolioReporter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TreePrinterPortfolioReporter methodsFor: 'initialization' stamp: 'HAW 27/Oct/2026, 12:46:33 am (UTC)'!
initializeOn: aPortfolio 
	
	reportedAccount := aPortfolio.
	reports := OrderedCollection new.
	index := 0.! !



!TreePrinterPortfolioReporter methodsFor: 'visitor' stamp: 'HAW 27/Oct/2026, 12:46:12 am (UTC)'!
visitPortfolio: aPortfolio 
	
	reports add: self tabulacion, aPortfolio accountName.
	index := index +1.
	aPortfolio visitSubparts: self.
	index := index -1.! !

!TreePrinterPortfolioReporter methodsFor: 'visitor' stamp: 'HAW 27/Oct/2026, 12:46:00 am (UTC)'!
visitReceptiveAccount: aReceptiveAccount 
	
	reports add: (self tabulacion), aReceptiveAccount accountName ! !


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

!Transferencia class methodsFor: 'instance creation' stamp: 'HAW 26/Oct/2026, 1:44:49 am (UTC)'!
desde: anAccount hacia: anotherAccount porUnMonto: unMonto 
	
	(anAccount = anotherAccount) ifTrue: [self error: self transferenciaInvalida].
	
	^self new initializeFromAnAccount: anAccount toAnotherAccount: anotherAccount forAnAmount: unMonto.! !

!Transferencia class methodsFor: 'instance creation' stamp: 'HAW 26/Oct/2026, 1:44:49 am (UTC)'!
transferenciaInvalida

	^ 'No Te podes Transferir a vos mismo'! !


!classDefinition: #AccountReporterTest category: #'Portfolio-Solucion'!
TestCase subclass: #AccountReporterTest
	instanceVariableNames: 'anAccount aReporter anotherAccount aPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountReporterTest methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
test01ReportadorSoloReportaBalanceDeCuentaSinTransacciones
	
	anAccount := ReceptiveAccount new.	
	aReporter := AccountSummaryReporter on: anAccount.
	
	self assert: aReporter report equals: {'Balance = 0.'} asOrderedCollection.! !

!AccountReporterTest methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
test02ReportadorReportaExtraccion
	
	anAccount := ReceptiveAccount new.	
	aReporter := AccountSummaryReporter on: anAccount.
	
	Withdraw register: 50 on: anAccount. 
	
	self assert: aReporter report 
	equals: {'Extráccion por 50.'. 
			'Balance = -50.'.} asOrderedCollection.! !

!AccountReporterTest methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
test03ReportadorReportaDeposito
	
	anAccount := ReceptiveAccount new.	
	aReporter := AccountSummaryReporter on: anAccount.
	
	Deposit register: 50 on: anAccount. 
	
	self assert: aReporter report 
	equals: {'Depósito por 50.'. 
			'Balance = 50.'.} 
			asOrderedCollection.! !

!AccountReporterTest methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
test04ReportadorReportaEntradaPorTransferencia
	
	anAccount := ReceptiveAccount new.	
	aReporter := AccountSummaryReporter on: anAccount.
	anotherAccount := ReceptiveAccount new.	
	
	Transferencia desde: anotherAccount hacia: anAccount porUnMonto: 50.
	
	self assert: aReporter report 
	equals: {'Entrada por transferencia de 50.'. 
			'Balance = 50.'.} 
			asOrderedCollection.! !

!AccountReporterTest methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
test05ReportadorReportaSalidaPorTransferencia
	
	anAccount := ReceptiveAccount new.	
	aReporter := AccountSummaryReporter on: anAccount.
	anotherAccount := ReceptiveAccount new.	
	
	Transferencia desde: anAccount hacia: anotherAccount porUnMonto: 50.
	
	self assert: aReporter report 
	equals: {'Salida por transferencia de 50.'. 
			'Balance = -50.'.} 
			asOrderedCollection.! !

!AccountReporterTest methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
test06ReportadorReportaPortfolioVacio
	
	aPortfolio := Portfolio new.
	aReporter := AccountSummaryReporter on: aPortfolio.
	
	self assert: aReporter report 
	equals: { 'Balance = 0.'.} asOrderedCollection.! !

!AccountReporterTest methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:11:02 pm (UTC)'!
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


!classDefinition: #TransferNetReporterTest category: #'Portfolio-Solucion'!
TestCase subclass: #TransferNetReporterTest
	instanceVariableNames: 'anAccount aReporter anotherAccount aPortfolio anotherPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetReporterTest methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:13:32 pm (UTC)'!
test01ReportadorReportaNetoDeTransferenciasDeCuentaSinTransferencias

	anAccount := ReceptiveAccount new.	
	aReporter := AccountTransferNetReporter on: anAccount.
	
	
	self assert: aReporter report equals: 0.! !

!TransferNetReporterTest methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:13:32 pm (UTC)'!
test02ReportadorReportaNetoDeExtraccionPorTransferencia

	anAccount := ReceptiveAccount new.	
	aReporter := AccountTransferNetReporter on: anAccount.
	anotherAccount := ReceptiveAccount new.	
	
	Transferencia desde: anAccount hacia: anotherAccount porUnMonto: 50.
	
	self assert: aReporter report equals: -50.! !

!TransferNetReporterTest methodsFor: 'tests' stamp: 'HAW 24/Oct/2026, 1:13:32 pm (UTC)'!
test03ReportadorReportaNetoDeDepositoPorTransferencia

	anAccount := ReceptiveAccount new.	
	aReporter := AccountTransferNetReporter on: anAccount.
	anotherAccount := ReceptiveAccount new.	
	
	Transferencia desde: anotherAccount hacia: anAccount porUnMonto: 50.
	
	self assert: aReporter report equals: 50.! !

!TransferNetReporterTest methodsFor: 'tests' stamp: 'HAW 26/Oct/2026, 9:08:15 pm (UTC)'!
test04ReportadorReportaNetoDeCuentaConVariasTransacciones

	anAccount := ReceptiveAccount new.	
	anotherAccount := ReceptiveAccount new.	
	
	aReporter := AccountTransferNetReporter on: anAccount .
	
	Deposit register: 100 on: anAccount. 
	Withdraw register: 50 on: anAccount. 
	Transferencia desde: anotherAccount hacia: anAccount porUnMonto: 200.

	self assert: aReporter report equals: 200.! !

!TransferNetReporterTest methodsFor: 'tests' stamp: 'HAW 26/Oct/2026, 10:51:13 pm (UTC)'!
test05ReportadorReportaNetoDePortfolioVacio

	
	
	aPortfolio := Portfolio new.
	aReporter := AccountTransferNetReporter on: aPortfolio.
	

	
	self assert: aReporter report equals: 0.! !

!TransferNetReporterTest methodsFor: 'tests' stamp: 'HAW 26/Oct/2026, 10:51:18 pm (UTC)'!
test06ReportadorReportaNetoDePortfolioConPortfolio

	aPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	aReporter := AccountTransferNetReporter on: aPortfolio.	
	aPortfolio add: anotherPortfolio.
	 
	anAccount := ReceptiveAccount new.	
	anotherAccount := ReceptiveAccount new.	
	Transferencia desde: anAccount hacia: anotherAccount porUnMonto: 50.
	
	anotherPortfolio add: anAccount.
	
	self assert: aReporter report equals: -50.! !


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

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'HAW 26/Oct/2026, 1:37:20 am (UTC)'!
test06PataDepositoNavegaAOtraPata
	
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	deposito := Deposit register: 50 on: account.
	
	transaccion := Transferencia desde: account hacia: anotherAccount porUnMonto: 50.
	
	self assert: (transaccion depositLeg extractionLeg) equals: (transaccion extractionLeg).
	! !

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'HAW 26/Oct/2026, 1:38:30 am (UTC)'!
test07PataExtraccionNavegaAOtraPata
	
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	deposito := Deposit register: 50 on: account.
	
	transaccion := Transferencia desde: account hacia: anotherAccount porUnMonto: 50.
	
	self assert: (transaccion extractionLeg depositLeg) equals: (transaccion depositLeg ).
	! !

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'HAW 26/Oct/2026, 1:36:27 am (UTC)'!
test08TransferenciaContieneElMonto
	
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	
	transaccion := Transferencia desde: account hacia: anotherAccount porUnMonto: 50.
	
	self assert: account balance equals: transaccion value *-1.
	self assert: anotherAccount balance equals: transaccion value.! !

!TransferenciaTest methodsFor: 'as yet unclassified' stamp: 'HAW 26/Oct/2026, 1:45:11 am (UTC)'!
test09TransaccionNoSeRealizaDeUnaCuentaHaciaEllaMisma
	
	
	account := ReceptiveAccount new.
	
	self should: [Transferencia desde: account hacia: account porUnMonto: 50.]
	raise: Error 
	withExceptionDo: [ :anError | self assert: (anError messageText) equals: Transferencia transferenciaInvalida.
							self assert: account balance equals: 0 ]
	! !


!classDefinition: #TreePrinterReporterTest category: #'Portfolio-Solucion'!
TestCase subclass: #TreePrinterReporterTest
	instanceVariableNames: 'aPortfolio aReporter anAccount anotherPortfolio anotherAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TreePrinterReporterTest methodsFor: 'tests' stamp: 'HAW 27/Oct/2026, 12:10:29 am (UTC)'!
test01PrinterImprimePortfolioEnNivelCero
	
	aPortfolio := Portfolio named: 'Portfolio de hijos'.
	aReporter := TreePrinterPortfolioReporter on: aPortfolio.
	
	self assert: (aReporter report) equals: {'Portfolio de hijos'} asOrderedCollection.! !

!TreePrinterReporterTest methodsFor: 'tests' stamp: 'HAW 27/Oct/2026, 12:10:29 am (UTC)'!
test02PrinterImprimePortfolioYSuCuentaEnUnNivel
	
	
	anAccount := ReceptiveAccount named: 'Eden Hazard'.
	aPortfolio := Portfolio named: 'Portfolio de hijos' with: anAccount.
	
	aReporter := TreePrinterPortfolioReporter on: aPortfolio.
	
	
	self assert: (aReporter report) equals: {'Portfolio de hijos'. 
										 '   Eden Hazard'} asOrderedCollection.! !

!TreePrinterReporterTest methodsFor: 'tests' stamp: 'HAW 27/Oct/2026, 12:10:29 am (UTC)'!
test03PrinterImprimeSusCuentasEnUnNivel
	
	anAccount := ReceptiveAccount named: 'Eden Hazard'.
	anotherPortfolio := Portfolio named: 'Hatem'.
	aPortfolio := Portfolio named: 'Portfolio de hijos' with: anAccount with: anotherPortfolio.
	
	aReporter := TreePrinterPortfolioReporter on: aPortfolio.
	
	self assert: (aReporter report) equals: {'Portfolio de hijos'. 
										 '   Eden Hazard'.
										 '   Hatem'
										} asOrderedCollection.! !

!TreePrinterReporterTest methodsFor: 'tests' stamp: 'HAW 27/Oct/2026, 12:10:29 am (UTC)'!
test04PrinterImprimeSusCuentasEnMasDeUnNivel
	
	| angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with:
	johnsAccount with: angiesAccount.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	aReporter :=	TreePrinterPortfolioReporter on: familyPortfolio . 
	
	self assert: (aReporter report) equals: {'Portfolio de la familia'.
										'   Cuenta mia'.
										'   Portfolio de hijos'. 
										'      Cuenta de Juan'. 
										'      Cuenta de Angeles' } asOrderedCollection.
										! !

!TreePrinterReporterTest methodsFor: 'tests' stamp: 'HAW 27/Oct/2026, 12:47:13 am (UTC)'!
test05PrinterImprimeSusCuentasEnMasDeUnNivelYConCuentasDespuesDeIrProfundo
	
	| angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount benAccount |
	
	benAccount := ReceptiveAccount named: 'Cuenta Hatem Ben Arfa'.
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with:
	johnsAccount with: angiesAccount.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	familyPortfolio add: benAccount.
	 
	aReporter :=	TreePrinterPortfolioReporter on: familyPortfolio . 
	
	self assert: (aReporter report) equals: {'Portfolio de la familia'.
										'   Cuenta mia'.
										'   Portfolio de hijos'. 
										'      Cuenta de Juan'. 
										'      Cuenta de Angeles'.
										'   Cuenta Hatem Ben Arfa' } asOrderedCollection.
										! !

!TreePrinterReporterTest methodsFor: 'tests' stamp: 'HAW 27/Oct/2026, 1:13:35 am (UTC)'!
test06PrinterImprimePortfolioConAccount
	
	anAccount := ReceptiveAccount named: 'Eden Hazard'.

	aPortfolio := Portfolio named: 'Portfolio Benhrama' with: anAccount.
	aReporter := TreePrinterAccountReporter on: aPortfolio.

	
	self assert: aReporter report
	equals: {
			'Portfolio Benhrama'.
			'   Eden Hazard'.
			'      Balance = 0.'
			} 
			asOrderedCollection.! !

!TreePrinterReporterTest methodsFor: 'tests' stamp: 'HAW 27/Oct/2026, 1:18:45 am (UTC)'!
test07PrinterImprimeSuArbolDeCuentasYTransacciones
	anAccount := ReceptiveAccount named: 'Eden Hazard'.	
	anotherAccount := ReceptiveAccount named: 'Hatem Ben Arfa'.	
	
	aPortfolio := Portfolio named: 'Portfolio Benhrama' with: anAccount with: anotherAccount .
	aReporter := TreePrinterAccountReporter on: aPortfolio.

	Deposit register: 100 on: anAccount. 
	Withdraw register: 77 on: anAccount. 
	Transferencia desde: anotherAccount hacia: anAccount porUnMonto: 1500.
	
	self assert: aReporter report 
	equals: {
			'Portfolio Benhrama'.
			'   Eden Hazard'.
			'      Depósito por 100.'.
			'      Extráccion por 77.'. 
			'      Entrada por transferencia de 1500.'. 
			'      Balance = ', anAccount balance asString, '.' .
			'   Hatem Ben Arfa'.
			'      Salida por transferencia de 1500.'.
			'      Balance = ', anotherAccount balance asString, '.'. 
			} 
			asOrderedCollection.! !

!TreePrinterReporterTest methodsFor: 'tests' stamp: 'HAW 27/Oct/2026, 1:27:46 am (UTC)'!
test08TreePrinterPortfolioSoloReportaPortfolio
	anAccount := ReceptiveAccount named: 'Marito'.
	
	self should: [TreePrinterPortfolioReporter on: anAccount] 
	raise:  Error
	withExceptionDo: [:anError | self assert: anError messageText equals: TreePrinterReporter errorSoloReportamosPortfolio]! !

!TreePrinterReporterTest methodsFor: 'tests' stamp: 'HAW 27/Oct/2026, 1:28:09 am (UTC)'!
test09TreePrinterFullSoloReportaPortfolio
	anAccount := ReceptiveAccount named: 'Marito'.
	
	self should: [TreePrinterAccountReporter on: anAccount] 
	raise:  Error
	withExceptionDo: [:anError | self assert: anError messageText equals: TreePrinterReporter errorSoloReportamosPortfolio]! !
