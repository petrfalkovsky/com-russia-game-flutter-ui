import 'package:com_russia_game_flutter_ui/core/shared_widgets/car_plates/components/plates/base_plate.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_colors.dart';
import 'package:com_russia_game_flutter_ui/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class ExclusiveVersion extends BasePlateVersion {
  const ExclusiveVersion({
    super.key,
    required super.parts,
    required super.size,
    required super.editable,
    super.onChanged,
    super.scaleFactor,
  });

  @override
  State<ExclusiveVersion> createState() => _ExclusiveVersionState();
}

class _ExclusiveVersionState extends State<ExclusiveVersion> {
  TextStyle customTextStyle(BuildContext context) => AppFonts.fontHalvar32(
    context,
    AppColors.black,
    FontWeight.w500,
  ).copyWith(fontSize: widget.sized(24));

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.sized(8)),
          child: Text(
            widget.parts.number.isEmpty ? '' : widget.parts.number.toUpperCase(),
            style: customTextStyle(context),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
