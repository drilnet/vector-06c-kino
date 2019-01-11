
# Perl5-5.26.2. Ukraine. (C) Demidov S.V.
# Пример вызова: $ perl MergedImages(Gray).pl

# Скрипт объединяет изображения (Gray).
# Используется ImageMagick!

	# Для объявления переменных.
	use strict;

	# В случае возникновений каких-либо проблем нужно остановить работу скрипта.
	use warnings FATAL => 'all';

	my $path_read; # Путь к кадрам (чтение).
	my $path_save; # Путь к кадрам (запись).

	my $countcatalog; # Счётчик для каталогов.
	my $countfile;    # Счётчик для файлов.
	my $filename;     # Текущее имя файла (кадра).
	my $newfilename;  # Новое название файла (кадра).
	my $convert;      # Готовая команда для ImageMagick.

	my @array_path_read; # Массив каталогов (входные изображения).
	my @array_path_save; # Массив каталогов (выходные изображения) 

	my @filename_array;  # Имена файлов (кадров) в массиве.

# Очистить консоль.
system('clear');

	# Берём изображения (кадры) отсюда:
	@array_path_read = ('Frames - Demidov S. Disk 1',
				'Frames - Demidov S. Disk 2',
					'Frames - Rykov V.',
						'Frames - Tretyakov A.');

	# Дальше объединяем с этим изображением:
	# 'Vector-06C/Cinema-Screenshot.Contrast-50.Bright-40.png'

	# После объединения, изображения (кадры) складываем сюда:
	@array_path_save = ('Frames - Demidov S. Disk 1/Merged Images',
				'Frames - Demidov S. Disk 2/Merged Images',
					'Frames - Rykov V./Merged Images',
						'Frames - Tretyakov A./Merged Images');

	for ($countcatalog = 0; $countcatalog < @array_path_read;)
		{
		$path_read = $array_path_read[$countcatalog];
		$path_save = $array_path_save[$countcatalog];

		print "\n";
		opendir(DIRHANDLE, $path_read) or die "Не могу открыть каталог $path_read"; 

		print 'Чтение каталога ' . $path_read . ' - ';

		$countfile = 0;
		while ( defined ($filename = readdir(DIRHANDLE)) )
			{
			if ($filename ne '.' && $filename ne '..' && $filename ne 'Merged Images')
				{
				# Имена файлов в массив.
				$filename_array[$countfile] = $filename;
				$countfile++;
				}
			}

		closedir(DIRHANDLE);

		print 'Готово!' . "\n";

		print 'Сортировка... ';
			# sort - Буквы верхнего регистра предшествуют всем
			# буквам нижнего регистра, а цифры предшествуют буквам.
			@filename_array = sort(@filename_array);
				print 'Готово!' . "\n";
					print "\n";

		print 'Кадры в ' .  '\'' . $path_save . '\'' . ' будут перезаписаны!' . "\n";
		print 'Чтобы продолжить, нажмите Enter...' . "\n";
		<STDIN>;

		for ($countfile = 0; $countfile < @filename_array;)
			{
			print 'Объединяются изображения! Обработан кадр: ' . ($countfile + 1) . '.';
			print "\n";

			$newfilename = substr($filename_array[$countfile], 0, length($filename_array[$countfile]) - 4);
			$newfilename.= '.tga';

			$convert = "convert -composite -geometry +88+8 ";
			$convert.= "\'" . 'Vector-06C/Cinema-Screenshot.Contrast-50.Bright-40.png' . "\'";
			$convert.= ' ';
			$convert.= "\'" . $path_read . '/' . $filename_array[$countfile] . "\'";
			$convert.= ' ';
			$convert.= "-compress RLE -depth 24";
			$convert.= ' ';
			$convert.= "\'" . $path_save . '/' . $newfilename . "\'";
			`$convert`;

			$countfile++;
			}

		print "\n";

		$countcatalog++;
		}
