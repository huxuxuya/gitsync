
#Использовать logos


Перем ВерсияПлагина;
Перем Лог;
Перем КомандыПлагина;

Перем Обработчик;

Функция Информация() Экспорт

	Возврат Новый Структура("Версия, Лог", ВерсияПлагина, Лог)

КонецФункции // Информация() Экспорт

Процедура ПриАктивизацииПлагина(СтандартныйОбработчик) Экспорт

	Обработчик = СтандартныйОбработчик;

КонецПроцедуры

Процедура ПриРегистрацииКомандыПриложения(ИмяКоманды, КлассРеализации, Парсер) Экспорт

	Лог.Отладка("Ищю команду <%1> в списке поддерживаемых", ИмяКоманды);
	Если КомандыПлагина.Найти(ИмяКоманды) = Неопределено Тогда
		Возврат;
	КонецЕсли;

	//Лог.Отладка("Устанавливаю дополнительные параметры для команды %1", ИмяКоманды);

КонецПроцедуры

Процедура ПередВыгрузкойКонфигурациюВИсходники(Конфигуратор, КаталогРабочейКопии, КаталогВыгрузки, ПутьКХранилищу, НомерВерсии, Формат) Экспорт

	Конфигуратор.СнятьКонфигурациюСПоддержки(Истина);

КонецПроцедуры


Функция Форматировать(Знач Уровень, Знач Сообщение) Экспорт

	Возврат СтрШаблон("[PLUGIN] %1: %2 - %3", ИмяПлагина(), УровниЛога.НаименованиеУровня(Уровень), Сообщение);

КонецФункции

Функция ИмяПлагина()
	возврат "disableSupport";
КонецФункции // ИмяПлагина()

Процедура Инициализация()

	ВерсияПлагина = "1.0.0";
	Лог = Логирование.ПолучитьЛог("oscript.app.gitsync.plugins."+ ИмяПлагина());
	КомандыПлагина = Новый Массив;
	КомандыПлагина.Добавить("sync");
	КомандыПлагина.Добавить("export");
	ПутьКФайлуВерсийМетаданных = "";
	ИмяФайлаДампаКонфигурации = "ConfigDumpInfo.xml";
	ВыгрузкаИзмененийВозможна = Ложь;
	Лог.УстановитьРаскладку(ЭтотОбъект);

КонецПроцедуры

Инициализация();
