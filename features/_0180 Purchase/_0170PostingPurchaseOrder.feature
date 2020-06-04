#language: ru
@tree
@Positive


Функционал: проведение документа Заказ поставщику по регистрам складского учета

Как Разработчик
Я хочу создать проводки документа Заказ поставщику
Для того чтобы фиксировать какой товар заказан у поставщика

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: _017001 создание документа заказ поставщику - не ордерная схема
	* Открытие формы для создания Purchase Order
		И я открываю навигационную ссылку 'e1cib/list/Document.PurchaseOrder'
		И я нажимаю на кнопку с именем 'FormCreate'
	* Заполнение статуса
		И из выпадающего списка "Status" я выбираю точное значение 'Approved'
	* Заполнение информации о поставщике
		И я нажимаю кнопку выбора у поля "Partner"
		И в таблице "List" я перехожу к строке:
			| Description |
			| Ferron BP   |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Legal name"
		И в таблице "List" я активизирую поле "Description"
		И в таблице "List" я перехожу к строке:
			| Description       |
			| Company Ferron BP |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Agreement"
		И в таблице "List" я перехожу к строке:
			| Description        |
			| Vendor Ferron, TRY |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Store"
		И в таблице "List" я перехожу к строке:
			| 'Description' |
			| 'Store 01'  |
		И в таблице "List" я выбираю текущую строку
	* Присвоение документу номера №2
		И я перехожу к закладке "Other"
		И в поле 'Number' я ввожу текст '2'
		Тогда открылось окно '1C:Enterprise'
		И я нажимаю на кнопку 'Yes'
		И в поле 'Number' я ввожу текст '2'
	* Заполнение товарной части документа
		И я нажимаю на кнопку с именем 'Add'
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item"
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я активизирую поле "Item key"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item key"
		И в таблице "List" я перехожу к строке:
			| 'Item key' |
			| 'M/White'  |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Add'
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item"
		Тогда открылось окно 'Items'
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я активизирую поле "Item key"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item key"
		Тогда открылось окно 'Item keys'
		И в таблице "List" я перехожу к строке:
			| 'Item key' |
			| 'L/Green'  |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Add'
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item"
		Тогда открылось окно 'Items'
		И в таблице "List" я перехожу к строке:
			| 'Description' |
			| 'Trousers'    |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я активизирую поле "Item key"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item key"
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я перехожу к строке:
			| '#' | 'Item'  | 'Item key' | 'Unit' |
			| '1' | 'Dress' | 'M/White' | 'pcs' |
		И в таблице "ItemList" я активизирую поле "Q"
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" в поле 'Q' я ввожу текст '100'
		И в таблице "ItemList" в поле 'Price' я ввожу текст '200'
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я перехожу к строке:
			| '#' | 'Item'  | 'Item key' | 'Unit' |
			| '2' | 'Dress' | 'L/Green'  | 'pcs' |
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" в поле 'Q' я ввожу текст '200'
		И в таблице "ItemList" в поле 'Price' я ввожу текст '210'
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я перехожу к строке:
			| '#' | 'Item'     | 'Item key' | 'Unit' |
			| '3' | 'Trousers' | '36/Yellow'   | 'pcs' |
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" в поле 'Q' я ввожу текст '300'
		И в таблице "ItemList" в поле 'Price' я ввожу текст '250'
		И в таблице "ItemList" я завершаю редактирование строки
		# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-226' с именем 'IRP-226'
		И я проверяю наличие склада в табличной части
			И     таблица "ItemList" содержит строки:
			| 'Item'     | 'Q' | 'Item key'  | 'Store' | 'Unit' |
			| 'Dress'    | '100,000'  | 'M/White'   | 'Store 01'      | 'pcs' |
	* Проведение документа
		И я нажимаю на кнопку 'Post and close'

Сценарий: _017002 проверка проводок по документу Purchase Order по регистру Order Balance (плюс) - не ордерная схема
	* Открытие регистра Order Balance
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.OrderBalance'
	* Проверка формы регистра
		Если в таблице "List" есть колонки Тогда
			| 'Period' |
			| 'Quantity' |
			| 'Recorder' |
			| 'Line number' |
			| 'Store' |
			| 'Order' |
			| 'Item key' |
	* Проверка движения Purchase Order №2 по регистру Order Balance
	Тогда таблица "List" содержит строки:
		| 'Quantity' | 'Recorder'          | 'Line number' | 'Store'    | 'Order'             | 'Item key' |
		| '100,000'  | 'Purchase order 2*' | '1'           | 'Store 01' | 'Purchase order 2*' | 'M/White' |
		| '200,000'  | 'Purchase order 2*' | '2'           | 'Store 01' | 'Purchase order 2*' | 'L/Green'  |
		| '300,000'  | 'Purchase order 2*' | '3'           | 'Store 01' | 'Purchase order 2*' | '36/Yellow'   |

Сценарий: _017003 создание документа заказ поставщику - ордерная схема
	* Открытие формы для создания Purchase Order
		И я открываю навигационную ссылку 'e1cib/list/Document.PurchaseOrder'
		И я нажимаю на кнопку с именем 'FormCreate'
	* Заполнение реквизитов
		И я нажимаю кнопку выбора у поля "Company"
		И в таблице "List" я перехожу к строке:
		| Description  |
		| Main Company |
		И в таблице "List" я выбираю текущую строку
		И из выпадающего списка "Status" я выбираю точное значение 'Approved'
	* Заполнение информации о поставщике
		И я нажимаю кнопку выбора у поля "Partner"
		И в таблице "List" я перехожу к строке:
			| Description |
			| Ferron BP   |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Legal name"
		И в таблице "List" я активизирую поле "Description"
		И в таблице "List" я перехожу к строке:
			| Description       |
			| Company Ferron BP |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Agreement"
		И в таблице "List" я перехожу к строке:
			| Description        |
			| Vendor Ferron, USD |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Store"
		И в таблице "List" я перехожу к строке:
			| 'Description' |
			| 'Store 02'  |
		И в таблице "List" я выбираю текущую строку
	* Присвоение документу номера №3
		И я перехожу к закладке "Other"
		И в поле 'Number' я ввожу текст '3'
		Тогда открылось окно '1C:Enterprise'
		И я нажимаю на кнопку 'Yes'
		И в поле 'Number' я ввожу текст '3'
	* Заполнение товарной части документа
		И я нажимаю на кнопку с именем 'Add'
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item"
		Тогда открылось окно 'Items'
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я активизирую поле "Item key"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item key"
		Тогда открылось окно 'Item keys'
		И в таблице "List" я перехожу к строке:
			| 'Item key' |
			| 'L/Green'  |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я перехожу к строке:
			| '#' | 'Item'  | 'Item key' | 'Unit' |
			| '1' | 'Dress' | 'L/Green'  | 'pcs' |
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" в поле 'Q' я ввожу текст '500,000'
		И в таблице "ItemList" в поле 'Price' я ввожу текст '40,00'
		И в таблице "ItemList" я завершаю редактирование строки
	* Проведение документа
		И я нажимаю на кнопку 'Post and close'

Сценарий: _017004 проверка проводок по документу Purchase Order по регистру Order Balance (плюс) - ордерная схема
	* Открытие регистра Order Balance
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.OrderBalance'
	* Проверка движения Purchase Order №3 по регистру Order Balance
		Тогда таблица "List" содержит строки:
			| 'Quantity' | 'Recorder'          | 'Line number' | 'Store'    | 'Order'             | 'Item key' |
			| '500,000'  | 'Purchase order 3*' | '1'           | 'Store 02' | 'Purchase order 3*' | 'L/Green'  |

Сценарий: _017005 проверка движений по статусам и истории статусов документа Purchase Order
	И    Я закрыл все окна клиентского приложения
	* Открытие формы для создания Purchase Order
		И я открываю навигационную ссылку 'e1cib/list/Document.PurchaseOrder'
		И я нажимаю на кнопку с именем 'FormCreate'
	* Заполнение реквизитов
		И я нажимаю кнопку выбора у поля "Company"
		И в таблице "List" я перехожу к строке:
		| Description  |
		| Main Company |
		И в таблице "List" я выбираю текущую строку
	* Заполнение информации о поставщике
		И я нажимаю кнопку выбора у поля "Partner"
		И в таблице "List" я перехожу к строке:
			| Description |
			| Ferron BP   |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Legal name"
		И в таблице "List" я активизирую поле "Description"
		И в таблице "List" я перехожу к строке:
			| Description       |
			| Company Ferron BP |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Agreement"
		И в таблице "List" я перехожу к строке:
			| Description        |
			| Vendor Ferron, TRY |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Store"
		Тогда открылось окно 'Stores'
		И в таблице "List" я выбираю текущую строку
	* Проверка заполнения статуса по умолчанию "Wait"
		И элемент формы с именем "Status" стал равен "Wait"
	* Присвоение документу номера №101
		И я перехожу к закладке "Other"
		И в поле 'Number' я ввожу текст '101'
		Тогда открылось окно '1C:Enterprise'
		И я нажимаю на кнопку 'Yes'
		И в поле 'Number' я ввожу текст '101'
	* Заполнение товарной части
		И я нажимаю на кнопку с именем 'Add'
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item"
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я активизирую поле "Item key"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item key"
		И в таблице "List" я перехожу к строке:
			| 'Item key' |
			| 'M/White'  |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Add'
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item"
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я активизирую поле "Item key"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item key"
		И в таблице "List" я перехожу к строке:
			| 'Item key' |
			| 'L/Green'  |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Add'
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item"
		И в таблице "List" я перехожу к строке:
			| 'Description' |
			| 'Trousers'    |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я активизирую поле "Item key"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Item key"
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я перехожу к строке:
			| '#' | 'Item'  | 'Item key' | 'Unit' |
			| '1' | 'Dress' | 'M/White' | 'pcs' |
		И в таблице "ItemList" я активизирую поле "Q"
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" в поле 'Q' я ввожу текст '20,000'
		И в таблице "ItemList" в поле 'Price' я ввожу текст '200,00'
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я перехожу к строке:
			| '#' | 'Item'  | 'Item key' | 'Unit' |
			| '2' | 'Dress' | 'L/Green'  | 'pcs' |
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" в поле 'Q' я ввожу текст '20,000'
		И в таблице "ItemList" в поле 'Price' я ввожу текст '210,00'
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я перехожу к строке:
			| '#' | 'Item'     | 'Item key' | 'Unit' |
			| '3' | 'Trousers' | '36/Yellow'   | 'pcs' |
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" в поле 'Q' я ввожу текст '30,000'
		И в таблице "ItemList" в поле 'Price' я ввожу текст '210,00'
		И в таблице "ItemList" я завершаю редактирование строки
	* Проведение документа
		И я нажимаю на кнопку 'Post and close'
		И я закрываю текущее окно
	* Проверка отсутствия движений Purchase Order №101 по регистру Order Balance
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.OrderBalance'
		Тогда таблица "List" не содержит строки:
			| 'Recorder'          | 'Store'    | 'Order'             |
			| 'Purchase order 101*' | 'Store 01' | 'Purchase order 101*' |
		И    Я закрыл все окна клиентского приложения
	* Установка статуса по Purchase Order №101 'Approved'
		И я открываю навигационную ссылку 'e1cib/list/Document.PurchaseOrder'
		И в таблице "List" я перехожу к строке:
			| 'Number' |
			| '101'      |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю на гиперссылку с именем "DecorationGroupTitleCollapsedPicture"
		И из выпадающего списка "Status" я выбираю точное значение 'Approved'
		И я нажимаю на кнопку 'Post'
		И я нажимаю на гиперссылку с именем "DecorationStatusHistory"
		Тогда таблица "List" содержит строки:
			| Object             | Status   |
			| Purchase order 101* | Wait     |
			| Purchase order 101* | Approved |
		И я закрываю текущее окно
		И я нажимаю на кнопку 'Post and close'
		И я закрываю текущее окно
	* Проверка движений документа после установки статуса Approved
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.OrderBalance'
		Тогда таблица "List" содержит строки:
			| 'Recorder'          | 'Store'    | 'Order'             |
			| 'Purchase order 101*' | 'Store 01' | 'Purchase order 101*' |
		И я закрываю текущее окно
	* Проверка отмены проводок при изменении статуса Approved на Wait
		И я открываю навигационную ссылку 'e1cib/list/Document.PurchaseOrder'
		И в таблице "List" я перехожу к строке:
			| 'Number' |
			| '101'      |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю на гиперссылку "Decoration group title collapsed picture"
		И из выпадающего списка "Status" я выбираю точное значение 'Wait'
		И я нажимаю на кнопку 'Post'
		И я нажимаю на гиперссылку с именем "DecorationStatusHistory"
		Тогда таблица "List" содержит строки:
			| 'Object'             | 'Status'   |
			| 'Purchase order 101*' | 'Wait'     |
			| 'Purchase order 101*' | 'Approved' |
			| 'Purchase order 101*' | 'Wait'     |
		И я закрываю текущее окно
		И я нажимаю на кнопку 'Post and close'
		И я закрываю текущее окно
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.OrderBalance'
		Тогда таблица "List" не содержит строки:
			| 'Recorder'          | 'Store'    | 'Order'             |
			| 'Purchase order 101*' | 'Store 01' | 'Purchase order 101*' |
		И я закрываю текущее окно



Сценарий: _017011 проверка наличия итогов в документе Purchase Order
	* Открытие списка документов Purchase Order
		И я открываю навигационную ссылку 'e1cib/list/Document.PurchaseOrder'
	* Выбор документа PurchaseOrder
		И в таблице "List" я перехожу к строке:
		| Number |
		| 2      |
		И в таблице "List" я выбираю текущую строку
	* Проверка наличия итогов документа
		И     у элемента формы с именем "ItemListTotalOffersAmount" текст редактирования стал равен '0,00'
		И     элемент формы с именем "ItemListTotalNetAmount" стал равен '116 101,69'
		И     элемент формы с именем "ItemListTotalTaxAmount" стал равен '20 898,31'
		И     у элемента формы с именем "ItemListTotalTotalAmount" текст редактирования стал равен '137 000,00'

	


Сценарий: _017003 проверка формы подбора товара в документе Purchase order
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-380' с именем 'IRP-380'
	# необходимо дописать на проверку цен поставщика. Должны подтягиваться из соглашения
	* Открытие формы для создания Purchase Order
		И    Я закрыл все окна клиентского приложения
		И я открываю навигационную ссылку 'e1cib/list/Document.PurchaseOrder'
		И я нажимаю на кнопку с именем 'FormCreate'
	* Заполнение информации о поставщике
		И я нажимаю кнопку выбора у поля "Partner"
		И в таблице "List" я перехожу к строке:
			| Description |
			| Ferron BP   |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Legal name"
		И в таблице "List" я активизирую поле "Description"
		И в таблице "List" я перехожу к строке:
			| Description       |
			| Company Ferron BP |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Agreement"
		И в таблице "List" я перехожу к строке:
			| Description        |
			| Vendor Ferron, TRY |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Store"
		Тогда открылось окно 'Stores'
		И в таблице "List" я выбираю текущую строку
	* Проверка формы подбора товара
		Когда проверяю форму подбора товара с информацией по ценам в Purchase order
		И Я закрыл все окна клиентского приложения
	








