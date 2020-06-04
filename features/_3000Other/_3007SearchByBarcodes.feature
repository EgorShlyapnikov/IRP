#language: ru
@tree
@Positive


Функционал: добавление товара в документы по штрих-коду

Как разработчик
Я хочу добавить функционал по добавлению товара в документы по штрих-коду
Для работы с товаром


Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: _300701 проверка поиска по штрих-коду в Sales order + заполнение цены и налогов
	И я открываю навигационную ссылку 'e1cib/list/Document.SalesOrder'
	Когда проверяю поиск по штрих-коду в документах продажи + заполнение цены и налогов

Сценарий: _300702 проверка поиска по штрих-коду в Sales invoice + заполнение цены и налогов
	И я открываю навигационную ссылку 'e1cib/list/Document.SalesInvoice'
	Когда проверяю поиск по штрих-коду в документах продажи + заполнение цены и налогов

Сценарий: _300703 проверка поиска по штрих-коду в Sales return + заполнение цены и налогов
	И я открываю навигационную ссылку 'e1cib/list/Document.SalesReturn'
	Когда проверяю поиск по штрих-коду в документах возврата продажи

Сценарий: _300704 проверка поиска по штрих-коду в Sales return order + заполнение цены и налогов
	И я открываю навигационную ссылку 'e1cib/list/Document.SalesReturnOrder'
	Когда проверяю поиск по штрих-коду в документах возврата продажи

Сценарий: _300705 проверка поиска по штрих-коду в Purchase order
	И я открываю навигационную ссылку 'e1cib/list/Document.PurchaseOrder'
	Когда проверяю поиск по штрих-коду в документах закупки/возвратов закупки

Сценарий: _300706 проверка поиска по штрих-коду в Purchase invoice
	И я открываю навигационную ссылку 'e1cib/list/Document.PurchaseInvoice'
	И я нажимаю на кнопку с именем 'FormCreate'
	И я нажимаю кнопку выбора у поля "Partner"
	И в таблице "List" я перехожу к строке:
		| Description |
		| Partner Kalipso     |
	И в таблице "List" я выбираю текущую строку
	И я нажимаю на кнопку 'SearchByBarcode'
	И в поле 'InputFld' я ввожу текст '2202283713'
	И я нажимаю на кнопку 'OK'
	И я проверяю добавление товара и заполнение цены в табличной части
		И     таблица "ItemList" содержит строки:
			| 'Item'  |'Item key' |'Q'     | 'Unit' |
			| 'Dress TR' |'S/Yellow TR'  |'1,000' | 'adet'  |
	И Я закрыл все окна клиентского приложения

Сценарий: _300707 проверка поиска по штрих-коду в Purchase return order
	И я открываю навигационную ссылку 'e1cib/list/Document.PurchaseReturnOrder'
	Когда проверяю поиск по штрих-коду в документах закупки/возвратов закупки

Сценарий: _300708 проверка поиска по штрих-коду в Purchase return
	И я открываю навигационную ссылку 'e1cib/list/Document.PurchaseReturn'
	Когда проверяю поиск по штрих-коду в документах закупки/возвратов закупки

Сценарий: _300709 проверка поиска по штрих-коду в Goods reciept
	И я открываю навигационную ссылку 'e1cib/list/Document.GoodsReceipt'
	Когда проверяю поиск по штрих-коду в документах складских операций

Сценарий: _300710 проверка поиска по штрих-коду в Shipment confirmation
	И я открываю навигационную ссылку 'e1cib/list/Document.ShipmentConfirmation'
	Когда проверяю поиск по штрих-коду в документах складских операций

Сценарий: _300711 проверка поиска по штрих-коду в Inventory transfer
	И я открываю навигационную ссылку 'e1cib/list/Document.InventoryTransfer'
	Когда проверяю поиск по штрих-коду в документах складских операций

Сценарий: _300712 проверка поиска по штрих-коду в Inventory transfer order
	И я открываю навигационную ссылку 'e1cib/list/Document.InventoryTransferOrder'
	Когда проверяю поиск по штрих-коду в документах складских операций

Сценарий: _300713 проверка поиска по штрих-коду в Internal Supply Request
	И я открываю навигационную ссылку 'e1cib/list/Document.InternalSupplyRequest'
	Когда проверяю поиск по штрих-коду в документах складских операций

Сценарий: _300714 проверка поиска по штрих-коду в Boxing
	И я открываю навигационную ссылку 'e1cib/list/Document.Boxing'
	Когда проверяю поиск по штрих-коду в документах объединения товаров в наборы

Сценарий: _300715 проверка поиска по штрих-коду в Unboxing
	И я открываю навигационную ссылку 'e1cib/list/Document.Unboxing'
	Когда проверяю поиск по штрих-коду в документах объединения товаров в наборы

Сценарий: _300716 проверка поиска по штрих-коду в Bundling
	И я открываю навигационную ссылку 'e1cib/list/Document.Bundling'
	Когда проверяю поиск по штрих-коду в документах объединения товаров в наборы

Сценарий: _300717 проверка поиска по штрих-коду в Unbundling
	И я открываю навигационную ссылку 'e1cib/list/Document.Unbundling'
	Когда проверяю поиск по штрих-коду в документах объединения товаров в наборы

Сценарий: _300718 проверка поиска по штрих-коду в StockAdjustmentAsSurplus
	И я открываю навигационную ссылку 'e1cib/list/Document.StockAdjustmentAsSurplus'
	Когда проверяю поиск по штрих-коду в документах складских операций

Сценарий: _300719 проверка поиска по штрих-коду в StockAdjustmentAsWriteOff
	И я открываю навигационную ссылку 'e1cib/list/Document.StockAdjustmentAsWriteOff'
	Когда проверяю поиск по штрих-коду в документах складских операций


Сценарий: _300720 проверка поиска по штрих-коду в PhysicalInventory
	И я открываю навигационную ссылку 'e1cib/list/Document.PhysicalInventory'
	Когда проверяю поиск по штрих-коду в документе PhysicalInventory

Сценарий: _300721 проверка поиска по штрих-коду в PhysicalCountByLocation
	И я открываю навигационную ссылку 'e1cib/list/Document.PhysicalCountByLocation'
	Когда проверяю поиск по штрих-коду в документах складских операций