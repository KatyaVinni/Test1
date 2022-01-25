﻿#language: ru

@tree


Функционал: 
создание документа Поступление товаров

Как Менеджер по закупкам я хочу
создать документ Поступление товаров 
чтобы поставить товар на учет 

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание документа поступления товаров
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Строящийся склад'
* Проверка значения поля Склад
	Тогда элемент формы с именем "Склад" стал равен 'Строящийся склад'
		

	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И из выпадающего списка с именем "Поставщик" я выбираю точное значение 'Магазин "Бытовая техника"'
* Заполнение табличной части документа
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Колбаса'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
* Проверка заполнения табличной части
	Тогда таблица "Товары" содержит строки:
		| 'N' | 'Товар'   | 'Цена'   | 'Артикул' | 'Количество' | 'Сумма'    |
		| '1' | 'Колбаса' | '250,00' | 'Kol67'   | '15,00'      | '2 500,00' |		
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
	
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Проверка создания документа
И таблица  "Список" содержит строки:
	| 'Номер' | 
	| '$Номер$' | 

Сценарий: Проверка наличия в справочнике номенклатуры элемента Колбаса
И В командном интерфейсе я выбираю 'Закупки' 'Товары'
Тогда открылось окно 'Товары'
И я нажимаю на кнопку с именем 'ФормаСписок'
И таблица  "Список" содержит строки:
	| 'Наименование' |
	| 'Колбаса'      |