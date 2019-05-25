# Hobby
[GITHUB](https://github.com) - Моя записная книжка!

<hr>

### Вектор-06Ц. Ожившее кино.
Лицензия: **Free**.

![](https://github.com/drilnet/vector-06c-kino/blob/master/UA.png)

Снято в **90**-х годах **XX** века! Использовался **8**-ми битный компьтер **Вектор-06Ц** с оцифровщиком изображения,
<br>
в качестве камеры использовалась телевизионная камера "**Взор**".
<br>
Съёмка: **Терентьев С.В.**

Программное обеспечение для **Вектор-06Ц** - программа **CINEMA**!
<br>
Смотрите каталог **Vector-06C**, там есть и исходники (исходники в кодировке **KOI8-R**).
<br>
Ещё упоминание о **CINEMA** здесь: [http://sensi.org/scalar/ware/825/](http://sensi.org/scalar/ware/825/)

Слева направо: **Рыков Виталик**. **Третьяков Андрей**. **Демидов Станислав**.

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

Украина. Харьков.

<hr>

Хотите собрать компьютер **Вектор-06Ц**?
<br>
Посмотрите вот этот проект: [Вектор-06Ц в ПЛИС](https://github.com/svofski/vector06cc)

<hr>

Что содержит репозиторий:

    Каталог: Disk Images 839            - Образы гибких дисков Вектор-06Ц с фильмами (4-ре фильма).
    Каталог: Frames - Demidov S. Disk 1 - Готовые кадры в формате BMP и TGA.
    Каталог: Frames - Demidov S. Disk 2 - -/-
    Каталог: Frames - Rykov V           - -/-
    Каталог: Frames - Tretyakov A       - -/-
    Каталог: GIF Animation              - Здесь 4-ре фильма в формате GIF.
    Каталог: Vector-06C                 - CINEMA с исходниками.

    160x128_Gray.bmp     - Файл используется для получения заголовка.
    160x128_Gray.bmp.hex - Заголовок BMP-файла в HEX (в шестнадцатеричной системе счисления).

    Скрипты которые конвертируют фильмы Вектор-06Ц в кадры:

       ConvertFilm839.Demidov.S.Disk.1.pl
       ConvertFilm839.Demidov.S.Disk.2.pl
       ConvertFilm839.Rykov.V.pl
       ConvertFilm839.Tretyakov.A.pl

    File160x128Graybmp2Hex.pl - Этот скрипт возвращает заголовок (в HEX) из BMP-файла (из файла: 160x128_Gray.bmp).
    MergedImages.pl           - Этот скрипт объединяет изображение программы Cinema с готовыми кадрами.

    Readme.RUS.1251.txt - Краткое описание в кодировке cp1251 (кодировка Windows).
    Readme.RUS.UTF8.txt - Краткое описание в кодировке UTF-8.

Все скрипты (*.**pl**) в кодировке **UTF-8**.

Дополнительная информация (размер гибкого диска, размер кадра и т.д.): [Wiki](https://github.com/drilnet/vector-06c-kino/wiki).

Украина. (**C**) Демидов С.В.

<hr>

**Дополнительные ссылки:**

* Вектор-06Ц в ПЛИС: [https://github.com/svofski/vector06cc](https://github.com/svofski/vector06cc)
* Картотека ПО для Вектор-06Ц: [http://sensi.org/scalar](http://sensi.org/scalar)
* Блог московского "макрушника" здесь: [http://macrobloger.com/vector-06c](http://macrobloger.com/vector-06c)
* CP/M для Windows: [http://www.sydneysmith.com/wordpress/cpm-programs/](http://www.sydneysmith.com/wordpress/cpm-programs/)
* Утилита для работы с образами CP/M дисков: [http://era-cg.su/steinblume/index.php?name=about&lang=ru](http://era-cg.su/steinblume/index.php?name=about&lang=ru)
* Различные сообщества ([ZX Spectrum](https://ru.wikipedia.org/wiki/ZX_Spectrum) ([UKR](https://uk.wikipedia.org/wiki/ZX_Spectrum)), [Вектор-06Ц](https://ru.wikipedia.org/wiki/%D0%92%D0%B5%D0%BA%D1%82%D0%BE%D1%80-06%D0%A6) ([UKR](https://uk.wikipedia.org/wiki/%D0%92%D0%B5%D0%BA%D1%82%D0%BE%D1%80-06%D0%A6)), [Специалист](https://ru.wikipedia.org/wiki/%D0%A1%D0%BF%D0%B5%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D1%81%D1%82_(%D0%BA%D0%BE%D0%BC%D0%BF%D1%8C%D1%8E%D1%82%D0%B5%D1%80)) и др.) живут здесь: [https://zx-pk.ru/](https://zx-pk.ru/)
* Информация по BDOS OC CP/M: [http://marinovsoft.narod.ru/korvet/bdos_doc.pdf](http://marinovsoft.narod.ru/korvet/bdos_doc.pdf)

<hr>

**Файловый архив Вектор'а-06Ц:**

```
* Системный диск Вектор'а-06Ц с МикроДОС Т-34 (Харьковский вариант).
* Библиотека ПК (Харьков 1993г.). Выпуск 1. ВЕКТОР-06Ц ИЗНУТРИ. Руководство для начинающих специалистов.
* Библиотека ПК (Харьков 1993г.). Выпуск 2. Системные программы МикроДОС ПК Вектор-06Ц.
* Библиотека ПК (Харьков 1993г.). Выпуск 3. Язык программирования ЛС-ПАСКАЛЬ.
```

[Перейти в архив Вектор'а-06Ц](https://drilnet.github.io/downloads/vector-06c/)

<hr>

**Ещё репозитории автора:**

**Репозиторий:** [Blender 3D. Модель игральной кости (dice).](https://github.com/drilnet/blender3d-dice2)
<br>
**Репозиторий:** [Blender 3D. Модель мотора (motor).](https://github.com/drilnet/blender3d-motor)
<br>
**Репозиторий:** [Blender 3D. Государственная символика Украины (Флаг, Герб).](https://github.com/drilnet/blender3d-ukrainian-symbols)
<br>
**Репозиторий:** [Blender 3D. Disabled Person (анимированная иконка).](https://github.com/drilnet/blender3d-disabled-person)
<br>
**Репозиторий:** [Скрипт, который подписывает цифровые фотографии.](https://github.com/drilnet/programming-perl-signature-images)
<br>
<br>
**Репозиторий:** [Вектор-06Ц. Конвертер графических файлов SPR в BMP.](https://github.com/drilnet/vector-06c-spr2bmp)
<br>
**Репозиторий:** [Вектор-06Ц. Конвертер графических файлов GRF в BMP.](https://github.com/drilnet/vector-06c-grf2bmp)
<br>
**Репозиторий:** [Скрипт, который показывает все цвета Вектор'а-06Ц.](https://github.com/drilnet/vector-06c-color256)
<br>
<br>
**Репозиторий:** [RLE кодирование своими руками (VRLE8).](https://github.com/drilnet/rle)

<hr>

**Полезные ссылки:**

[Правила оформления файла README.MD на GITHUB](https://github.com/OlgaVlasova/markdown-doc/blob/master/README.md#SpecialSymbol)
<br>
[Создаем свой сайт на Github](https://www.youtube.com/watch?v=05nLdIVfSRU)

<hr>

**Ох уж этот русский язык!**

Форум по русскому языку: [https://rusforus.ru](https://rusforus.ru)
<br>
Грамматика на PROMT Онлайн: https://www.translate.ru/grammar/ru-es/

<hr>

**Никогда не сдавайся!**
<br>
Написать мне можно на (**замечания**, **предложения**): stdls[ухо]mail.ru или bbarsinov[ухо]gmail.com
<br>
![](https://github.com/drilnet/blender3d-disabled-person/blob/master/Preview%20GIF/Disabled%20Person%20(mini).gif)
