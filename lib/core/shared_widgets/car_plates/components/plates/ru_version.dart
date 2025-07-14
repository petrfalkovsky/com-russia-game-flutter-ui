import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/formatters/styled_editing_controller.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/formatters/upper_case_text_formatter.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_constants.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/base_plate.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class RuVersion extends BasePlateVersion {
  const RuVersion({
    super.key,
    required super.parts,
    required super.size,
    required super.editable,
    super.onChanged,
    super.scaleFactor,
  });

  @override
  State<RuVersion> createState() => _RuVersionState();
}

class _RuVersionState extends State<RuVersion> {
  TextStyle ruMainTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(32));

  TextStyle ruRegionTextStyle(BuildContext context) => AppFonts.fontHalvar22(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(21));

  String get formattedNumber {
    final number = widget.parts.number.toUpperCase();
    if (number.length >= 6) {
      return '${number[0]} ${number.substring(1, 4)} ${number.substring(4, 6)}';
    }
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Основная часть номера - 75% ширины
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: widget.sized(16)),
              child: Center(
                child: Text(
                  formattedNumber,
                  style: ruMainTextStyle(context),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Секция региона - 25% ширины
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(bottom: widget.sized(10)),
              alignment: Alignment.center,
              child: Text(
                widget.parts.region,
                style: ruRegionTextStyle(context),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
