﻿
#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ПутьНачалоВыбораРепозитория(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	ДиалогОткрытия = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.ВыборКаталога); 
	ДиалогОткрытия.Каталог = Объект.КаталогРепозитория;  
	ДиалогОткрытия.Заголовок = "Выберите каталог репозитория"; 
	ДиалогОткрытия.Показать(Новый ОписаниеОповещения("ВыборКаталогаРепозитория_Завершение", ЭтотОбъект, "" ));
	
	Модифицированность = Истина;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура СоздатьРепозиторий(Команда)
	
	Если Модифицированность Тогда
		ПоказатьПредупреждение(, "Ошибка: Необходимо записать элемент справочника!");
		Возврат;	
	КонецЕсли;
	
	НайденныеФайлы = НайтиФайлы(Объект.КаталогРепозитория, "*", Истина);
	Если НайденныеФайлы.Количество() > 0 Тогда
		ПоказатьПредупреждение(, "Ошибка: Необходимо выбрать пустой каталог!");
		Возврат;		
	КонецЕсли;
	
	СоздатьРепозиторийНаСервере();
	
	НайденныеФайлы = НайтиФайлы(Объект.КаталогРепозитория, "*", Истина);
	Если НайденныеФайлы.Количество() > 0 Тогда
		ПоказатьПредупреждение(, "Репозиторий создан успешно!");
	Иначе
		ПоказатьПредупреждение(, "Неизвестная ошибка при создании репозитория!");	
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура СоздатьРепозиторийНаСервере()
	РаботаСGit.СоздатьНовыйРепозиторийВГИТ(Объект.Ссылка);
КонецПроцедуры

&НаКлиенте
Процедура ВыборКаталогаРепозитория_Завершение(Результат, Параметр) Экспорт
	Если Результат = Неопределено Тогда
		Возврат;
	КонецЕсли;
	Объект.КаталогРепозитория = Результат[0];
КонецПроцедуры

#КонецОбласти