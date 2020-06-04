#language: ru
@tree
@Positive
Функционал: форма документа sales order


Как Разработчик
Я хочу создать форму документа заказ клиента
Для удобства формирования заказа клиента

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий



Сценарий: _023101 проверка отображения в заказе только доступных действующих соглашений по выбранному клиенту
# должны отображаться только соглашения с клиентом
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-239' с именем 'IRP-239'
	И я открываю навигационную ссылку 'e1cib/list/Document.SalesOrder'
	И я нажимаю на кнопку с именем 'FormCreate'
	И я нажимаю кнопку выбора у поля "Partner"
	И в таблице "List" я перехожу к строке:
			| 'Description' |
			| 'Ferron BP'  |
	И в таблице "List" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля "Agreement"
	Тогда таблица "List" стала равной:
		| 'Description'                   |
		| 'Basic Agreements, TRY'         |
		| 'Basic Agreements, $'           |
		| 'Basic Agreements, without VAT' |
	И в таблице "List" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля "Partner"
	И в таблице "List" я перехожу к строке:
			| 'Description' |
			| 'Kalipso'  |
	И в таблице "List" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля "Agreement"
	Тогда таблица "List" стала равной:
		| 'Description'            |
		| 'Personal Agreements, $' |
	И я закрываю текущее окно
	И Я закрываю текущее окно
	И я нажимаю на кнопку 'No'
	И я проверяю что в списке выбора не отображаются соглашения по которым закончился срок действия
		И я открываю навигационную ссылку 'e1cib/list/Catalog.Agreements'
		И в таблице "List" я перехожу к строке:
		| 'Description'           |
		| 'Basic Agreements, $' |
		И в таблице "List" я выбираю текущую строку
		И в поле 'End of use' я ввожу текст '02.11.2018'
		И я нажимаю на кнопку 'Save and close'
		И я закрываю текущее окно
		И я открываю навигационную ссылку 'e1cib/list/Document.SalesOrder'
		И я нажимаю на кнопку с именем 'FormCreate'
		И я нажимаю кнопку выбора у поля "Partner"
		И в таблице "List" я перехожу к строке:
			| 'Description' |
			| 'Ferron BP'  |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Agreement"
		Тогда таблица "List" стала равной:
			| 'Description'                   |
			| 'Basic Agreements, TRY'         |
			| 'Basic Agreements, without VAT' |
		И Я закрываю текущее окно
		И Я закрываю текущее окно
		И я нажимаю на кнопку 'No'
		И я открываю навигационную ссылку 'e1cib/list/Catalog.Agreements'
		И в таблице "List" я перехожу к строке:
			| 'Description'           |
			| 'Basic Agreements, $' |
		И в таблице "List" я выбираю текущую строку
		И в поле 'End of use' я ввожу текст '02.11.2019'
		И я нажимаю на кнопку 'Save and close'
		И я закрываю текущее окно

Сценарий: _023102 проверка выбора в поле Company только собственных компаний
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-240' с именем 'IRP-240'
	И я открываю навигационную ссылку 'e1cib/list/Document.SalesOrder'
	И я нажимаю на кнопку с именем 'FormCreate'
	И я нажимаю кнопку выбора у поля "Partner"
	И в таблице "List" я перехожу к строке:
		| 'Description' |
		| 'Ferron BP'  |
	И в таблице "List" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля "Agreement"
	И в таблице "List" я перехожу к строке:
		| 'Description'           |
		| 'Basic Agreements, TRY' |
	И в таблице "List" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля "Company"
	Тогда таблица "List" стала равной:
		| 'Description'  |
		| 'Main Company' |
	И я закрываю текущее окно
	И Я закрываю текущее окно
	И я нажимаю на кнопку 'No'

Сценарий: _023103 проверка подтягивания в поле Company информации из соглашения
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-240' с именем 'IRP-240'
	И я открываю навигационную ссылку 'e1cib/list/Document.SalesOrder'
	И я нажимаю на кнопку с именем 'FormCreate'
	И я нажимаю кнопку выбора у поля "Partner"
	И в таблице "List" я перехожу к строке:
			| 'Description' |
			| 'Ferron BP'  |
	И в таблице "List" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля "Agreement"
	И в таблице "List" я перехожу к строке:
		| 'Description'           |
		| 'Basic Agreements, TRY' |
	И в таблице "List" я выбираю текущую строку
	И элемент формы с именем "Company" стал равен 'Main Company'
	И Я закрываю текущее окно
	И я нажимаю на кнопку 'No'


Сценарий: _023104 проверка подтягивания в заказ склада из соглашения
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-241' с именем 'IRP-241'
	И я открываю навигационную ссылку 'e1cib/list/Document.SalesOrder'
	И я нажимаю на кнопку с именем 'FormCreate'
	И я нажимаю кнопку выбора у поля "Partner"
	И в таблице "List" я перехожу к строке:
			| 'Description' |
			| 'Ferron BP'  |
	И в таблице "List" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля "Agreement"
	И в таблице "List" я перехожу к строке:
		| 'Description'       |
		| 'Basic Agreements, without VAT' |
	И в таблице "List" я выбираю текущую строку
	И     элемент формы с именем "Store" стал равен 'Store 02'
	И я нажимаю кнопку выбора у поля "Agreement"
	И в таблице "List" я перехожу к строке:
		| 'Description'       |
		| 'Basic Agreements, TRY' |
	И в таблице "List" я выбираю текущую строку
	И     элемент формы с именем "Store" стал равен 'Store 01'
	И Я закрываю текущее окно
	И я нажимаю на кнопку 'No'

Сценарий: _023105 проверка отсутствия в заказе поля Account
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-241' с именем 'IRP-252'
	И я открываю навигационную ссылку 'e1cib/list/Document.SalesOrder'
	И я нажимаю на кнопку с именем 'FormCreate'
	И элемент формы "Account" отсутствует на форме


Сценарий: _023106 проверка стационарной формы подбора товара (заказ клиента)
	И я открываю навигационную ссылку 'e1cib/list/Document.SalesOrder'
	И я нажимаю на кнопку с именем 'FormCreate'
	И я заполняю общие реквизиты по заказу
		И я нажимаю кнопку выбора у поля "Partner"
		И в таблице "List" я перехожу к строке:
			| 'Description' |
			| 'Ferron BP'  |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Agreement"
		И в таблице "List" я перехожу к строке:
				| 'Description'       |
				| 'Basic Agreements, TRY' |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю кнопку выбора у поля "Legal name"
		И в таблице "List" я перехожу к строке:
				| 'Description' |
				| 'Company Ferron BP'  |
		И в таблице "List" я выбираю текущую строку
	Когда проверяю форму подбора товара с информацией по ценам в Sales order
	И в таблице "ItemList" я нажимаю на кнопку '% Offers'
	И в таблице "Offers" я нажимаю на кнопку с именем 'FormOK'
	И я нажимаю на кнопку 'Post and close'
	И я проверяю сохранение заказа
		Тогда таблица "List" содержит строки:
		| 'Currency'  | 'Partner'     | 'Status'   | 'Σ'         |
		| 'TRY'       | 'Ferron BP'   | 'Approved' | '2 050,00'  |
	И я закрыл все окна клиентского приложения




Сценарий: _023113 проверка наличия итогов в документе Sales order
	* Открытие формы списка документов Sales order
		И я открываю навигационную ссылку 'e1cib/list/Document.SalesOrder'
	* Выбор документа Sales order для проверки итогов
		И в таблице "List" я перехожу к строке:
		| Number |
		| 1      |
		И в таблице "List" я выбираю текущую строку
	* Проверка наличия итогов документа
		И     элемент формы с именем "ItemListTotalOffersAmount" стал равен '0,00'
		И     элемент формы с именем "ItemListTotalNetAmount" стал равен '3 686,44'
		И     элемент формы с именем "ItemListTotalTaxAmount" стал равен '663,56'
		И     элемент формы с именем "ItemListTotalTotalAmount" стал равен '4 350,00'
		И     элемент формы с именем "CurrencyTotalAmount" стал равен 'TRY'
