﻿// Функция - Соеденение СAPI
//
// Параметры:
//  КонфигурацияПроекта	 - 	 - 
// 
// Возвращаемое значение:
//   - 
//
Функция СоеденениеСAPI(ИмяСервераПродуктовойСреды, ПользовательПубликацииAPI, ПарольПубликацииAPI) Экспорт

	//Возврат РаботаСПродуктовымиСредамиПовиИсп.СоеденениеСAPI(
	//	ИмяСервераПродуктовойСреды, ПользовательПубликацииAPI, ПарольПубликацииAPI);
	
КонецФункции

// Функция - Отправить запрос КAPI
//
// Параметры:
//  КонфигурацияПроекта			 - 	 - 
//  Проект						 - 	 - 
//  ДвоичныеДанныеФайлаПроекта	 - 	 - 
// 
// Возвращаемое значение:
//   - 
//
Функция ОтправитьПроектВПродуктовуюСреду(КонфигурацияПроекта,
	Проект, Знач ДвоичныеДанныеФайлаПроекта) Экспорт

//Файлы = Новый Структура;
//Файлы.Вставить("Имя", "f1");
//Файлы.Вставить("ИмяФайла", "file1.txt");
//Файлы.Вставить("Данные", Base64Значение("0J/RgNC40LLQtdGCINCc0LjRgCE="));
//Файлы.Вставить("Тип", "text/plain");

//Результат = КоннекторHTTP.Post("https://httpbin.org/post", Неопределено, Новый Структура("Файлы", Файлы));

	
	HttpСоединение = СоеденениеСAPI(
		КонфигурацияПроекта.ИмяСервераПродуктовойСреды, 
		КонфигурацияПроекта.ПользовательПубликацииAPI, 
		КонфигурацияПроекта.ПарольПубликацииAPI);
	
	Запрос = Новый HTTPЗапрос(СтрШаблон("/%1?object_name=%2",
		КонфигурацияПроекта.АдресПубликацииAPI,
		Проект.ИмяОбъекта));
		
	Запрос.УстановитьТелоИзДвоичныхДанных(ДвоичныеДанныеФайлаПроекта);
	
	РезультатЗапроса = HttpСоединение.Записать(Запрос);

	Возврат РезультатЗапроса.ПолучитьТелоКакСтроку();
	
КонецФункции

Функция ОтправитьВнешниеФайлыВБазу(АдресПубликацииAPI, КаталогРепозитория) Экспорт

	ПутьКВнешнимФайлам = СтрШаблон("%1/%2", КаталогРепозитория, "\build\epf\");
	Файлы = НайтиФайлы(ПутьКВнешнимФайлам, "*.e?f");
	ШаблонПути = "%1/add?object_name=%2";

	Аутентификация = Новый Структура("Пользователь, Пароль", "web", "web");
	
	Для Каждого Файл Из Файлы Цикл

		//ИмяВременногоФайла = ПолучитьИмяВременногоФайла(Файл.Расширение);
		//ВременныйФайл = Новый Файл(ИмяВременногоФайла);

		//КопироватьФайл(Файл.ПолноеИмя, ИмяВременногоФайла);

		ПередаваемыйФайл = Новый Структура;
		ПередаваемыйФайл.Вставить("Имя", Файл.ИмяБезРасширения);
		ПередаваемыйФайл.Вставить("ИмяФайла", Файл.Имя);
		ПередаваемыйФайл.Вставить("Данные",  Новый ДвоичныеДанные(Файл.ПолноеИмя));
		ПередаваемыйФайл.Вставить("Тип", "text/plain");
		
		//ПутьТест = "http://st-serv-dev-01/DEV_WMSRUSTL_CPS/hs/TW_DBE/test";
		//Результат = КоннекторHTTP.Post(ПутьТест, Неопределено, Новый Структура("Аутентификация", Аутентификация))
		ДополнительныеПараметры = Новый Структура;
		ДополнительныеПараметры.Вставить("Аутентификация", Аутентификация);
		ДополнительныеПараметры.Вставить("Файлы", ПередаваемыйФайл);
		
		Результат = КоннекторHTTP.Post(СтрШаблон(ШаблонПути, АдресПубликацииAPI, Файл.ИмяБезРасширения), Неопределено, ДополнительныеПараметры);
			
	КонецЦикла;

КонецФункции

