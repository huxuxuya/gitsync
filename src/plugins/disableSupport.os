
#Использовать logos


Перем ВерсияПлагина;
Перем Лог;
Перем КомандыПлагина;
Перем Описание;
Перем Обработчик;

Функция ОписаниеПлагина() Экспорт

	Возврат Описание;

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

Функция ИмяПлагина()
	возврат "disableSupport";
КонецФункции // ИмяПлагина()

Процедура Инициализация()

	ВерсияПлагина = "1.0.0";
	Лог = Логирование.ПолучитьЛог("oscript.app.gitsync_plugins_"+ СтрЗаменить(ИмяПлагина(),"-", "_"));
	КомандыПлагина = Новый Массив;
	КомандыПлагина.Добавить("sync");
	КомандыПлагина.Добавить("export");
	ПутьКФайлуВерсийМетаданных = "";
	ИмяФайлаДампаКонфигурации = "ConfigDumpInfo.xml";
	ВыгрузкаИзмененийВозможна = Ложь;

	Описание = Новый Структура("Версия, ИмяПакета, Автор, АдресАвтора, Описание, ТочкаВхода", ВерсияПлагина, ИмяПлагина());

КонецПроцедуры

Инициализация();
