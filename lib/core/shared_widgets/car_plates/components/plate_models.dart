import 'package:com_russia_game_flutter_ui/core/theme/app_vectors.dart';

enum PlateCountry {
  ru,
  ua,
  by,
  kz,
  exclusive,
  none;

  double get aspectRatio {
    switch (this) {
      case PlateCountry.ua:
      case PlateCountry.by:
      case PlateCountry.ru:
      case PlateCountry.kz:
        return 410 / 92;
      case PlateCountry.exclusive:
      case PlateCountry.none:
        return 368 / 92;
    }
  }

  String get plateBackground {
    switch (this) {
      case PlateCountry.ru:
        return AppVectors.plateRus;
      case PlateCountry.ua:
        return AppVectors.plateUkrain;
      case PlateCountry.by:
        return AppVectors.plateBelarus;
      case PlateCountry.kz:
        return AppVectors.plateKazakhstan;
      case PlateCountry.exclusive:
      case PlateCountry.none:
        return AppVectors.plateEmptyRus;
    }
  }
}

// для частей номера
class PlateParts {
  final String number;
  final String region;
  final String serial;

  const PlateParts(this.number, [this.region = '', this.serial = '']);

  PlateParts copyWith({String? number, String? region, String? serial}) =>
      PlateParts(number ?? this.number, region ?? this.region, serial ?? this.serial);
}

extension PlateCountryParser on PlateCountry {
  /// Парсит данные с сервера в правильный формат для виджета
  PlateParts parseServerData({required String number, required String region, String? serial}) {
    switch (this) {
      case PlateCountry.ru:
        // Россия: number="М777ММ", region="777"
        return PlateParts(number, region);

      case PlateCountry.ua:
        // Украина: region="КМ", number="9265", serial="КМ"
        return PlateParts(number, region, serial ?? '');

      case PlateCountry.kz:
        // Казахстан: number="999 EPA", region="02" -> убираем пробел
        return PlateParts(number.replaceAll(' ', ''), region);

      case PlateCountry.by:
        // Беларусь: number="6246", serial="AB", region="7"
        return PlateParts(number, region, serial ?? '');

      default:
        return PlateParts(number, region, serial ?? '');
    }
  }
}
