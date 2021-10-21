#Region FormEvents

Procedure OnCreateAtServer(Object, Form, Cancel, StandardProcessing) Export
	DocumentsServer.OnCreateAtServer(Object, Form, Cancel, StandardProcessing);
	If Form.Parameters.Key.IsEmpty() Then
		Form.CurrentCurrency = Object.Currency;
		Form.CurrentAccount = Object.CashAccount;
		Form.CurrentTransactionType = Object.TransactionType;

		SetGroupItemsList(Object, Form);
		DocumentsClientServer.ChangeTitleGroupTitle(Object, Form);
	EndIf;
	DocumentsServer.FillPaymentList(Object);
EndProcedure

Procedure AfterWriteAtServer(Object, Form, CurrentObject, WriteParameters) Export
	Form.CurrentCurrency = CurrentObject.Currency;
	Form.CurrentAccount = CurrentObject.CashAccount;
	Form.CurrentTransactionType = Object.TransactionType;
	DocumentsServer.FillPaymentList(Object);

	DocumentsClientServer.ChangeTitleGroupTitle(CurrentObject, Form);
EndProcedure

Procedure OnReadAtServer(Object, Form, CurrentObject) Export
	Form.CurrentCurrency = CurrentObject.Currency;
	Form.CurrentAccount = CurrentObject.CashAccount;
	Form.CurrentTransactionType = Object.TransactionType;
	DocumentsServer.FillPaymentList(Object);

	If Not Form.GroupItems.Count() Then
		SetGroupItemsList(Object, Form);
	EndIf;
	DocumentsClientServer.ChangeTitleGroupTitle(CurrentObject, Form);
EndProcedure

#EndRegion

Procedure FillAttributesByType(TransactionType, ArrayAll, ArrayByType) Export
	ArrayAll = New Array();
	ArrayAll.Add("CashAccount");
	ArrayAll.Add("Company");
	ArrayAll.Add("Currency");
	ArrayAll.Add("Payee");
	ArrayAll.Add("TransactionType");
	ArrayAll.Add("Description");

	ArrayAll.Add("PaymentList.BasisDocument");
	ArrayAll.Add("PaymentList.Partner");
	ArrayAll.Add("PaymentList.Payee");
	ArrayAll.Add("PaymentList.Agreement");
	ArrayAll.Add("PaymentList.PlaningTransactionBasis");
	ArrayAll.Add("PaymentList.Amount");
	ArrayAll.Add("PaymentList.LegalNameContract");

	ArrayByType = New Array();
	If TransactionType = Enums.OutgoingPaymentTransactionTypes.CashTransferOrder Then
		ArrayByType.Add("CashAccount");
		ArrayByType.Add("Company");
		ArrayByType.Add("Currency");
		ArrayByType.Add("TransactionType");
		ArrayByType.Add("Description");

		ArrayByType.Add("PaymentList.PlaningTransactionBasis");
		ArrayByType.Add("PaymentList.Amount");
	ElsIf TransactionType = Enums.OutgoingPaymentTransactionTypes.CurrencyExchange Then
		ArrayByType.Add("CashAccount");
		ArrayByType.Add("Company");
		ArrayByType.Add("Currency");
		ArrayByType.Add("TransactionType");
		ArrayByType.Add("Description");

		ArrayByType.Add("PaymentList.Partner");
		ArrayByType.Add("PaymentList.PlaningTransactionBasis");
		ArrayByType.Add("PaymentList.Amount");
	ElsIf TransactionType = Enums.OutgoingPaymentTransactionTypes.PaymentToVendor Or TransactionType
		= Enums.OutgoingPaymentTransactionTypes.ReturnToCustomer Then
		ArrayByType.Add("CashAccount");
		ArrayByType.Add("Company");
		ArrayByType.Add("Currency");
		ArrayByType.Add("Payee");
		ArrayByType.Add("TransactionType");
		ArrayByType.Add("Description");

		ArrayByType.Add("PaymentList.BasisDocument");
		ArrayByType.Add("PaymentList.Partner");
		ArrayByType.Add("PaymentList.Agreement");
		ArrayByType.Add("PaymentList.Payee");
		ArrayByType.Add("PaymentList.PlaningTransactionBasis");
		ArrayByType.Add("PaymentList.Amount");
		ArrayByType.Add("PaymentList.LegalNameContract");
	Else
		ArrayByType.Add("Company");
		ArrayByType.Add("Currency");
		ArrayByType.Add("TransactionType");

		ArrayByType.Add("PaymentList.Amount");
	EndIf;
EndProcedure

#Region GroupTitle

Procedure SetGroupItemsList(Object, Form)
	AttributesArray = New Array();
	AttributesArray.Add("Company");
	AttributesArray.Add("CashAccount");
	AttributesArray.Add("Currency");
	AttributesArray.Add("TransactionType");
	DocumentsServer.DeleteUnavailableTitleItemNames(AttributesArray);
	For Each Atr In AttributesArray Do
		Form.GroupItems.Add(Atr, ?(ValueIsFilled(Form.Items[Atr].Title), Form.Items[Atr].Title,
			Object.Ref.Metadata().Attributes[Atr].Synonym + ":" + Chars.NBSp));
	EndDo;
EndProcedure

#EndRegion

Function GetDocumentTable_CashTransferOrder(ArrayOfBasisDocuments, EndOfDate = Undefined) Export
	TempTableManager = New TempTablesManager();
	Query = New Query();
	Query.TempTablesManager = TempTableManager;
	Query.Text = GetDocumentTable_CashTransferOrder_QueryText();
	Query.SetParameter("ArrayOfBasisDocuments", ArrayOfBasisDocuments);
	Query.SetParameter("UseArrayOfBasisDocuments", True);
	If EndOfDate = Undefined Then
		Query.SetParameter("EndOfDate", CurrentDate());
	Else
		Query.SetParameter("EndOfDate", EndOfDate);
	EndIf;

	Query.Execute();
	Query.Text =
	"SELECT
	|	tmp.BasedOn AS BasedOn,
	|	tmp.TransactionType AS TransactionType,
	|	tmp.Company AS Company,
	|	tmp.CashAccount AS CashAccount,
	|	tmp.Currency AS Currency,
	|	tmp.FinancialMovementType AS FinancialMovementType,
	|	tmp.Amount AS Amount,
	|	tmp.PlaningTransactionBasis AS PlaningTransactionBasis,
	|	tmp.Partner AS Partner
	|FROM
	|	tmp_CashTransferOrder AS tmp";
	QueryResult = Query.Execute();
	Return QueryResult.Unload();
EndFunction

Function GetDocumentTable_CashTransferOrder_QueryText() Export
	Return "SELECT ALLOWED
		   |	""CashTransferOrder"" AS BasedOn,
		   |	CASE
		   |		WHEN Doc.SendCurrency = Doc.ReceiveCurrency
		   |			THEN VALUE(Enum.OutgoingPaymentTransactionTypes.CashTransferOrder)
		   |		ELSE VALUE(Enum.OutgoingPaymentTransactionTypes.CurrencyExchange)
		   |	END AS TransactionType,
		   |	R3035T_CashPlanningTurnovers.Company AS Company,
		   |	R3035T_CashPlanningTurnovers.Account AS CashAccount,
		   |	R3035T_CashPlanningTurnovers.Currency AS Currency,
		   |	R3035T_CashPlanningTurnovers.FinancialMovementType AS FinancialMovementType,
		   |	R3035T_CashPlanningTurnovers.AmountTurnover AS Amount,
		   |	R3035T_CashPlanningTurnovers.BasisDocument AS PlaningTransactionBasis,
		   |	Doc.CashAdvanceHolder AS Partner
		   |INTO tmp_CashTransferOrder
		   |FROM
		   |	AccumulationRegister.R3035T_CashPlanning.Turnovers(, &EndOfDate,,
		   |		CashFlowDirection = VALUE(Enum.CashFlowDirections.Outgoing)
		   |	AND CurrencyMovementType = VALUE(ChartOfCharacteristicTypes.CurrencyMovementType.SettlementCurrency)
		   |	AND CASE
		   |		WHEN &UseArrayOfBasisDocuments
		   |			THEN BasisDocument IN (&ArrayOfBasisDocuments)
		   |		ELSE TRUE
		   |	END) AS R3035T_CashPlanningTurnovers
		   |		INNER JOIN Document.CashTransferOrder AS Doc
		   |		ON R3035T_CashPlanningTurnovers.BasisDocument = Doc.Ref
		   |WHERE
		   |	R3035T_CashPlanningTurnovers.Account.Type = VALUE(Enum.CashAccountTypes.Cash)
		   |	AND R3035T_CashPlanningTurnovers.AmountTurnover > 0";
EndFunction

Function GetDocumentTable_CashTransferOrder_ForClient(ArrayOfBasisDocuments, ObjectRef = Undefined) Export
	EndOfDate = Undefined;
	If ValueIsFilled(ObjectRef) Then
		EndOfDate = New Boundary(ObjectRef.PointInTime(), BoundaryType.Excluding);
	EndIf;
	ArrayOfResults = New Array();
	ValueTable = GetDocumentTable_CashTransferOrder(ArrayOfBasisDocuments, EndOfDate);
	For Each Row In ValueTable Do
		NewRow = New Structure();
		NewRow.Insert("BasedOn", Row.BasedOn);
		NewRow.Insert("TransactionType", Row.TransactionType);
		NewRow.Insert("Company", Row.Company);
		NewRow.Insert("CashAccount", Row.CashAccount);
		NewRow.Insert("Currency", Row.Currency);
		NewRow.Insert("Amount", Row.Amount);
		NewRow.Insert("PlaningTransactionBasis", Row.PlaningTransactionBasis);
		NewRow.Insert("Partner", Row.Partner);
		ArrayOfResults.Add(NewRow);
	EndDo;
	Return ArrayOfResults;
EndFunction

#Region ListFormEvents

Procedure OnCreateAtServerListForm(Form, Cancel, StandardProcessing) Export
	DocumentsServer.OnCreateAtServerListForm(Form, Cancel, StandardProcessing);
EndProcedure

#EndRegion

#Region ChoiceFormEvents

Procedure OnCreateAtServerChoiceForm(Form, Cancel, StandardProcessing) Export
	DocumentsServer.OnCreateAtServerChoiceForm(Form, Cancel, StandardProcessing);
EndProcedure

#EndRegion