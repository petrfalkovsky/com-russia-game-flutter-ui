import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/formatters/styled_editing_controller.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_constants.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/base_plate.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class KzVersion extends BasePlateVersion {
  const KzVersion({
    super.key,
    required super.parts,
    required super.size,
    required super.editable,
    super.onChanged,
    super.scaleFactor,
  });

  @override
  State<KzVersion> createState() => _KzVersionState();
}

class _KzVersionState extends State<KzVersion> {
  TextStyle kzTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(32));

  String get formattedNumber {
    final number = widget.parts.number.toUpperCase();
    // Форматируем как 123ABC
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
              padding: EdgeInsets.only(left: widget.sized(26)),
              child: Center(
                child: Text(
                  formattedNumber,
                  style: kzTextStyle(context),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Секция региона - 25% ширины
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(right: widget.sized(0)),
              alignment: Alignment.center,
              child: Text(
                widget.parts.region,
                style: kzTextStyle(context),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
