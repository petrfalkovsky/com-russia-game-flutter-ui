import 'package:flutter/material.dart';

class PlateInfo {
  final String region;
  final String number;
  final String country;

  PlateInfo({
    required this.region,
    required this.number,
    required this.country,
  });
}

class LicensePlateWidget extends StatelessWidget {
  final PlateInfo? plateInfo;
  final double width;
  final double height;
  final VoidCallback? onTap;

  const LicensePlateWidget({
    Key? key,
    this.plateInfo,
    this.width = 195,
    this.height = 45,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (plateInfo == null) {
      return _buildEmptyPlate();
    }

    return GestureDetector(
      onTap: onTap,
      child: _buildPlateByCountry(),
    );
  }

  Widget _buildEmptyPlate() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: Colors.grey[500]!, width: 1),
      ),
      child: Center(
        child: Text(
          'НЕТ НОМЕРА',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: height * 0.25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildPlateByCountry() {
    switch (plateInfo!.country) {
      case 'RU':
        return _buildRussianPlate();
      case 'UA':
        return _buildUkrainianPlate();
      case 'KZ':
        return _buildKazakhstanPlate();
      case 'BY':
        return _buildBelarusPlate();
      default:
        return _buildEmptyPlate();
    }
  }

  Widget _buildRussianPlate() {
    // Для российских номеров: number может быть "A777AA" или "A 777 AA"
    // region - это отдельно "777" или "77"
    String displayNumber = plateInfo!.number;
    
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Российский флаг (слева)
          Container(
            width: width * 0.08,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                bottomLeft: Radius.circular(2),
              ),
            ),
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.white)),
                Expanded(child: Container(color: Color(0xFF0039A6))),
                Expanded(child: Container(color: Color(0xFFD52B1E))),
              ],
            ),
          ),
          
          // Основной номер
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    displayNumber,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.65,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'monospace',
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          // Регион и RUS
          Container(
            width: width * 0.22,
            padding: EdgeInsets.symmetric(vertical: height * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      plateInfo!.region,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.35,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'RUS',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUkrainianPlate() {
    // Для украинских номеров формат может быть "AK 9265 AK" или "AK9265AK"
    String displayText = plateInfo!.number;
    
    // Если region отдельно передается, используем его + номер
    if (plateInfo!.region.isNotEmpty && !plateInfo!.number.contains(plateInfo!.region)) {
      displayText = '${plateInfo!.region} ${plateInfo!.number}';
    }
    
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Украинский флаг
          Container(
            width: width * 0.06,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                bottomLeft: Radius.circular(2),
              ),
            ),
            child: Column(
              children: [
                Expanded(child: Container(color: Color(0xFF005BBB))),
                Expanded(child: Container(color: Color(0xFFFFD500))),
              ],
            ),
          ),
          
          // Номер
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    displayText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.55,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKazakhstanPlate() {
    // Для казахских номеров: number + region отдельно
    String displayNumber = plateInfo!.number;
    
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Флаг Казахстана (упрощенно)
          Container(
            width: width * 0.06,
            height: height,
            color: Color(0xFF00AFCA),
            child: Center(
              child: Container(
                width: width * 0.03,
                height: width * 0.03,
                decoration: BoxDecoration(
                  color: Color(0xFFFFCC00),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          
          // Основной номер
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.01),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    displayNumber,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.55,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          // Регион
          Container(
            width: width * 0.15,
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  plateInfo!.region,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: height * 0.45,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBelarusPlate() {
    // Для белорусских номеров формат "6246 AB-7" или раздельно
    String displayText = plateInfo!.number;
    
    // Если номер не содержит дефис, добавляем регион
    if (!plateInfo!.number.contains('-') && plateInfo!.region.isNotEmpty) {
      displayText = '${plateInfo!.number}-${plateInfo!.region}';
    }
    
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Флаг Беларуси
          Container(
            width: width * 0.06,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                bottomLeft: Radius.circular(2),
              ),
            ),
            child: Column(
              children: [
                Expanded(child: Container(color: Color(0xFFCE1126))),
                Expanded(child: Container(color: Color(0xFF006A44))),
              ],
            ),
          ),
          
          // Номер
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    displayText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.55,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}