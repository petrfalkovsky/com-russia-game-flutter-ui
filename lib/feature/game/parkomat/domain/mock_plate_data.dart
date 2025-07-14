import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_models.dart';

class MockPlateData {
  final String region;
  final String number;
  final String country;
  final String? serial;

  const MockPlateData({
    required this.region,
    required this.number,
    required this.country,
    this.serial,
  });

  // Конвертация в наш формат
  PlateParts toPlateParts() {
    final plateCountry = _stringToPlateCountry(country);
    return plateCountry.parseServerData(
      number: number,
      region: region,
      serial: serial,
    );
  }

  PlateCountry get plateCountry => _stringToPlateCountry(country);

  PlateCountry _stringToPlateCountry(String countryCode) {
    switch (countryCode.toUpperCase()) {
      case 'RU':
        return PlateCountry.ru;
      case 'UA':
        return PlateCountry.ua;
      case 'KZ':
        return PlateCountry.kz;
      case 'BY':
        return PlateCountry.by;
      case 'BR':
        return PlateCountry.brazil;
      default:
        return PlateCountry.none;
    }
  }
}

// Мок данные для всех стран
class MockPlatesData {
  static const List<MockPlateData> mockPlates = [
    // Россия
    MockPlateData(region: '777', number: 'М777ММ', country: 'RU'),
    MockPlateData(region: '199', number: 'А123ВС', country: 'RU'),
    MockPlateData(region: '77', number: 'К999МР', country: 'RU'),
    
    // Украина
    MockPlateData(region: 'КМ', number: '9265', country: 'UA', serial: 'КМ'),
    MockPlateData(region: 'АА', number: '1234', country: 'UA', serial: 'ВВ'),
    MockPlateData(region: 'ХХ', number: '5678', country: 'UA', serial: 'УУ'),
    
    // Казахстан
    MockPlateData(region: '02', number: '999 EPA', country: 'KZ'),
    MockPlateData(region: '01', number: '123 ABC', country: 'KZ'),
    MockPlateData(region: '05', number: '456 KMH', country: 'KZ'),
    
    // Беларусь
    MockPlateData(region: '7', number: '6246', country: 'BY', serial: 'AB'),
    MockPlateData(region: '1', number: '1234', country: 'BY', serial: 'CD'),
    MockPlateData(region: '3', number: '9876', country: 'BY', serial: 'EF'),
    
    // Эксклюзивный
    MockPlateData(region: '', number: 'GRAND', country: 'EXCLUSIVE'),
    MockPlateData(region: '', number: 'VIP', country: 'EXCLUSIVE'),
    
    // Пустой номер
    MockPlateData(region: '', number: '', country: 'NONE'),
  ];

  // Получить случайный номер
  static MockPlateData getRandomPlate(int index) {
    return mockPlates[index % mockPlates.length];
  }
}