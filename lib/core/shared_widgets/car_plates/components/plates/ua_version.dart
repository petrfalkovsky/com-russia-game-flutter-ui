import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/formatters/styled_editing_controller.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plate_constants.dart';
import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/base_plate.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class UaVersion extends BasePlateVersion {
  const UaVersion({
    super.key,
    required super.parts,
    required super.size,
    required super.editable,
    super.onChanged,
    super.scaleFactor,
  });

  @override
  State<UaVersion> createState() => _UaVersionState();
}

class _UaVersionState extends State<UaVersion> {
  TextStyle uaTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w400,
  ).copyWith(fontSize: widget.sized(32));

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        padding: EdgeInsets.only(left: widget.sized(16)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Регион
            Text(widget.parts.region, style: uaTextStyle(context)),
            SizedBox(width: widget.sized(4)),
            // Номер
            Text(widget.parts.number, style: uaTextStyle(context)),
            SizedBox(width: widget.sized(4)),
            // Серия
            Text(widget.parts.serial, style: uaTextStyle(context)),
          ],
        ),
      ),
    );
  }
}
