import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_models.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/by_version.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/exclusive_version.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/kz_version.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/ru_version.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/ua_version.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


// ПРИМЕР использования когда приходят данные с сервера
// void handleServerPlateData(Map<String, dynamic> serverData) {
//   final country = PlateCountry.values.firstWhere(
//     (c) => c.name.toUpperCase() == serverData['country'],
//     orElse: () => PlateCountry.none,
//   );
  
//   final parts = country.parseServerData(
//     number: serverData['number'] ?? '',
//     region: serverData['region'] ?? '',
//     serial: serverData['serial'],
//   );
  
//   // Теперь можно использовать в виджете
//   CarPlateWidget(
//     plateCountry: country,
//     parts: parts,
//     editable: true,
//   );
// }

class CarPlateWidget extends StatelessWidget {
  final PlateCountry plateCountry;
  final PlateParts parts;
  final bool editable;
  final void Function(PlateParts parts)? onChanged;

  const CarPlateWidget({
    super.key,
    required this.plateCountry,
    required this.parts,
    this.onChanged,
    this.editable = false,
  });

  @override
  Widget build(BuildContext context) {
    const expectedHeight = 45.0;

    return AspectRatio(
      aspectRatio: plateCountry.aspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return plateCountry == PlateCountry.none
              ? SvgPicture.asset(AppVectors.plateEmptyRus, fit: BoxFit.fill)
              : Stack(
                  fit: StackFit.expand,
                  children: [
                    SvgPicture.asset(plateCountry.plateBackground, fit: BoxFit.fill),
                    _buildPlateContent(context, constraints.maxHeight / expectedHeight),
                  ],
                );
        },
      ),
    );
  }

  Widget _buildPlateContent(BuildContext context, double size) {
    switch (plateCountry) {
      case PlateCountry.kz:
        return KzVersion(parts: parts, size: size, editable: editable, onChanged: onChanged);
      case PlateCountry.ru:
        return RuVersion(parts: parts, size: size, editable: editable, onChanged: onChanged);
      case PlateCountry.by:
        return ByVersion(parts: parts, size: size, editable: editable, onChanged: onChanged);
      case PlateCountry.ua:
        return UaVersion(parts: parts, size: size, editable: editable, onChanged: onChanged);
      case PlateCountry.exclusive:
        return ExclusiveVersion(parts: parts, size: size, editable: editable, onChanged: onChanged);
      default:
        return const SizedBox();
    }
  }
}
