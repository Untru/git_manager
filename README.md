```mermaid

graph TD
    A[ПриСозданииОбъекта] --> B[ОбработатьКоманду]
    B --> C[НастройкиВыполнения]
    B --> D[ИнициализироватьНастройки]
    B --> E[ИнициализироватьКластер]
    B --> F[ИнициализироватьГит]
    B --> G[ИнициализироватьКонфигуратор]
    B --> H[_КомандыГИТ.ТекущаяВетка = NewBranche]
    B --> I[_КомандыГИТ.ПерейтиНаВеткуИзДевелоп]
    B --> J[файловыеОперации.ОбеспечитьПустойКаталог]
    B --> K[_КомандыКластер.ЗаблокироватьБазу]
    B --> L[Если _КомандыПараметры.ВернутьСвойство("LoadDB") Тогда]
    L --> M[_КомандыКонфигуратор.ОбновитьБазуИзФайлов]
    B --> N[_КомандыКонфигуратор.ЗагрузитьРасширенияИзФайлов]
    B --> O[Если ЗначениеЗаполнено(_КомандыПараметры.ВернутьСвойство("NamesDataProcessors")) Тогда]
    O --> P[_КомандыКонфигуратор.СобратьОбработки]
    B --> Q[Если Ложь Тогда]
    Q --> R[_КомандыКонфигуратор.ОбновитьОбработкиВКонфигурации]
    B --> S[_КомандыКластер.РазблокироватьБазу]

    subgraph Инициализация
        D --> _1[ИнициализироватьНастройки]
        E --> _2[ИнициализироватьКластер]
        F --> _3[ИнициализироватьГит]
        G --> _4[ИнициализироватьКонфигуратор]
    end

    subgraph НастройкиВыполнения
        C --> PathRepository
        C --> NewBranche
        C --> NameDB
        C --> UsrLogin1c
        C --> UsrPswd1c
        C --> PathServer1с
        C --> NumberPlatform
        C --> TypeDB
        C --> UsrLoginDB
        C --> UsrPswdDB
        C --> PathServerDB
        C --> RunRas
        C --> NamesDataProcessors
        C --> LoadDB
        C --> MethodLoadDB
        C --> Extensions
    end

    subgraph Команды
        _1 --> КомандыПараметры
        _2 --> КомандыКластер
        _3 --> КомандыГИТ
        _4 --> КомандыКонфигуратор
    end
```
