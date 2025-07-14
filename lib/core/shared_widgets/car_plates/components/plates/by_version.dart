import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/formatters/styled_editing_controller.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_constants.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/base_plate.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class ByVersion extends BasePlateVersion {
  const ByVersion({
    super.key,
    required super.parts,
    required super.size,
    required super.editable,
    super.onChanged,
    super.scaleFactor,
  });

  @override
  State<ByVersion> createState() => _ByVersionState();
}

class _ByVersionState extends State<ByVersion> {
  TextStyle byTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(32), letterSpacing: 0);

  String get formattedNumber {
    return '${widget.parts.number} ${widget.parts.serial}';
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        padding: EdgeInsets.only(left: widget.sized(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Основной номер
            Text(formattedNumber, style: byTextStyle(context), textAlign: TextAlign.center),
            // Регион
            Text('-${widget.parts.region}', style: byTextStyle(context)),
          ],
        ),
      ),
    );
  }
}
