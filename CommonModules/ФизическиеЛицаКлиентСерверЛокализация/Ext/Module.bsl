﻿///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2023, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Проверяет, верно ли написано ФИО физического лица.
//
// Параметры:
//  ФИО - Строка - фамилия, имя и отчество.
//  ТолькоНациональныеСимволы - Булево - при проверке ФИО должна включать только символы национального алфавита.
//  РезультатПроверки - Булево - возвращаемое значение. Если Истина, то ФИО написано верно.
//
Процедура ФИОНаписаноВерно(Знач ФИО, Знач ТолькоНациональныеСимволы, РезультатПроверки) Экспорт
	
	// Локализация 
	
	ДопустимыеСимволы = "-";
	
	РезультатПроверки = (Не ТолькоНациональныеСимволы И СтроковыеФункцииКлиентСервер.ТолькоЛатиницаВСтроке(ФИО, Ложь, ДопустимыеСимволы))
		Или СтроковыеФункцииКлиентСерверРФ.ТолькоКириллицаВСтроке(ФИО, Ложь, ДопустимыеСимволы);
	
	// Конец Локализация
	
КонецПроцедуры

#КонецОбласти

