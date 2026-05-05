# Статус Агента

## Роль
Помощник по ремонту квартиры (Краков, Польша). Веду базу знаний, помогаю принимать решения по материалам, подрядчикам и бюджету.

## База знаний
Навигатор: [`baza_znaniy/README.md`](./baza_znaniy/README.md)

### Готовые файлы

| Файл | Содержание |
|------|------------|
| [`baza_znaniy/06_pravo_dokumenty/normy_powierzchni.md`](./baza_zaniy/06_pravo_dokumenty/normy_powierzchni.md) | Нормы подсчёта площади в Польше (PN-70, ISO 9836 1997/2015/2022) |
| [`baza_znaniy/03_materialy/inzhenernaya_doska.md`](./baza_zaniy/03_materialy/inzhenernaya_doska.md) | Инженерная доска Jawor-Parkiet: конструкция, цены, аксессуары |
| [`baza_zaniy/04_podradchiki/podradchiki_krakow.md`](./baza_zaniy/04_podradchiki/podradchiki_krakow.md) | Список фирм Кракова (S-Classic, V-Studio, New Point), таблица оценок |
| [`baza_zaniy/04_podradchiki/voprosy_podradchiku.md`](./baza_zaniy/04_podradchiki/voprosy_podradchiku.md) | Чек-лист вопросов при первом звонке |
| [`baza_zaniy/05_finansy/vat_8_percent.md`](./baza_zaniy/05_finansy/vat_8_percent.md) | Стратегия экономии: НДС 8%, Rabat wykonawczy, схема расчётов |
| [`baza_zaniy/04_podradchiki/issledovanie_podradchikov.md`](./baza_zaniy/04_podradchiki/issledovanie_podradchikov.md) | Исследование рынка: RU/UA фирмы Кракова, VAT 8%, Instagram vs сайты |
| [`baza_znaniy/02_remont_etapy/00_obshchiy_plan.md`](./baza_zaniy/02_remont_etapy/00_obshchiy_plan.md) | Общий план 7 этапов ремонта, зависимости, принципы |
| [`baza_znaniy/02_remont_etapy/01_demolazh.md`](./baza_zaniy/02_remont_etapy/01_demolazh.md) | Этап 1 DIY: демонтаж, очистка от никотина, шоппинг-лист, бюджет ~870–1465 zł |

### Следующие задачи
- [x] Провести цикл исследований 2025 через `search_skill_gemini.sh` (Подрядчики, HVAC, Цены)
- [ ] Выполнить Этап 1 (демонтаж + очистка) — см. `01_demolazh.md`
- [ ] Обзвонить новых подрядчиков (`Łazienka Dziś`, `Euromed-Bud`)
- [ ] Получить сметы и заполнить `sravnenie_predlozheniy.md`
- [ ] Уточнить площади помещений из техплана → заполнить `01_kvartira/dokumenty.md`
- [ ] Спланировать Этап 2: Электрика → `02_remont_etapy/02_elektryka.md`