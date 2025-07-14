import 'package:com_russia_game_flutter_ui/core/extensions/context_extension.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_models.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/by_version.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/exclusive_version.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/kz_version.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/ru_version.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/ua_version.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_webp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarPlateWidget extends StatelessWidget {
  final PlateCountry plateCountry;
  final PlateParts parts;
  final bool editable;
  final void Function(PlateParts parts)? onChanged;
  final double scaleFactor;

  const CarPlateWidget({
    super.key,
    required this.plateCountry,
    required this.parts,
    this.onChanged,
    this.editable = false,
    this.scaleFactor = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    const expectedHeight = 45.0;

    return AspectRatio(
      aspectRatio: plateCountry.aspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Основной фон
              plateCountry == PlateCountry.none
                  ? Image.asset(
                      AppWepb.plateEmptyRus, // ← WebP с рамкой
                      fit: BoxFit.fill,
                    )
                  : SvgPicture.asset(plateCountry.plateBackground, fit: BoxFit.fill),
              // Контент номера
              plateCountry == PlateCountry.none
                  ? _buildNoneContent(context, constraints.maxHeight / expectedHeight)
                  : _buildPlateContent(context, constraints.maxHeight / expectedHeight),
            ],
          );
        },
      ),
    );
  }

  // контент для пустого номера
  Widget _buildNoneContent(BuildContext context, double size) {
    return Positioned.fill(
      child: Center(
        child: Text(
          context.locales.plates_no_has_number.toUpperCase(),
          style: AppFonts.fontHalvar20(
            context,
            AppColors.black,
            FontWeight.w400,
          ).copyWith(fontSize: 18 * size * scaleFactor, letterSpacing: 4.6),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildPlateContent(BuildContext context, double size) {
    switch (plateCountry) {
      case PlateCountry.kz:
        return KzVersion(
          parts: parts,
          size: size,
          editable: editable,
          onChanged: onChanged,
          scaleFactor: scaleFactor,
        );
      case PlateCountry.ru:
        return RuVersion(
          parts: parts,
          size: size,
          editable: editable,
          onChanged: onChanged,
          scaleFactor: scaleFactor,
        );
      case PlateCountry.by:
        return ByVersion(
          parts: parts,
          size: size,
          editable: editable,
          onChanged: onChanged,
          scaleFactor: scaleFactor,
        );
      case PlateCountry.ua:
        return UaVersion(
          parts: parts,
          size: size,
          editable: editable,
          onChanged: onChanged,
          scaleFactor: scaleFactor,
        );
      case PlateCountry.exclusive:
        return ExclusiveVersion(
          parts: parts,
          size: size,
          editable: editable,
          onChanged: onChanged,
          scaleFactor: scaleFactor,
        );
      default:
        return const SizedBox();
    }
  }
}
