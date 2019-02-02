# hobby
### Ожившее кино. Вектор-06Ц.
Лицензия: **Free**.

![](https://github.com/drilnet/vector-06c-kino/blob/master/UA.png)

Снято в **90**-х годах **XX** века! Использовался **8**-ми битный компьтер **Вектор-06Ц** с оцифровщиком изображения.
<br>
В качестве камеры использовалась телевизионная камера "**Взор**".
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

Для конвертации видео с **Вектор-06Ц** использовались написанные скрипты на [Perl](http://www.perl.org) (см. ниже).

**Внимание!**
<br>
Конвертация только в **Gray** цветах!
<br>
Конвертация с сохранением тех цветов, которые на **Вектор-06Ц** - [здесь](https://github.com/drilnet/vector-06c-kino/tree/kino-color)

Дополнительная информация.
<br>
Идея и разработка оцифровщика (аппаратная часть и часть кода): **Терентьев С.В.**
<br>
Доработка программного обеспечения (программа **CINEMA**): **Третьяков А.Л.**
<br>
**Украина**. **Харьков**.

<hr>

Хотите собрать компьютер **Вектор-06Ц**?
<br>
Посмотрите вот этот проект: [Вектор-06Ц в ПЛИС](https://github.com/svofski/vector06cc)

<hr>

Что содержит репозиторий:

    Каталог: Disk Images 839            - Образы гибких дисков Вектор-06Ц с фильмами (4-ре фильма).
    Каталог: Frames - Demidov S. Disk 1 - Готовые кадры в формате bmp и tga.
    Каталог: Frames - Demidov S. Disk 2 - -/-
    Каталог: Frames - Rykov V           - -/-
    Каталог: Frames - Tretyakov A       - -/-
    Каталог: GIF Animation              - Здесь 4-ре фильма в формате gif.
    Каталог: Vector-06C                 - CINEMA с исходниками.

    160x128_Gray.bmp     - Файл используется для получения заголовка.
    160x128_Gray.bmp.hex - Заголовок bmp файла в Hex (в шестнадцатеричной системе счисления).

    Скрипты которые конвертируют фильмы Вектор-06Ц в кадры:

       ConvertFilm839.Demidov.S.Disk.1.pl
       ConvertFilm839.Demidov.S.Disk.2.pl
       ConvertFilm839.Rykov.V.pl
       ConvertFilm839.Tretyakov.A.pl

    File160x128Graybmp2Hex.pl - Этот скрипт возвращает заголовок (в Hex) из bmp файла (из файла: 160x128_Gray.bmp).
    MergedImages.pl           - Этот скрипт объединяет изображения.

    Readme.RUS.1251.txt - Краткое описание в кодировке cp1251 (кодировка Windows).
    Readme.RUS.UTF8.txt - Краткое описание в кодировке UTF-8.

Все скрипты (*.**pl**) в кодировке **UTF-8**.

Дополнительная информация (размер гибкого диска, размер кадра и т.д.): [Wiki](https://github.com/drilnet/vector-06c-kino/wiki)

<hr>

**Дополнительные ссылки:**

* Вектор-06Ц в ПЛИС: [https://github.com/svofski/vector06cc](https://github.com/svofski/vector06cc)
* Картотека ПО для Вектор-06Ц: [http://sensi.org/scalar](http://sensi.org/scalar)
* Блог московского "макрушника" здесь: [http://macrobloger.com/vector-06c](http://macrobloger.com/vector-06c)

<hr>

**Ещё репозитории автора:**

**Репозиторий:** [Blender 3D. Модель игральной кости (dice).](https://github.com/drilnet/blender3d-dice2)
<br>
**Репозиторий:** [Blender 3D. Модель мотора (motor).](https://github.com/drilnet/blender3d-motor)
<br>
**Репозиторий:** [Скрипт который подписывает цифровые фотографии.](https://github.com/drilnet/programming-perl-signature-images)
<br>
**Репозиторий:** [Вектор-06Ц. Конвертер графических файлов SPR в BMP.](https://github.com/drilnet/vector-06c-spr2bmp)

<hr>

**Полезные ссылки:**

[Правила оформления файла README.MD на GITHUB](https://github.com/OlgaVlasova/markdown-doc/blob/master/README.md#SpecialSymbol)
