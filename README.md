# Hobby
[GITHUB](https://github.com) - Моя записная книжка (наброски, заметки и т.д. и т.п.)!

<hr>

## Вектор-06Ц. Ожившее кино
Лицензия (License): **Free**.

![](https://github.com/drilnet/vector-06c-kino/blob/master/UA.png)

Снято в **90**-х годах **XX** века! Использовался **8**-ми битный компьютер **Вектор-06Ц** с "видео-оцифровщиком",
<br>
в качестве камеры использовалась телевизионная камера "**Взор**".
<br>
Съёмка: **Терентьев С.В.**

Программное обеспечение для **Вектор-06Ц** - программа **CINEMA**!
<br>
Смотрите каталог **Vector-06C**, там есть и исходники (исходники в кодировке **KOI8-R**).
<br>
Ещё упоминание о **CINEMA** было здесь: [http://sensi.org/scalar/ware/825/](http://sensi.org/scalar/ware/825/)

Слева направо: **Рыков Виталик**, **Третьяков Андрей**, **Демидов Станислав**.

![](https://github.com/drilnet/vector-06c-kino/blob/master/GIF%20Animation/Gray.%20Rykov%20V.gif) ![](https://github.com/drilnet/vector-06c-kino/blob/master/GIF%20Animation/Gray.%20Tretyakov%20A.gif) ![](https://github.com/drilnet/vector-06c-kino/blob/master/GIF%20Animation/Gray.%20Demidov%20S.%201.gif)

И ещё одно видео со мной: [Демидов Станислав (видео 2)](https://github.com/drilnet/vector-06c-kino/blob/master/GIF%20Animation/Gray.%20Demidov%20S.%202.gif)

Фильм на **Вектор-06Ц** занимал одну дискету (**один гибкий магнитный диск**)!

Для конвертации видео с **Вектор-06Ц** использовались написанные скрипты на [Perl](http://www.perl.org).

**Внимание!**
<br>
Конвертация только в **Gray** цветах!
<br>
Конвертация с сохранением тех цветов, которые на **Вектор-06Ц** - [здесь](https://github.com/drilnet/vector-06c-kino/tree/kino-color)

Дополнительная информация.
<br>
Идея и разработка оцифровщика (аппаратная часть и часть кода): **(С) Терентьев С.В.**
<br>
Доработка программного обеспечения (программа **CINEMA**): **(С) Третьяков А.Л.**
<br>

[Ukraine](https://en.wikipedia.org/wiki/Ukraine) (Украина). Харьков.

<hr>

### Что содержит репозиторий:

    Каталог 'Disk Images 839'            - Образы гибких дисков Вектор'а-06Ц с "фильмами" (4-ре "фильма").
    Каталог 'Frames - Demidov S. Disk 1' - Готовые кадры в формате BMP и TGA.
    Каталог 'Frames - Demidov S. Disk 2' - -/-
    Каталог 'Frames - Rykov V'           - -/-
    Каталог 'Frames - Tretyakov A'       - -/-
    Каталог 'GIF Animation'              - Здесь 4-ре "фильма" в формате GIF.
    Каталог 'Vector-06C'                 - CINEMA с исходниками.

    Файл '160x128_Gray.bmp'     - Файл используется для получения заголовка.
    Файл '160x128_Gray.bmp.hex' - Заголовок BMP-файла в HEX (в шестнадцатеричной системе счисления).

    Скрипты, которые конвертируют "фильмы" Вектор'а-06Ц в кадры:

       Файл 'ConvertFilm839.Demidov.S.Disk.1.pl'.
       Файл 'ConvertFilm839.Demidov.S.Disk.2.pl'.
       Файл 'ConvertFilm839.Rykov.V.pl'.
       Файл 'ConvertFilm839.Tretyakov.A.pl'.

    Файл 'File160x128Graybmp2Hex.pl' - Этот скрипт возвращает заголовок (в HEX) из BMP-файла (из файла: "160x128_Gray.bmp").
    Файл 'MergedImages.pl'           - Этот скрипт объединяет изображение программы Cinema с готовыми кадрами.

    Файл 'Readme.RUS.1251.txt' - Краткое описание в кодировке cp1251 (кодировка Windows).
    Файл 'Readme.RUS.UTF8.txt' - Краткое описание в кодировке UTF-8.

Все скрипты (*.**pl**) в кодировке **UTF-8**.

Дополнительная информация (размер гибкого диска, размер кадра и т.д.): [Wiki](https://github.com/drilnet/vector-06c-kino/wiki)

[Ukraine](https://en.wikipedia.org/wiki/Ukraine) (Украина). (**C**) Демидов С.В.

<hr>

**Дополнительные ссылки:**

* Вектор-06Ц в ПЛИС: [https://github.com/svofski/vector06cc](https://github.com/svofski/vector06cc)
* Картотека ПО для Вектор-06Ц: [http://sensi.org/scalar](http://sensi.org/scalar)
* Блог московского "макрушника" здесь: [http://macrobloger.com/vector-06c](http://macrobloger.com/vector-06c)
* TIMSoft (Вектор-06Ц): `http://vector06c.fdd5-25.net/index.html` - Перестал существовать (жаль)!
* CP/M для Windows: [http://www.sydneysmith.com/wordpress/cpm-programs/](http://www.sydneysmith.com/wordpress/cpm-programs/)
* Утилита для работы с образами CP/M дисков: [http://era-cg.su/steinblume/index.php?name=about&lang=ru](http://era-cg.su/steinblume/index.php?name=about&lang=ru)
* Различные сообщества ([ZX Spectrum](https://ru.wikipedia.org/wiki/ZX_Spectrum) ([UKR](https://uk.wikipedia.org/wiki/ZX_Spectrum)), [Вектор-06Ц](https://ru.wikipedia.org/wiki/%D0%92%D0%B5%D0%BA%D1%82%D0%BE%D1%80-06%D0%A6) ([UKR](https://uk.wikipedia.org/wiki/%D0%92%D0%B5%D0%BA%D1%82%D0%BE%D1%80-06%D0%A6)), [Специалист](https://ru.wikipedia.org/wiki/%D0%A1%D0%BF%D0%B5%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D1%81%D1%82_(%D0%BA%D0%BE%D0%BC%D0%BF%D1%8C%D1%8E%D1%82%D0%B5%D1%80)) и др.) живут здесь: [https://zx-pk.ru/](https://zx-pk.ru/)
* Информация по BDOS OC CP/M: [http://marinovsoft.narod.ru/korvet/bdos_doc.pdf](http://marinovsoft.narod.ru/korvet/bdos_doc.pdf)

<hr>

**Файловый архив Вектор'а-06Ц:**

```
* Системный диск Вектор'а-06Ц с МикроДОС Т-34 (Харьковский вариант), системный диск 1
* Скриншоты файлового менеджера CO (Шишатский Коммандер)
* Библиотека ПК (Харьков 1993г.). Выпуск 1. ВЕКТОР-06Ц ИЗНУТРИ. Руководство для начинающих специалистов
* Библиотека ПК (Харьков 1993г.). Выпуск 2. Системные программы МикроДОС ПК Вектор-06Ц
* Библиотека ПК (Харьков 1993г.). Выпуск 3. Язык программирования ЛС-ПАСКАЛЬ
* ПРОГРАММИРУЕМЫЙ ГЕНЕРАТОР ЗВУКА AY-3-8910 (ХАРЬКОВСКИЙ ВАРИАНТ - ЦЕНТР "ТЕНЬ"), ПЛЮС "COVOX-D"
* Трехканальный музыкальный таймер AY-3-8912 и AY-3-8910 (БИС AY-3-8912 и AY-3-8910)
* Таблица команд микропроцессора КР580ИК80 (КР580ВМ80А, Intel 8080)
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Перейти в архив Вектор'а-06Ц](https://drilnet.github.io/downloads/vector-06c/downloads.html "Системный диск Вектор'а-06Ц. Скриншоты CO. Библиотека ПК")

<hr>

**Ещё репозитории автора:**

**Репозиторий:** [Blender 3D. Модель игральной кости (dice)](https://github.com/drilnet/blender3d-dice2)
<br>
**Репозиторий:** [Blender 3D. Модель мотора (motor).](https://github.com/drilnet/blender3d-motor)
<br>
**Репозиторий:** [Blender 3D. Государственная символика Украины (Флаг, Герб)](https://github.com/drilnet/blender3d-ukrainian-symbols)
<br>
**Репозиторий:** [Blender 3D. Disabled Person (анимированная иконка)](https://github.com/drilnet/blender3d-disabled-person)
<br>
**Репозиторий:** [Blender 3D. Флоппи диск 3.5"](https://github.com/drilnet/blender3d-floppy-disk-35)
<br>
**Репозиторий:** [Blender 3D. Логотип VRLE8 и Логотип VRLE16](https://github.com/drilnet/blender3d-logovrle8-logovrle16)
<br>
**Репозиторий:** [Blender 3D. Микросхема TEA2025B в 3D](https://github.com/drilnet/blender3d-tea2025b)
<br>
<br>
**Репозиторий:** [Скрипт, который подписывает цифровые фотографии](https://github.com/drilnet/programming-perl-signature-images "Скрипт написан на Perl")
<br>
<br>
**Репозиторий:** [Вектор-06Ц. Конвертер графических файлов SPR в BMP](https://github.com/drilnet/vector-06c-spr2bmp "Конвертер SPR в BMP написан на Си (и есть версия на Perl)")
<br>
**Репозиторий:** [Вектор-06Ц. Конвертер графических файлов GRF в BMP](https://github.com/drilnet/vector-06c-grf2bmp "Конвертер GRF в BMP написан на Си (и есть версия на Perl)")
<br>
**Репозиторий:** [Скрипт, который показывает все цвета Вектор'а-06Ц](https://github.com/drilnet/vector-06c-color256 "Скрипт написан на Perl")
<br>
<br>
**Репозиторий:** [RLE кодирование/декодирование своими руками (VRLE8, VRLE16)](https://github.com/drilnet/rle)
<br>
**Репозиторий:** [Игра Пятнашки (Puzzle 15, Game 15), игра написана на JavaScript](https://github.com/drilnet/puzzle15 "Игра для вашего сайта")
<br>
**Репозиторий:** [Мой сайт (репозиторий моего сайта)](https://github.com/drilnet/drilnet.github.io "Репозиторий сайта https://drilnet.github.io")
<br>
<br>
**Репозиторий:** [Электроника (всё в одном репозитории)](https://github.com/drilnet/electronics)

&nbsp;&nbsp;&nbsp;&bull; [Усилитель звука на микросхеме
 TEA2025B](https://github.com/drilnet/electronics/tree/master/AUDIO%20AMPLIFIER%20TEA2025B "Схема, печатная плата, собранная плата")
<br>
&nbsp;&nbsp;&nbsp;&bull; [Биполярный транзистор в ключевом режиме (формулы, расчёты)](https://github.com/drilnet/electronics/tree/master/Bipolar%20transistor%20in%20key%20mode "Формат файлов: LibreOffice (odt), pdf, TinyCAD (dsn), png, LTspice XVII (asc)")
<br>
&nbsp;&nbsp;&nbsp;&bull; [Ящик для экспонирования фоторезиста](https://github.com/drilnet/electronics/tree/master/Box%20For%20Exposure%20Photoresist "Ящик из подручного материала")
<br>
&nbsp;&nbsp;&nbsp;&bull; [Калькулятор ближайшее стандартное сопротивление (HTML + JS)](https://github.com/drilnet/electronics/tree/master/Calculator%20nearest%20standard%20resistance "Набор резисторов: E24, E48, E96")
<br>
&nbsp;&nbsp;&nbsp;&bull; [Делитель напряжения на двух резисторах (формулы, расчёты, калькулятор на HTML + JS)](https://github.com/drilnet/electronics/tree/master/Divider%20by%20R1%20and%20R2%20(formulas%2C%20calculations%2C%20HTML%20%2B%20JavaScript%20calculator) "Формат файлов: LibreOffice (odt, odf), pdf, TinyCAD (dsn), png, html, js")
<br>
&nbsp;&nbsp;&nbsp;&bull; [Стабилизированный блок питания +5В/1А, -5В/0.3A, +12В/0.5А, -12В/0.5А](https://github.com/drilnet/electronics/tree/master/Power%20Supply%20%2B5V%2C%20-5V%2C%20%2B12V%2C%20-12V "Трансформаторный (используемые микросхемы: L7805CV, L7905CV, L7812CV, L7912CV)")
<br>
 &nbsp;&nbsp;&nbsp;&bull; [Ремонт компьютерных колонок Genius SP-G06](https://github.com/drilnet/electronics/tree/master/Speakers%20Genius%20SP-G06 "Что было и Что стало")
 
 **Репозиторий:** [Интеллект. Искусственный интеллект](https://github.com/drilnet/Intelligence "Intelligence. Artificial Intelligence")
 
<hr>

**Полезные ссылки:**

[Правила оформления файла README.MD на GitHub](https://github.com/OlgaVlasova/markdown-doc/blob/master/README.md#SpecialSymbol "(C) Olga Vlasova")
<br>
[Шпаргалка по Markdown](https://github.com/sandino/Markdown-Cheatsheet "(C) Sandino")
<br>
[Создаем свой сайт на GitHub](https://www.youtube.com/watch?v=05nLdIVfSRU "(C) Анна Блок")

<hr>

**Никогда не сдавайся!**
<br>
Написать мне можно на (**замечания**, **предложения**): stdls[ухо]mail.ru или bbarsinov[ухо]gmail.com
<br>
![](https://github.com/drilnet/blender3d-disabled-person/blob/master/Preview%20GIF/Disabled%20Person%20(mini).gif "Человек с ограниченными возможностями")

<hr>

<div align="center">
<a href="https://drilnet.github.io">
<img src="https://github.com/drilnet/drilnet.github.io/blob/master/images/gotowebsite.gif" title="https://drilnet.github.io">
</a>
</div>
