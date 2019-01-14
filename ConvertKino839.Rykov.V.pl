
# Perl5-5.26.2. Ukraine. (C) Demidov S.V.
# Пример вызова: $ perl 'ConvertKino839.Rykov.V.pl'

# Скрипт конвертирует созданную анимацию
# на компьютере Вектор-06Ц в bmp файлы.

	# Для объявления переменных.
	use strict;

	# В случае возникновений каких-либо проблем нужно остановить работу скрипта.
	use warnings FATAL => 'all';

# ---

	my $title_hex_bmp;    # Заголовок bmp файла.
	my $title_hex_bmp_sw; # Если 1, значит загололовок из переменной, иначе из файла 160x128_Gray.bmp.

	my $filename_839; # Имя файла с фильмом (образ гибкого диска Вектор-06Ц).

	my @array_839_hex;  # Массив с фильмом.
	my @array_bmp_hex;  # Массив с готовым изображением.
	my @array_low_4bit; # Массив для бит из младшей плоскости.
	my @array_top_4bit; # Массив для бит из старшей плоскости.

	my $temp; # Временный результат.

	my $low_plane_x;     # Адрес младшей плоскости в @array_839_hex.
	my $top_plane_x;     # Адрес старшей плоскости в @array_839_hex.
	my $file_bmp_length; # Длина в байтах bmp файла.

	my $plane_bmp_x;      # Координатат для bmp файла.
	my $push;             # Для запоминания координаты $plane_bmp_x.
	my $frame;            # Сколько кадров обработать.
	my $count_frame_zero; # Дополнить счетчик кадров нулями слева.

	my $x; # Столбец.
	my $y; # Строка.

# ---

# Очистить консоль.
system("clear");

# ---

	# 0 - заголовок взять из файла 160x128_Gray.bmp.
	# 1 - заголовок взять из переменной $title_hex_bmp.
	$title_hex_bmp_sw = 1;

	if ( $title_hex_bmp_sw == 1)
		{
		# Заголовок bmp файла.
		# Взято из 160x128_Gray.bmp.
		#    $ hd 160x128_Gray.bmp
		#      или
		#    $ bin2hex 160x128_Gray.bmp (для FreeBSD: /usr/ports/sysutils/hextools).
		$title_hex_bmp = '424d7a540000000000007a0400006c00'; # 0000.
		$title_hex_bmp.= '0000a000000080000000010008000000'; # 0010.
		$title_hex_bmp.= '000000500000130b0000130b00000001'; # 0020.
		$title_hex_bmp.= '00000001000042475273000000000000'; # 0030.
		$title_hex_bmp.= '00000000000000000000000000000000'; # 0040.
		$title_hex_bmp.= '00000000000000000000000000000000'; # 0050.
		$title_hex_bmp.= '00000000000000000000020000000000'; # 0060.
		$title_hex_bmp.= '00000000000000000000000000000101'; # 0070.
		$title_hex_bmp.= '01000202020003030300040404000505'; # 0080.
		$title_hex_bmp.= '05000606060007070700080808000909'; # 0090.
		$title_hex_bmp.= '09000a0a0a000b0b0b000c0c0c000d0d'; # 00A0.
		$title_hex_bmp.= '0d000e0e0e000f0f0f00101010001111'; # 00B0.
		$title_hex_bmp.= '11001212120013131300141414001515'; # 00C0.
		$title_hex_bmp.= '15001616160017171700181818001919'; # 00D0.
		$title_hex_bmp.= '19001a1a1a001b1b1b001c1c1c001d1d'; # 00E0.
		$title_hex_bmp.= '1d001e1e1e001f1f1f00202020002121'; # 00F0.
		$title_hex_bmp.= '21002222220023232300242424002525'; # 0100.
		$title_hex_bmp.= '25002626260027272700282828002929'; # 0110.
		$title_hex_bmp.= '29002a2a2a002b2b2b002c2c2c002d2d'; # 0120.
		$title_hex_bmp.= '2d002e2e2e002f2f2f00303030003131'; # 0130.
		$title_hex_bmp.= '31003232320033333300343434003535'; # 0140.
		$title_hex_bmp.= '35003636360037373700383838003939'; # 0150.
		$title_hex_bmp.= '39003a3a3a003b3b3b003c3c3c003d3d'; # 0160.
		$title_hex_bmp.= '3d003e3e3e003f3f3f00404040004141'; # 0170.
		$title_hex_bmp.= '41004242420043434300444444004545'; # 0180.
		$title_hex_bmp.= '45004646460047474700484848004949'; # 0190.
		$title_hex_bmp.= '49004a4a4a004b4b4b004c4c4c004d4d'; # 01A0.
		$title_hex_bmp.= '4d004e4e4e004f4f4f00505050005151'; # 01B0.
		$title_hex_bmp.= '51005252520053535300545454005555'; # 01C0.
		$title_hex_bmp.= '55005656560057575700585858005959'; # 01D0.
		$title_hex_bmp.= '59005a5a5a005b5b5b005c5c5c005d5d'; # 01E0.
		$title_hex_bmp.= '5d005e5e5e005f5f5f00606060006161'; # 01F0.
		$title_hex_bmp.= '61006262620063636300646464006565'; # 0200.
		$title_hex_bmp.= '65006666660067676700686868006969'; # 0210.
		$title_hex_bmp.= '69006a6a6a006b6b6b006c6c6c006d6d'; # 0220.
		$title_hex_bmp.= '6d006e6e6e006f6f6f00707070007171'; # 0230.
		$title_hex_bmp.= '71007272720073737300747474007575'; # 0240.
		$title_hex_bmp.= '75007676760077777700787878007979'; # 0250.
		$title_hex_bmp.= '79007a7a7a007b7b7b007c7c7c007d7d'; # 0260.
		$title_hex_bmp.= '7d007e7e7e007f7f7f00808080008181'; # 0270.
		$title_hex_bmp.= '81008282820083838300848484008585'; # 0280.
		$title_hex_bmp.= '85008686860087878700888888008989'; # 0290.
		$title_hex_bmp.= '89008a8a8a008b8b8b008c8c8c008d8d'; # 02A0.
		$title_hex_bmp.= '8d008e8e8e008f8f8f00909090009191'; # 02B0.
		$title_hex_bmp.= '91009292920093939300949494009595'; # 02C0.
		$title_hex_bmp.= '95009696960097979700989898009999'; # 02D0.
		$title_hex_bmp.= '99009a9a9a009b9b9b009c9c9c009d9d'; # 02E0.
		$title_hex_bmp.= '9d009e9e9e009f9f9f00a0a0a000a1a1'; # 02F0.
		$title_hex_bmp.= 'a100a2a2a200a3a3a300a4a4a400a5a5'; # 0300.
		$title_hex_bmp.= 'a500a6a6a600a7a7a700a8a8a800a9a9'; # 0310.
		$title_hex_bmp.= 'a900aaaaaa00ababab00acacac00adad'; # 0320.
		$title_hex_bmp.= 'ad00aeaeae00afafaf00b0b0b000b1b1'; # 0330.
		$title_hex_bmp.= 'b100b2b2b200b3b3b300b4b4b400b5b5'; # 0340.
		$title_hex_bmp.= 'b500b6b6b600b7b7b700b8b8b800b9b9'; # 0350.
		$title_hex_bmp.= 'b900bababa00bbbbbb00bcbcbc00bdbd'; # 0360.
		$title_hex_bmp.= 'bd00bebebe00bfbfbf00c0c0c000c1c1'; # 0370.
		$title_hex_bmp.= 'c100c2c2c200c3c3c300c4c4c400c5c5'; # 0380.
		$title_hex_bmp.= 'c500c6c6c600c7c7c700c8c8c800c9c9'; # 0390.
		$title_hex_bmp.= 'c900cacaca00cbcbcb00cccccc00cdcd'; # 03A0.
		$title_hex_bmp.= 'cd00cecece00cfcfcf00d0d0d000d1d1'; # 03B0.
		$title_hex_bmp.= 'd100d2d2d200d3d3d300d4d4d400d5d5'; # 03C0.
		$title_hex_bmp.= 'd500d6d6d600d7d7d700d8d8d800d9d9'; # 03D0.
		$title_hex_bmp.= 'd900dadada00dbdbdb00dcdcdc00dddd'; # 03E0.
		$title_hex_bmp.= 'dd00dedede00dfdfdf00e0e0e000e1e1'; # 03F0.
		$title_hex_bmp.= 'e100e2e2e200e3e3e300e4e4e400e5e5'; # 0400.
		$title_hex_bmp.= 'e500e6e6e600e7e7e700e8e8e800e9e9'; # 0410.
		$title_hex_bmp.= 'e900eaeaea00ebebeb00ececec00eded'; # 0420.
		$title_hex_bmp.= 'ed00eeeeee00efefef00f0f0f000f1f1'; # 0430.
		$title_hex_bmp.= 'f100f2f2f200f3f3f300f4f4f400f5f5'; # 0440.
		$title_hex_bmp.= 'f500f6f6f600f7f7f700f8f8f800f9f9'; # 0450.
		$title_hex_bmp.= 'f900fafafa00fbfbfb00fcfcfc00fdfd'; # 0460.
		$title_hex_bmp.= 'fd00fefefe00ffffff00';             # 0470. Конечный 479h = 1145d.
		}
		else
		{
		# Читаем первые 479h = 1145d байт файла.
		# Результат чтения в $temp.
		open (InFileBin, "<" . '160x128_Gray.bmp') or die "Ошибка...";
			sysread(InFileBin, $temp, 1146, 0);
				close (InFileBin);

		# H1145 - перекодировать 1145 байт в шестнадцатиричные символы.
		$title_hex_bmp = unpack('H2292', $temp);
		}

# ---

	$filename_839 = 'Disk Images 839/Rykov V.839';

	print "\n";
	print 'Считываем файл: ' . $filename_839 . '.';

	# Считываем весь фильм в массив.
	open (InFileBin, "<" . $filename_839) or die "Ошибка...";
		sysread(InFileBin, $temp, 839680, 0); #CCFFFh = 839679d.
			close (InFileBin);

	$temp = unpack('H' . 839680 * 2, $temp); # 839680 * 2 = 1 679 360.

	# Фильм в массив.
	@array_839_hex = split(//, $temp);

	print ' Готово!';
	print "\n";
	print "\n";

# ---

#	for ($x = 0; $x < 20480;)
#		{
#		$array_bmp_hex[$x] = '00';
#		$x++;
#		}

# ---

	$plane_bmp_x = 0;

	# Адрес младшей плоскости в @array_839_hex.
	$low_plane_x = 0;
	# Адрес старшей плоскости в @array_839_hex.
	$top_plane_x = 128 * 2;

	for ($frame = 0; $frame < 164;) # Обработать 164 кадра.
		{

		for ($x = 0; $x < 20;)
			{

			$push = $plane_bmp_x;

			for ($y = 0; $y < 128;)
				{

				# Младшая плоскость.
				# ---
				# Получить полбайта.
				$temp = $array_839_hex[$low_plane_x];
				# В двоичную систему.
				$temp = sprintf('%b', hex $temp);
				# Дополнить нулями слева (если нужно).
				$temp = sprintf("%04d", $temp);
				# Биты в массив.
				@array_low_4bit = split(//, $temp);

				# Старшая плоскость.
				# ---
				# Получить полбайта.
				$temp = $array_839_hex[$top_plane_x];
				# В двоичную систему.
				$temp = sprintf('%b', hex $temp);
				# Дополнить нулями слева (если нужно).
				$temp = sprintf("%04d", $temp);
				# Биты в массив.
				@array_top_4bit = split(//, $temp);

				# Кодируем. Бит 7.
				if ($array_low_4bit[0] eq '0' && $array_top_4bit[0] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '00';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[0] eq '0' && $array_top_4bit[0] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'aa';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[0] eq '1' && $array_top_4bit[0] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '55';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[0] eq '1' && $array_top_4bit[0] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'ff';
					$plane_bmp_x++;
					}

				# Кодируем. Бит 6.
				if ($array_low_4bit[1] eq '0' && $array_top_4bit[1] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '00';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[1] eq '0' && $array_top_4bit[1] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'aa';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[1] eq '1' && $array_top_4bit[1] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '55';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[1] eq '1' && $array_top_4bit[1] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'ff';
					$plane_bmp_x++;
					}

				# Кодируем. Бит 5.
				if ($array_low_4bit[2] eq '0' && $array_top_4bit[2] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '00';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[2] eq '0' && $array_top_4bit[2] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'aa';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[2] eq '1' && $array_top_4bit[2] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '55';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[2] eq '1' && $array_top_4bit[2] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'ff';
					$plane_bmp_x++;
					}

				# Кодируем. Бит 4.
				if ($array_low_4bit[3] eq '0' && $array_top_4bit[3] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '00';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[3] eq '0' && $array_top_4bit[3] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'aa';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[3] eq '1' && $array_top_4bit[3] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '55';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[3] eq '1' && $array_top_4bit[3] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'ff';
					$plane_bmp_x++;
					}

				$low_plane_x++;
				$top_plane_x++;

				# Младшая плоскость.
				# ---
				# Получить полбайта.
				$temp = $array_839_hex[$low_plane_x];
				# В двоичную систему.
				$temp = sprintf('%b', hex $temp);
				# Дополнить нулями слева (если нужно).
				$temp = sprintf("%04d", $temp);
				# Биты в массив.
				@array_low_4bit = split(//, $temp);

				# Старшая плоскость.
				# ---
				# Получить полбайта.
				$temp = $array_839_hex[$top_plane_x];
				# В двоичную систему.
				$temp = sprintf('%b', hex $temp);
				# Дополнить нулями слева (если нужно).
				$temp = sprintf("%04d", $temp);
				# Биты в массив.
				@array_top_4bit = split(//, $temp);

				# Кодируем. Бит 3.
				if ($array_low_4bit[0] eq '0' && $array_top_4bit[0] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '00';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[0] eq '0' && $array_top_4bit[0] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'aa';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[0] eq '1' && $array_top_4bit[0] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '55';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[0] eq '1' && $array_top_4bit[0] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'ff';
					$plane_bmp_x++;
					}

				# Кодируем. Бит 2.
				if ($array_low_4bit[1] eq '0' && $array_top_4bit[1] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '00';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[1] eq '0' && $array_top_4bit[1] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'aa';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[1] eq '1' && $array_top_4bit[1] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '55';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[1] eq '1' && $array_top_4bit[1] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'ff';
					$plane_bmp_x++;
					}

				# Кодируем. Бит 1.
				if ($array_low_4bit[2] eq '0' && $array_top_4bit[2] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '00';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[2] eq '0' && $array_top_4bit[2] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'aa';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[2] eq '1' && $array_top_4bit[2] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '55';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[2] eq '1' && $array_top_4bit[2] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'ff';
					$plane_bmp_x++;
					}

				# Кодируем. Бит 0.
				if ($array_low_4bit[3] eq '0' && $array_top_4bit[3] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '00';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[3] eq '0' && $array_top_4bit[3] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'aa';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[3] eq '1' && $array_top_4bit[3] eq '0')
					{
					$array_bmp_hex[$plane_bmp_x] = '55';
					$plane_bmp_x++;
					}
				if ($array_low_4bit[3] eq '1' && $array_top_4bit[3] eq '1')
					{
					$array_bmp_hex[$plane_bmp_x] = 'ff';
					$plane_bmp_x++;
					}

				$plane_bmp_x = $plane_bmp_x - 8 + 160;

				$low_plane_x++;
				$top_plane_x++;

				$y++;
				}

			$low_plane_x = $low_plane_x + 256;
			$top_plane_x = $top_plane_x + 256;

			$plane_bmp_x = $push;
			$plane_bmp_x = $plane_bmp_x + 8;

			$x++;
			}

		$plane_bmp_x = 0;

		$temp = $title_hex_bmp . join('', @array_bmp_hex);
		$file_bmp_length = length($temp) / 2;
		$temp = pack('H' . length($temp), $temp);

		# Дополнить счетчик нулями слева.
		$count_frame_zero = sprintf("%03d", $frame);

		print ' Записываем bmp файл.';
		print ' Файл: ' . $count_frame_zero . '.bmp.';
		print ' Длина bmp файла в байтах: ' . $file_bmp_length . ' байт.' . "\n";

		# Записать изображение (файл bmp).
		open (InFileBin, ">" . 'Frames - Rykov V./' . $count_frame_zero . '.bmp') or die "Ошибка...";
			syswrite(InFileBin, $temp, $file_bmp_length, 0);
				close (InFileBin);

		$frame++;
		}

# ---

	print "\n";
	print ' Готово!';
	print "\n";

	print "\n";
