
# Платформа: FreeBSD, Linux и т.п.

# Perl5-5.26.2. Ukraine. (C) Demidov S.V.
# Пример вызова: $ perl File160x128Graybmp2Hex.pl >160x128_Gray.bmp.hex

	# Для объявления переменных.
	use strict;

	# В случае возникновений каких-либо проблем нужно остановить работу скрипта.
	use warnings FATAL => 'all';

	# Верхний регистр.
	use locale;

# Очистить консоль.
# system('clear');

	# Объявление переменных.
	my $title_hex; # Заголовок bmp файла.
	my $temp;      # Временный результат.
	my $array;     # Счётчик для массива @array_title_hex.
	my $addr;      # Адрес.

	# Объявление массива.
	my @array_title_hex;

	# Получаем заголовок с 0-479h = 0-1145d.
	$title_hex = `hd -n 1146 -v 160x128_Gray.bmp`;

	# Разделить по \n и поместить в массив
	@array_title_hex = split('\n', $title_hex);

	$addr = 0;
	for ($array = 0; $array < @array_title_hex - 1;)
		{
		# Отрезать адрес.
		$temp = substr($array_title_hex[$array], 10);
		# Отрезать ASCII.
		$temp = substr($temp, 0, 48);

		# Удвляем пробелы в строке.
		$_ = $temp;
		s/ //g;
		$temp = $_;

		# Добавляем одинарные кавачки.
		$temp = "'" . $temp . "'";

		# Добавляем точку с запятой.
		$temp = $temp . ';';

		# Добавляем адрес с правой стороны.
		$temp = $temp . ' # ' . uc(sprintf("%04x", $addr)) . '.';

		print $temp;
		print "\n";

		$addr = $addr + 16;
		$array++;
		}
