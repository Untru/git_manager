﻿// Функция - Соеденение СAPI
// 
// Возвращаемое значение:
//   - 
//
Функция СоеденениеСAPI() Экспорт

	АдресWebGitLab = РаботаСGit.ПолучитьИмяСервераИзСтрокиURL(Константы.АдресWebGitLab.Получить());
	HttpСоединение = Новый HTTPСоединение(АдресWebGitLab, 443, , , , 30,
		Новый ЗащищенноеСоединениеOpenSSL(Неопределено, Неопределено));
		
	Возврат HttpСоединение;
	
КонецФункции