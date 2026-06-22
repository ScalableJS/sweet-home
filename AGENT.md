# Статус Агента

## Роль
Помощник по ремонту и обустройству новой квартиры (Краков, Польша). Веду базу знаний, помогаю принимать решения по материалам, подрядчикам и бюджету.

## Контекст проекта
Это проект планирования ремонта квартиры в Кракове (Польша). Вся важная информация хранится в **базе знаний** (`baza_znaniy/`). Язык общения — русский.

---

## Главное правило: ВСЕГДА СОХРАНЯЙ В БАЗУ ЗНАНИЙ

> **Цель каждого разговора — наполнение базы знаний.**  
> Ты НЕ просто отвечаешь на вопросы. Ты — хранитель информации.  
> Любой полезный факт, решение, исследование или вывод из разговора **ОБЯЗАН** быть записан в соответствующий файл базы знаний.

### Как это работает

1. **В начале разговора** — прочитай этот файл и `baza_znaniy/README.md`, чтобы понять текущий статус проекта и структуру хранения.
2. **Во время разговора** — если пользователь делится новой информацией (результаты звонков, решения, находки, цены) — **сразу сохраняй** в нужный файл базы знаний.
3. **В конце разговора** — обнови этот файл (статус, новые файлы, следующие задачи) и таблицу статусов в `baza_znaniy/README.md`.

---

## Куда сохранять

Навигатор с полной структурой папок: [`baza_znaniy/README.md`](./baza_znaniy/README.md)

Краткая шпаргалка:

| Тип информации | Куда |
|---|---|
| Данные о квартире, площадях, документах | `baza_znaniy/01_kvartira/` |
| Этапы ремонта, **планы работ** (как монтировать, последовательность, зависимости) | `baza_znaniy/02_remont_etapy/` |
| Исследования **товаров и материалов** (что купить: бренды, модели, артикулы, цены, сравнения) | `baza_znaniy/03_materialy/` |
| Подрядчики, контакты, отзывы, оценки | `baza_znaniy/04_podradchiki/` |
| Бюджет, сметы, стратегия НДС | `baza_znaniy/05_finansy/` |
| Юридика, нормы, разрешения | `baza_znaniy/06_pravo_dokumenty/` |
| Инструменты, доступы к сервисам | `baza_znaniy/07_instrumenty/` |
| Всё о кухне (техника, мебель, распил) | `baza_znaniy/08_kuhnya/` |
| Саб-проект тумба под ТВ | `baza_znaniy/09_tumbochka_tv/` |

---

## Конвенции

### Товары vs Работы — не путать!

| Вопрос | Папка | Пример файла |
|---|---|---|
| **Что купить** (модели, артикулы, цены, ссылки на магазины) | `03_materialy/` | `santehnika_dush.md` |
| **Как делать** (план работ подрядчика, последовательность, выводы труб) | `02_remont_etapy/` | `03_santehnika.md` |

> Не смешивай: один файл — исследование товара, другой — этап ремонта. Не дублируй информацию между ними.

### Статусы товаров

В файлах `03_materialy/` каждый товар должен иметь статус:

| Маркер | Значение | Когда ставить |
|---|---|---|
| 🔍 Рассматривается | Товар найден, изучается, решение не принято | По умолчанию при добавлении |
| ✅ Выбрано | Решение принято, но ещё не куплено | После явного подтверждения пользователем |
| 🛒 Куплено | Товар оплачен / заказан | После факта покупки |

> **НЕ** пиши «Выбранная модель», если пользователь только рассматривает варианты. Используй «Рассматриваемая модель» (🔍).

### Чего НЕ делать

- **НЕ** оставлять важную информацию только в тексте ответа — она потеряется.
- **НЕ** создавать файлы вне структуры `baza_znaniy/` (кроме `AGENT.md` и `main.md`).
- **НЕ** записывать одну и ту же информацию дважды.

### Стиль работы
- Язык файлов и общения: **русский**.
- Технические термины (польские, строительные) давать в оригинале в скобках.
- При исследовании — проверять ссылки, искать независимые отзывы (не с сайта самой компании).
- При обновлении файлов — обновлять связанные файлы (README статус, AGENT.md, таблицы подрядчиков).

---

## База знаний
Навигатор: [`baza_znaniy/README.md`](./baza_znaniy/README.md)

### Готовые файлы

> Полная таблица статусов всех файлов — в [`baza_znaniy/README.md`](./baza_znaniy/README.md). Здесь — только основные.

| Файл | Содержание |
|------|------------|
| [`baza_znaniy/06_pravo_dokumenty/normy_powierzchni.md`](./baza_znaniy/06_pravo_dokumenty/normy_powierzchni.md) | Нормы подсчёта площади в Польше (PN-70, ISO 9836 1997/2015/2022) |
| [`baza_znaniy/03_materialy/inzhenernaya_doska.md`](./baza_znaniy/03_materialy/inzhenernaya_doska.md) | Инженерная доска Jawor-Parkiet: конструкция, цены, аксессуары |
| [`baza_znaniy/03_materialy/santehnika_dush.md`](./baza_znaniy/03_materialy/santehnika_dush.md) | Душевой комплект (Deante Cascada) и гигиенический душ (Silia / Logis): цены, спецификации |
| [`baza_znaniy/04_podradchiki/podradchiki_krakow.md`](./baza_znaniy/04_podradchiki/podradchiki_krakow.md) | Список фирм Кракова (S-Classic, V-Studio, New Point), таблица оценок |
| [`baza_znaniy/04_podradchiki/voprosy_podradchiku.md`](./baza_znaniy/04_podradchiki/voprosy_podradchiku.md) | Чек-лист вопросов при первом звонке |
| [`baza_znaniy/04_podradchiki/issledovanie_podradchikov.md`](./baza_znaniy/04_podradchiki/issledovanie_podradchikov.md) | Исследование рынка: RU/UA фирмы Кракова, VAT 8%, Instagram vs сайты |
| [`baza_znaniy/04_podradchiki/plan_issledovaniya_chastnikov.md`](./baza_znaniy/04_podradchiki/plan_issledovaniya_chastnikov.md) | План: частники (без НДС) vs комплексные фирмы (НДС 8%) |
| [`baza_znaniy/05_finansy/vat_8_percent.md`](./baza_znaniy/05_finansy/vat_8_percent.md) | Стратегия экономии: НДС 8%, Rabat wykonawczy, схема расчётов |
| [`baza_znaniy/05_finansy/modeli_cenoobrazovaniya.md`](./baza_znaniy/05_finansy/modeli_cenoobrazovaniya.md) | Модели ценообразования ремонтных фирм в Польше |
| [`baza_znaniy/02_remont_etapy/00_obshchiy_plan.md`](./baza_znaniy/02_remont_etapy/00_obshchiy_plan.md) | Общий план этапов ремонта, зависимости, принципы |
| [`baza_znaniy/02_remont_etapy/01_demolazh.md`](./baza_znaniy/02_remont_etapy/01_demolazh.md) | Этап 1 DIY: демонтаж, очистка от никотина, шоппинг-лист, бюджет ~870–1465 zł |
| [`baza_znaniy/02_remont_etapy/02_elektryka.md`](./baza_znaniy/02_remont_etapy/02_elektryka.md) | План работ: электрика |
| [`baza_znaniy/02_remont_etapy/02_stena_tv_klima.md`](./baza_znaniy/02_remont_etapy/02_stena_tv_klima.md) | Возведение стены G-K (ТВ-зона + кондиционеры) |
| [`baza_znaniy/02_remont_etapy/08_klimatyzacja_rekuperacja.md`](./baza_znaniy/02_remont_etapy/08_klimatyzacja_rekuperacja.md) | План: кондиционирование и рекуперация |
| [`baza_znaniy/07_instrumenty/scalablejs.md`](./baza_znaniy/07_instrumenty/scalablejs.md) | Доступ к ScalableJS: пользователь `oleg056@gmail.com`, remote repo `https://github.com/ScalableJS/sweet-home.git` |

### Следующие задачи
- [x] Провести цикл исследований 2025 через `search_skill_gemini.sh` (Подрядчики, HVAC, Цены)
- [ ] Выполнить Этап 1 (демонтаж + очистка) — см. `01_demolazh.md`
- [ ] Обзвонить новых подрядчиков (`Łazienka Dziś`, `Euromed-Bud`)
- [ ] Получить сметы и заполнить `sravnenie_predlozheniy.md`
- [ ] Уточнить площади из техплана → заполнить заглушку `01_kvartira/dokumenty.md`
- [ ] Юридика портала в несущей стене → создать `06_pravo_dokumenty/przebicie_sciany_nosnej.md` (pozwolenie + экспертиза + согласие wspólnoty)
- [ ] Зафиксировать в `vat_8_percent.md` ловушку «одна фактура vs покупаю материалы сам»