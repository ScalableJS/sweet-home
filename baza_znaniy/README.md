# База знаний — Ремонт квартиры (Краков)

> Этот файл — навигатор по базе знаний.  
> Агент использует его, чтобы понимать **куда сохранять** новые данные и **где искать** уже собранную информацию.

---

## Структура папок

```
baza_znaniy/
│
├── README.md                        ← этот файл (навигатор)
│
├── 01_kvartira/                     ← всё о самой квартире
│   ├── planirovka.md                   данные о планировке, уровнях, комнатах
│   ├── dokumenty.md                    площади по документам (KW, akt notarialny, tech plan)
│   └── osmotr_zamechaniya.md           замечания с осмотра перед покупкой/ремонтом
│
├── 02_remont_etapy/                 ← этапы ремонта (заполняется по мере планирования)
│   ├── 00_obshchiy_plan.md             общий план этапов, последовательность работ
│   ├── 01_demolazh.md                  снос, демонтаж, замуровки/проёмы
│   ├── 02_elektryka.md                 электрика
│   ├── 03_santehnika.md                сантехника / водопровод / канализация
│   ├── 04_poly.md                      напольные покрытия (подробно — инженерная доска, кафель)
│   ├── 05_steny_potolki.md             стены, потолки, штукатурка, покраска
│   ├── 06_dveri_okna.md                двери, окна, порталы
│   └── 07_chistovaya_otdelka.md        финальная отделка, мебель, декор
│
├── 03_materialy/                    ← исследования по материалам
│   ├── inzhenernaya_doska.md           инженерная доска (бренды, характеристики, цены)
│   ├── plitka_keramika.md              плитка / керамогранит
│   ├── shtukaturka_kraska.md           штукатурка, грунт, краска
│   └── ...
│
├── 04_podradchiki/                  ← подрядчики, фирмы, контакты
│   ├── podradchiki_krakow.md           список фирм, контакты, оценки
│   └── voprosy_podradchiku.md          чек-лист вопросов при первом звонке
│
├── 05_finansy/                      ← бюджет и финансовая стратегия
│   ├── byudzhet.md                     сводная таблица бюджета по этапам
│   ├── vat_8_percent.md                схема экономии на VAT 8%
│   └── sravnenie_predlozheniy.md       таблица сравнения смет от подрядчиков
│
├── 06_pravo_dokumenty/              ← юридика, документы
│   ├── normy_powierzchni.md            нормы подсчёта площади в Польше (PN-70, ISO 9836)
│   ├── pozvolenie_na_remont.md         когда нужно zgłoszenie / pozwolenie
│   └── biala_lista_vat.md              как проверить фирму (NIP, Biała Lista)
│
└── 07_vdohnovenie/                  ← референсы, идеи дизайна
    ├── stil_koncepciya.md              общая концепция стиля
    └── foto_referencii.md              ссылки / описания референсных фото
```

---

## Правила заполнения (для агента)

| Тип данных                          | Куда сохранять                                      |
|-------------------------------------|-----------------------------------------------------|
| Площади, документы на квартиру      | `01_kvartira/dokumenty.md`                          |
| Замечания с осмотра                 | `01_kvartira/osmotr_zamechaniya.md`                 |
| Общий план этапов ремонта           | `02_remont_etapy/00_obshchiy_plan.md`               |
| Детали конкретного этапа ремонта    | `02_remont_etapy/0X_<название>.md`                  |
| Исследование материала              | `03_materialy/<material>.md`                        |
| Подрядчики, контакты, оценки        | `04_podradchiki/podradchiki_krakow.md`              |
| Исследование рынка подрядчиков      | `04_podradchiki/issledovanie_podradchikov.md`       |
| Чек-лист вопросов подрядчику        | `04_podradchiki/voprosy_podradchiku.md`             |
| Финансы, бюджет                     | `05_finansy/byudzhet.md`                            |
| Стратегия VAT, экономия             | `05_finansy/vat_8_percent.md`                       |
| Сравнение смет                      | `05_finansy/sravnenie_predlozheniy.md`              |
| Юридика, нормы, разрешения          | `06_pravo_dokumenty/`                               |
| Дизайн-идеи, референсы             | `07_vdohnovenie/`                                   |

---

## Статус заполнения

| Файл                                          | Статус        | Дата обновления |
|-----------------------------------------------|---------------|-----------------|
| `06_pravo_dokumenty/normy_powierzchni.md`     | ✅ Готов      | 2026-04-23      |
| `03_materialy/inzhenernaya_doska.md`          | ✅ Готов      | 2026-04-26      |
| `04_podradchiki/podradchiki_krakow.md`        | ✅ Готов      | 2026-04-26      |
| `04_podradchiki/voprosy_podradchiku.md`       | ✅ Готов      | 2026-04-26      |
| `05_finansy/vat_8_percent.md`                 | ✅ Готов      | 2026-04-26      |
| `02_remont_etapy/00_obshchiy_plan.md`         | ✅ Готов      | 2026-04-26      |
| `02_remont_etapy/01_demolazh.md`              | ✅ Готов      | 2026-04-26      |
| `05_finansy/sravnenie_predlozheniy.md`        | ✅ Шаблон     | 2026-04-26      |
| `01_kvartira/dokumenty.md`                    | 🔲 Не начат   | —               |
| `05_finansy/byudzhet.md`                      | 🔲 Не начат   | —               |
